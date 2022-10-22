import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:test_interview/core/models/response_model.dart';
import 'package:test_interview/features/my_cases/data/models/request_header_model.dart';
import 'package:test_interview/features/my_cases/domain/usecase/get_requests_usecase.dart';

import '../repository/get_requests_repository_test.mocks.dart';

void main() {
  late GetRequestsUseCase useCase;
  late MockGetRequestsRepository mockGetRequestsRepository;
  setUp(() {
    mockGetRequestsRepository = MockGetRequestsRepository();
    useCase = GetRequestsUseCase(mockGetRequestsRepository);
  });

  final tReq = RequestHeader.requestHeaderForTest;
  ResponseModel tRes = ResponseModel();

  test(
    'should pass the request to the request repository ',
    () async {
      //arrange
      when(mockGetRequestsRepository.getAllRequests(any, any))
          .thenAnswer((realInvocation) async => tRes);
      //act
      final result = await useCase(Params(page: 1, tab: "issuance"));
      //assert
      verify(mockGetRequestsRepository.getAllRequests("issuance", 1));
      expect(result, tRes);
      verifyNoMoreInteractions(mockGetRequestsRepository);
    },
  );
}
