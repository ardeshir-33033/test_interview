import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/enum.dart';
import '../models/query_model.dart';
import '../models/response_model.dart';

class Api {
  static const int TRIES = 1;
  static const int TIMEOUT = 20;
  static String? accessToken;

  Map<String, String> imageHeader = {
    HttpHeaders.authorizationHeader: "Bearer ${accessToken ?? ""}",
    "Accept": "multipart/byteranges",
    "content-type": "image/jpeg; charset=utf-8",
  };

  Map<String, String> bearerHeader = {
    HttpHeaders.authorizationHeader: "jwt ${accessToken ?? ""}",
    "Accept": "application/json",
    "content-type": "application/json; charset=utf-8",
  };

  Map<String, String> formDataHeader = {
    "Accept": "multipart/form-data",
    "content-type": "application/json; charset=utf-8",
  };

  Map<String, String> basicHeader = {
    "Accept": "application/json",
    "content-type": "application/json; charset=utf-8",
  };

  Map<String, String>? headerGetter(HeaderEnum typeEnum) {
    switch (typeEnum) {
      case HeaderEnum.imageHeaderEnum:
        return imageHeader;
      case HeaderEnum.bearerHeaderEnum:
        return bearerHeader;
      case HeaderEnum.formDataHeaderEnum:
        return formDataHeader;
      case HeaderEnum.basicHeaderEnum:
        return basicHeader;
      case HeaderEnum.emptyHeaderEnum:
        return null;
      default:
        return basicHeader;
    }
  }

  String generateQuery(List<QueryModel> queries) {
    String query = "";
    if (queries.isNotEmpty) {
      query += "?";
      for (var element in queries) {
        if (element.value != null && element.value != "null") {
          String? nm = element.name;
          String? vl = element.value;

          query += "$nm=$vl&";
        }
      }
    }

    return query;
  }

  String urlGenerator(String url, List<QueryModel> query) {
    var queryPart = generateQuery(query);

    return "$url$queryPart";
  }

  String urlGenerator2(
      String url, List<QueryModel> query, String? pathVariable) {
    if (pathVariable != null) url += "/$pathVariable";
    var queryPart = generateQuery(query);

    return "$url$queryPart";
  }

  responseGetter<T>(ResponseEnum typeEnum, http.Response response) {
    if (response.statusCode != 200) {
      printError('Url: ${response.request!.url.path}');
      printError('StatusCode: ${response.statusCode}');
    }
    try {
      switch (typeEnum) {
        case ResponseEnum.responseModelEnum:
          String data = utf8.decode(response.bodyBytes);
          late ResponseModel result;
          if (response.statusCode != 200) {
            printError('Url: ${response.request!.url.path}');
            printError('StatusCode: ${response.statusCode}');
            result = ResponseModel().fromJson(
              json.decode(data),
            );
          } else {
            result = ResponseModel(data: json.decode(data), status: 200);
          }

          return result;
        default:
          return response.bodyBytes;
      }
    } catch (e) {
      printError('Url: ${response.request!.url}');
      printError('StatusCode: ${response.statusCode}');
      printError('Error: ${e.toString()}');
      return ResponseModel(
          status: response.statusCode,
          data: null,
          error: "مشکلی در ارتباط با سرور بوجود آمده است.");
    }
  }

  void printError(String text) {
    debugPrint('\x1B[31m$text\x1B[0m');
  }

