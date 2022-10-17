import 'errors.dart';

/// we put all data inside this model so that always we know what we are dealing with
class ResponseModel {
  dynamic data;
  String? error;
  int? status;

  ResponseModel({this.data, this.error, this.status});

  ResponseModel fromJson(
    dynamic jsn,
  ) {
    error = jsn['detail'] != null ? jsn['error'] : null;
    data = jsn['data'];
    status = jsn["status"];

    return this;
  }
}
