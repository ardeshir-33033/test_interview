class ResponseError {
  List<String>? detail;

  ResponseError({this.detail});

  ResponseError.fromJson(Map<String, dynamic> json) {
    detail = json['detail'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['todo'] = detail;
    return data;
  }
}
