import 'package:circ/core/constant/api_endpoints.dart';
import 'package:circ/core/networks/api_client.dart';
import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/help/help_request_model.dart';

class HelpRemoteDataSource {
  final ApiClient apiClient = ApiClient(ApiPath.baseUrl);

  Future<ApiResponse> submitHelpRequest(HelpRequestModel request) async {
    try {
      final response = await apiClient.post(
        endpoint: ApiPath.help,
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return ApiResponse.fromJson(response.data, (json) => json);
      } else {
        throw Exception(
          response.data['message'] ?? 'Failed to submit help request',
        );
      }
    } catch (e) {
      throw Exception('Error submitting help request: $e');
    }
  }
}