  Future<bool> _checkStatus() async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('https://google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else {
        isOnline = false;
      }
    } on SocketException catch (_) {
      isOnline = false;
    }
    return isOnline;
  }

  // ignore: non_constant_identifier_names
  Future<ResponseModel> HTTPGET<T>(
    String url,
    List<QueryModel> query,
    String? pathVariable,
    HeaderEnum headerType,
    ResponseEnum responseType,
  ) async {
    int i = 0;
    ResponseModel responseModel = ResponseModel();
    while (i < TRIES) {
      try {
        var response = await http
            .get(
              Uri.parse(urlGenerator2(url, query, pathVariable)),
              headers: headerGetter(headerType),
            )
            .timeout(const Duration(seconds: TIMEOUT));
        responseModel = responseGetter<T>(responseType, response);
      } catch (e) {
        printError('Url: $url');
        printError(e.toString());
        await _checkStatus().then((value) {
          if (value) {
            responseModel = ResponseModel(
                status: 500, data: null, error: "خطایی در عملیات رخ داده است");
          } else {
            responseModel = ResponseModel(
                status: 510,
                data: null,
                error: "لطفا اتصال به اینترنت را بررسی کنید.");
          }
        });
      }
      if (responseModel.status == 200) {
        return responseModel;
      }
      i++;
    }
    return responseModel;
  }

  // ignore: non_constant_identifier_names
  Future<ResponseModel> HTTPDELETE<T>(
    String url,
    List<QueryModel> query,
    var body,
    HeaderEnum headerType,
    ResponseEnum responseType,
  ) async {
    ResponseModel responseModel = ResponseModel();
    int i = 0;
    while (i < TRIES) {
      try {
        var response = await http
            .delete(
              Uri.parse(urlGenerator(url, query)),
              headers: headerGetter(headerType),
              body: body,
            )
            .timeout(const Duration(seconds: TIMEOUT));

        responseModel = responseGetter<T>(responseType, response);
      } catch (e) {
        printError('Url: $url');
        printError(e.toString());
        await _checkStatus().then((value) {
          if (value) {
            responseModel = ResponseModel(
                status: 500, data: null, error: "خطایی در عملیات رخ داده است");
          } else {
            responseModel = ResponseModel(
                status: 510,
                data: null,
                error: "لطفا اتصال به اینترنت را بررسی کنید.");
          }
        });
      }
      if (responseModel.status == 200) {
        return responseModel;
      }
      i++;
    }
    return responseModel;
  }

  // ignore: non_constant_identifier_names
  Future<ResponseModel> HTTPPOST<T>(String url, List<QueryModel> query,
      var body, HeaderEnum headerType, ResponseEnum responseType) async {
    ResponseModel responseModel = ResponseModel();
    int i = 0;
    while (i < TRIES) {
      try {
        var response = await http
            .post(
              Uri.parse(urlGenerator(url, query)),
              headers: headerGetter(headerType),
              body: body,
            )
            .timeout(const Duration(seconds: TIMEOUT));

        responseModel = responseGetter<T>(responseType, response);
      } catch (e) {
        printError('Url: $url');
        printError(e.toString());
        await _checkStatus().then((value) {
          if (value) {
            responseModel = ResponseModel(
                status: 500, data: null, error: "خطایی در عملیات رخ داده است");
          } else {
            responseModel = ResponseModel(
                status: 500, data: null, error: "خطایی در عملیات رخ داده است");
          }
        });
      }
      if (responseModel.status == 200) {
        return responseModel;
      }
      i++;
    }
    return responseModel;
  }

  // ignore: non_constant_identifier_names
  Future<ResponseModel> HTTPPUT<T>(
    String url,
    List<QueryModel> query,
    var body,
    HeaderEnum headerType,
    ResponseEnum responseType,
  ) async {
    ResponseModel responseModel = ResponseModel();
    int i = 0;
    while (i < TRIES) {
      try {
        var response = await http
            .put(
              Uri.parse(urlGenerator(url, query)),
              headers: headerGetter(headerType),
              body: body,
            )
            .timeout(const Duration(seconds: TIMEOUT));

        responseModel = responseGetter<T>(responseType, response);
      } catch (e) {
        printError('Url: $url');
        printError(e.toString());
        await _checkStatus().then((value) {
          if (value) {
            responseModel = ResponseModel(
                status: 500, data: null, error: "خطایی در عملیات رخ داده است");
          } else {
            responseModel = ResponseModel(
                status: 510,
                data: null,
                error: "لطفا اتصال به اینترنت را بررسی کنید.");
          }
        });
      }
      if (responseModel.status == 200) {
        return responseModel;
      }
      i++;
    }
    return responseModel;
  }
}
