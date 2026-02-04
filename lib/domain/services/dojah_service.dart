import 'package:circ/data/models/dojah/account_verification_model.dart';
import 'package:circ/data/models/dojah/bank_model.dart';
import 'package:circ/data/models/dojah/bvn_verification_result_model.dart';
import 'package:circ/data/models/dojah/nin_verification_result_model.dart';
import 'package:dio/dio.dart';

class DojahService {
  static const String appId = "689cb216e24ef5994c732fa1";
  static const String productionPublicKey = "prod_pk_NGUZCdBDEY9EwdWkjlSQ1AOUg";
  static const String productionPrivateKey =
      "prod_sk_TmD5rIyHqIyqojxJBtzHOp23I";
  static const String baseUrl = "https://api.dojah.io";

  AccountVerification? accountVerification;
  BVNVerificationResult? bvnVerification;
  NINVerificationResult? ninVerification;
  List<BankModel> availableBanks = [];
  BankModel? selectedBank;

  final Dio client = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {'AppId': appId, 'Authorization': productionPrivateKey},
    ),
  );

  Future<void> getBanks() async {
    final response = await client.get('/api/v1/general/banks');
    if (response.statusCode == 200) {
      final body = response.data;
      final List<dynamic> items =
          (body['entity'] ?? body['data'] ?? []) as List<dynamic>;
      availableBanks = items
          .map((e) => BankModel.fromJson(e as Map<String, dynamic>))
          .map((bank) {
            // Replace Paycom with Opay
            if (bank.name?.toLowerCase() == 'paycom' || 
                bank.name?.toLowerCase().contains('paycom') == true) {
              return BankModel(
                name: 'Opay',
                code: bank.code,
              );
            }
            return bank;
          })
          .toList();
    }
  }

  Future<void> verifyAccount({
    required String bankCode,
    required String accountNumber,
  }) async {
    accountVerification = null;
    try {
      final response = await client.get(
        '/api/v1/general/account?bank_code=$bankCode&account_number=$accountNumber',
      );
      if (response.statusCode == 200 && response.data != null) {
        final entity = response.data['entity'];
        if (entity is Map<String, dynamic>) {
          accountVerification = AccountVerification.fromJson(entity);
          return;
        }
      }
      throw Exception('Account verification failed');
    } catch (e) {
      accountVerification = null;
      rethrow;
    }
  }

  Future<void> verifyBVN({required String bvn}) async {
    bvnVerification = null;
    try {
      final response = await client.get('/api/v1/kyc/bvn/full?bvn=$bvn');
      if (response.statusCode == 200 && response.data != null) {
        final entity = response.data['entity'];
        if (entity is Map<String, dynamic>) {
          bvnVerification = BVNVerificationResult.fromJson(entity);
          return;
        }
      }
      throw Exception('BVN verification failed');
    } catch (e) {
      bvnVerification = null;
      rethrow;
    }
  }

  Future<void> verifyNIN({required String nin}) async {
    ninVerification = null;
    try {
      final response = await client.get('/api/v1/kyc/nin?nin=$nin');
      if (response.statusCode == 200 && response.data != null) {
        final entity = response.data['entity'];
        if (entity is Map<String, dynamic>) {
          ninVerification = NINVerificationResult.fromJson(entity);
          return;
        }
      }
      throw Exception('NIN verification failed');
    } catch (e) {
      ninVerification = null;
      rethrow;
    }
  }

  String getBankCode({required String bankName}) {
    // Handle both Opay and Paycom for backward compatibility
    final searchName = bankName.toLowerCase();
    final bank = availableBanks.firstWhere(
      (element) {
        final name = element.name?.toLowerCase() ?? '';
        return name == searchName || 
               (searchName == 'opay' && name == 'paycom') ||
               (searchName == 'paycom' && name == 'opay');
      },
    );
    return bank.code ?? "0";
  }

  void resetAccount() {
    accountVerification = null;
  }
}