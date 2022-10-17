class RequestStatus {
  Status status = Status.NotCalled;
  String? _message;

  get message => _message ?? 'خطایی رخ داده است';

  set message(_m) {
    status = Status.Error;
    _message = _m;
  }

  @override
  bool operator ==(_status) {
    if (_status is Status) {
      return status == _status;
    }
    return false;
  }

  @override
  int get hashCode {
    return status.hashCode;
  }

  void loading() {
    status = Status.Loading;
  }

  void success({String? message}) {
    status = Status.Success;
    if (message != null) {
      // MessageBar().showMessage(message, type: MessageType.SUCCESS);
    }
  }

  void notCalled() {
    status = Status.NotCalled;
  }

  void error(String message, {bool showMessage = true}) {
    status = Status.Error;
    _message = message;
    if (showMessage) {
      // MessageBar().showMessage(message, type: MessageType.FAILED);
    }
  }

  void clear() {
    status = Status.NotCalled;
    _message = null;
  }
}

enum Status {
  NotCalled,
  Loading,
  Success,
  Error,
}
