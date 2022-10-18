import 'package:get/get.dart';
import 'package:test_interview/core/models/response_model.dart';
import 'package:test_interview/core/utils/request_status.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_header_entity.dart';
import 'package:test_interview/features/my_cases/domain/usecase/get_requests_usecase.dart';

class RequestController extends GetxController {
  final GetRequestsUseCase _getRequestsUseCase;
  RequestController(this._getRequestsUseCase);

  RequestHeaderEntity requestHeader = RequestHeaderEntity();
  String? error;

  RequestStatus requestListStatus = RequestStatus();
  @override
  void onInit() {
    getRequests();
    super.onInit();
  }

  getRequests() async {
    requestListStatus.loading();
    update();
    ResponseModel response =
        await _getRequestsUseCase(Params(page: 1, tab: "issuance"));
    if (response.status == 200) {
      requestHeader = response.data;
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
}
