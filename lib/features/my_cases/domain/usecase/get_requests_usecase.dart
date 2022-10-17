import 'package:test_interview/core/models/response_model.dart';
import 'package:test_interview/core/usecase/usecase.dart';
import 'package:test_interview/features/my_cases/domain/repository/get_requests_repository.dart';

class GetRequestsUseCase extends UseCase<Future<ResponseModel>, Params> {
  final GetRequestsRepository _getRequestsRepository;
  GetRequestsUseCase(this._getRequestsRepository);

  @override
  Future<ResponseModel> call(Params params) {
    return _getRequestsRepository.getAllRequests(
        params.tab ?? "issuance", params.page ?? 1);
  }
}

class Params {
  int? page;
  String? tab;

  Params({this.page, this.tab});
}
