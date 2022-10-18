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
