import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:test_interview/features/my_cases/domain/usecase/get_requests_usecase.dart';






void main() {
  late GetRequestsUseCase useCase;
  late MockGetRequestsRepository mockGetRequestsRepository;
  setUp(() {
    mockUserRepository = MockGetRequestsRepository();
    useCase = GetRequestsUseCase(mockGetRequestsRepository);
  });

  final tUser = UserModel.userModelForTest;
  const int tId = 1;

  test(
    'should pass the user to the user repository and get created user from there',
        () async {
      //arrange
      when(mockUserRepository.createUser(any)).thenAnswer((realInvocation) async => const Right(tId));
      //act
      final result = await useCase(Params(userEntity: tUser));
      //assert
      verify(mockUserRepository.createUser(tUser));
      expect(result, const Right(tId));
      verifyNoMoreInteractions(mockUserRepository);
    },
  );
}
