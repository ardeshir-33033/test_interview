import 'package:test_interview/features/my_cases/data/models/request_model.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_header_entity.dart';

class RequestHeader extends RequestHeaderEntity {
  RequestHeader({
    int? current,
    int? pageCount,
    int? pageSize,
    int? count,
    String? next,
    String? previous,
    List<Request>? results,
  }) : super(
          previous: previous,
          current: current,
          next: next,
          pageCount: pageCount,
          results: results,
        );

  RequestHeader.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    pageCount = json['page_count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Request>[];
      json['results'].forEach((v) {
        results!.add(Request.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['page_count'] = pageCount;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static final RequestHeader requestHeaderForTest = RequestHeader(
    current: 1,
    pageCount: 2,
    pageSize: 10,
    count: 3,
    next: "sss",
    previous: "sss",
    results: [],
  );
}
