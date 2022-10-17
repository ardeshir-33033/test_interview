import 'package:test_interview/features/my_cases/domain/entity/request_detail_entity.dart';

import '../../data/models/request_model.dart';

class RequestHeaderEntity {
  int? current;
  int? pageCount;
  String? next;
  String? previous;
  List<Request>? results;

  RequestHeaderEntity(
      {this.current, this.next, this.pageCount, this.previous, this.results});
}
