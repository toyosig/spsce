import 'package:circ/core/constant/global.dart';
import 'package:circ/data/data_sources/remote/help_rds.dart';
import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/help/help_request_model.dart';
import 'package:circ/domain/repository/help_repository.dart';

class HelpRepoImpl extends HelpRepository {
  final HelpRemoteDataSource _helpRemoteDataSource = getIt
      .get<HelpRemoteDataSource>();

  @override
  Future<ApiResponse> submitHelpRequest(HelpRequestModel request) async {
    try {
      final response = await _helpRemoteDataSource.submitHelpRequest(request);
      return response;
    } catch (e) {
      throw Exception('Error in help repository: $e');
    }
  }
}
