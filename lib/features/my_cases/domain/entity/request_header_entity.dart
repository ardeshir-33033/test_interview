import 'package:equatable/equatable.dart';

import '../../data/models/request_model.dart';

class RequestHeaderEntity extends Equatable {
  int? current;
  int? pageCount;
  String? next;
  String? previous;
  List<Request>? results;

  RequestHeaderEntity(
      {this.current, this.next, this.pageCount, this.previous, this.results});

  @override
  List<Object?> get props => [
        current,
        pageCount,
        next,
        previous,
        results,
      ];
}
