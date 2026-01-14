import 'dart:developer';

import 'package:circ/core/constant/global.dart';
import 'package:circ/data/models/help/help_request_model.dart';
import 'package:circ/domain/repository/help_repository.dart';
import 'package:circ/utils/custom_widgets/customer_support_dialog.dart';
import 'package:circ/utils/helpers/message_helper.dart';
import 'package:flutter/material.dart';

class CustomerSupportViewModel extends ChangeNotifier {
  final HelpRepository _helpRepository = getIt<HelpRepository>();

  final List<String> supportOptions = [
    'I didn\'t receive the item',
    'I want to return or exchange',
    'Item is not as described',
    'Payment issue or refund',
    'Seller not responding',
    'Report technical problem',
  ];

  final Set<String> selectedOptions = {};
  final TextEditingController descriptionController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void toggleOption(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
    notifyListeners();
  }

  bool validateForm() {
    if (selectedOptions.isEmpty) {
      return false;
    }

    if (descriptionController.text.trim().isEmpty) {
      return false;
    }

    return true;
  }

  String? getValidationError() {
    if (selectedOptions.isEmpty) {
      return 'Please select at least one option.';
    }

    if (descriptionController.text.trim().isEmpty) {
      return 'Please provide a description of your problem.';
    }

    return null;
  }

  Future<bool> submitSupportRequest(
    String orderId,
    BuildContext context,
  ) async {
    final validationError = getValidationError();
    if (validationError != null) {
      MessageHelper.showErrorMessage(context, validationError);
      return false;
    }

    _setLoading(true);

    try {
      final request = HelpRequestModel(
        reasons: selectedOptions.toList(),
        description: descriptionController.text.trim(),
        orderId: orderId,
      );

      final response = await _helpRepository.submitHelpRequest(request);

      if (response.success) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) => ContactSupportDialog(
                title: "Your query has been submitted",
                subtitle:
                    "someone from the team\nwill reach out to you shortly.",
                messageTitle: "Payment Problem in my listing...",
                messageBody: "Hi team, I have issue with product paym...",
              ),
            );
          }
        });

        _setLoading(false);
        return true;
      } else {
        if (context.mounted) {
          MessageHelper.showErrorMessage(context, response.message);
        } else {
          debugPrint('context is not mounted');
        }
        _setLoading(false);
        return false;
      }
    } catch (e) {
      if (context.mounted) {
        // MessageHelper.showErrorMessage(
        //   context,
        //   'Failed to submit help request. Please try again.',
        // );
        log("error submitSupportRequest: $e");
      } else {
        debugPrint('context is not mounted');
      }
      _setLoading(false);
      return false;
    } finally {
      //clear values too
      clearForm();
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void clearForm() {
    selectedOptions.clear();
    descriptionController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }
}
