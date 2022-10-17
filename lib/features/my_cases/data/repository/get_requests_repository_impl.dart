import 'package:test_interview/core/models/response_model.dart';
import 'package:test_interview/core/network/network_info.dart';
import 'package:test_interview/features/my_cases/data/datasource/get_requests_datasource.dart';
import 'package:test_interview/features/my_cases/domain/repository/get_requests_repository.dart';

class GetRequestsRepositoryImpl extends GetRequestsRepository {
  final GetRequestsDataSource _getRequestsDataSource;
  final NetworkInfo _networkInfo;

  GetRequestsRepositoryImpl(this._networkInfo, this._getRequestsDataSource);

  @override
  Future<ResponseModel> getAllRequests(String tab, int page) async {
    try {
      if (await _networkInfo.checkStatus()) {
        ResponseModel res =
            await _getRequestsDataSource.getAllRequests(tab, page);
        return res;
      } else {
        return ResponseModel(
          error: "No Internet Connection.",
          status: 520,
        );
      }
    } catch (e) {
      return ResponseModel(
        error: e.toString(),
        status: 510,
      );
    }
  }
}
