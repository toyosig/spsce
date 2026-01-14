// import 'package:circ/core/constant/api_endpoints.dart';
// import 'package:circ/core/constant/box_names.dart';
// import 'package:circ/domain/services/hive_services.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';


// class QueueProcessorService {
//   final ApiClient apiClient = ApiClient(ApiPath.baseUrl);

//   Future<void> processQueue() async {
//     final hiveService =
//         HiveService<QueuedActionNew>(boxName: BoxNames.queuedActions);
//     await hiveService.initialize();

//     final queuedActions = await hiveService.getAllItems();

//     for (final action in queuedActions) {
//       try {
//         await _handleAction(action);
//         await hiveService.deleteItem(int.tryParse(action.key)!);
//       } catch (error) {
//         debugPrint("Retry failed for action: ${action.key}, error: $error");
//       }
//     }
//   }

//   Future<void> queueOfflineRequest(
//     String endpoint, {
//     required String request,
//     Map<String, dynamic>? body,
//   }) async {
//     final hiveService = HiveService<QueuedActionNew>(
//       boxName: BoxNames.queuedActions,
//     );
//     await hiveService.initialize();

//     final action = QueuedActionNew(
//       endpoint: endpoint,
//       body: body ?? {},
//       method: request,
//       key: DateTime.now().millisecondsSinceEpoch.toString(),
//     );
//     await hiveService.addItem(action);
//   }

//   Future<void> _handleAction(QueuedActionNew action) async {
//     switch (action.method) {
//       case 'POST':
//         await _handlePost(action);
//         break;
//       case 'PUT':
//         await _handlePut(action);
//         break;
//       case 'DELETE':
//         await _handleDelete(action);
//         break;
//       case "putFormData":
//         await _handlEPutFormData(action);
//         break;
//       default:
//         throw UnsupportedError('Unsupported HTTP method: ${action.method}');
//     }
//   }

//   Future<void> _handlePost(QueuedActionNew action) async {
//     final response = await apiClient.post(
//       endpoint: action.endpoint,
//       data: action.body,
//     );
//     debugPrint("POST Response: ${response.data}");
//   }

//   Future<void> _handlePut(QueuedActionNew action) async {
//     final response = await apiClient.put(
//       endpoint: action.endpoint,
//       data: action.body,
//     );
//     debugPrint("PUT Response: ${response.data}");
//   }

//   Future<void> _handlEPutFormData(QueuedActionNew action) async {
//     if (action.body["profilePic"] != null && action.body["profilePic"] != '') {
//       action.body["profilePic"] = await MultipartFile.fromFile(
//         action.body["profilePic"].path,
//         filename: 'profilePic.jpg',
//         contentType: DioMediaType('image', 'jpeg'),
//       );
//     }

//     final data = FormData.fromMap(action.body);

//     final response = await apiClient.putFormData(
//       endpoint: action.endpoint,
//       options: Options(
//         headers: {'accept': 'application/json'},
//       ),
//       formData: data,
//     );
//     debugPrint("PUT Response: ${response.data}");
//   }

//   Future<void> _handleDelete(QueuedActionNew action) async {
//     final response = await apiClient.delete(
//       endpoint: action.endpoint,
//       data: action.body,
//     );
//     debugPrint("DELETE Response: ${response.data}");
//   }
// }
