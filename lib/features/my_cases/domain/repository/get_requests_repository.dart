import 'package:test_interview/core/models/response_model.dart';

abstract class GetRequestsRepository {
  /// get all requests
  Future<ResponseModel> getAllRequests(String tab, int page);
}
