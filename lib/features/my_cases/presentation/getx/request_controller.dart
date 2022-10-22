import 'package:get/get.dart';
import 'package:test_interview/core/models/response_model.dart';
import 'package:test_interview/core/utils/request_status.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_header_entity.dart';
import 'package:test_interview/features/my_cases/domain/usecase/get_requests_usecase.dart';

import '../../data/models/request_model.dart';

class RequestController extends GetxController {
  final GetRequestsUseCase _getRequestsUseCase;
  RequestController(this._getRequestsUseCase);

  RequestHeaderEntity requestHeader = RequestHeaderEntity();
  RequestHeaderEntity searchHeader = RequestHeaderEntity();

  String? error;

  RequestStatus requestListStatus = RequestStatus();
  @override
  void onInit() {
    getRequests();
    super.onInit();
  }

  getRequests({int? page}) async {
    requestListStatus.loading();
    update();
    ResponseModel response =
        await _getRequestsUseCase(Params(page: page ?? 1, tab: "issuance"));
    if (response.status == 200) {
      requestHeader = response.data;
      // since dart is call by reference in equalling models this is the fastest way to equlize
      searchHeader.current = requestHeader.current;
      searchHeader.pageCount = requestHeader.pageCount;
      searchHeader.results = requestHeader.results;
      //
      requestListStatus.success();
      update();
    } else {
      error = response.error;
      requestListStatus.error(
        response.error ?? '',
      );
      update();
    }
  }

  search(String value) {
    List<Request> results = [];
    for (Request element in searchHeader.results!) {
      if (element.orderId?.contains(value) ?? false) {
        results.add(element);
      }
    }
    if (results.length >= 10) {
      requestHeader.pageCount = searchHeader.pageCount;
    } else {
      requestHeader.pageCount = 1;
    }
    requestHeader.current = 1;
    requestHeader.results = results;
    update();
  }
}
