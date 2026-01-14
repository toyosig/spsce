import 'package:circ/data/models/api/api_response.dart';
import 'package:circ/data/models/help/help_request_model.dart';

abstract class HelpRepository {
  Future<ApiResponse> submitHelpRequest(HelpRequestModel request);
}
