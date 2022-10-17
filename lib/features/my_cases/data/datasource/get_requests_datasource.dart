import 'package:test_interview/core/models/enum.dart';
import 'package:test_interview/core/models/query_model.dart';
import 'package:test_interview/core/models/response_model.dart';
import 'package:test_interview/core/routing/request_list_routing.dart';
import 'package:test_interview/features/my_cases/data/models/request_header_model.dart';

import '../../../../core/network/api.dart';

abstract class GetRequestsDataSource {
  /// get all requests api call
  Future<ResponseModel> getAllRequests(String tab, int page);
}

class GetRequestsDataSourceImpl extends GetRequestsDataSource {
  GetRequestsDataSourceImpl(this.api);

  final Api api;

  @override
  Future<ResponseModel> getAllRequests(String tab, int page) async {
    ResponseModel response = await api.HTTPGET(
      RequestListRouting.requestList,
      [
        QueryModel(name: 'tab', value: tab),
        QueryModel(name: 'page', value: page.toString())
      ],
      null,
      HeaderEnum.bearerHeaderEnum,
      ResponseEnum.responseModelEnum,
    );
    if (response.status == 200) {
      response.data = RequestHeader.fromJson(response.data);
    }

    return response;
  }
}
