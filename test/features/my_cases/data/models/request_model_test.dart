import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_interview/features/my_cases/data/models/request_header_model.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_header_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tRequestHeader = RequestHeader.requestHeaderForTest;

  test(
    'should be a subclass of RequestHeader entity',
    () async {
      //assert
      expect(tRequestHeader, isA<RequestHeaderEntity>());
    },
  );

  group('from json', () {
    test(
      'should return a valid model',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture("header_model.json"));
        //act
        final result = RequestHeader.fromJson(jsonMap);
        //assert
        expect(result, tRequestHeader);
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        //act
        final result = tRequestHeader.toJson();
        //assert
        final expectedMap = json.decode(fixture("header_model.json"));
        expect(result, expectedMap);
      },
    );
  });
}
