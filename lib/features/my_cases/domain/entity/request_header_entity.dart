import 'package:test_interview/features/my_cases/domain/entity/request_detail_entity.dart';

class RequestHeaderEntity {
  int? current;
  int? pageCount;
  String? next;
  String? previous;
  List<RequestDetailEntity>? results;

  RequestHeaderEntity(
      {this.current, this.next, this.pageCount, this.previous, this.results});
}
