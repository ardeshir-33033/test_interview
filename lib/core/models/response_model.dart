class ResponseModel {
  dynamic data;
  String? msgType;

  ResponseModel({this.data, this.msgType});

  ResponseModel fromJson(dynamic jsn, String bodyName) {
    data = jsn[bodyName];

    //to String just to make sure we are always dealing with a string
    msgType = jsn['msg_type'].toString();

    return this;
  }
}
