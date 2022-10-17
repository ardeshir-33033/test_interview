import 'dart:io';


abstract class NetworkInfo {
  Future<bool> checkStatus();
}

class NetworkInfoImpl implements NetworkInfo {

  @override
  Future<bool> checkStatus() async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('www.google.com');
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
}
