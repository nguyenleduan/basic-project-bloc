class StatusCode{
  StatusCode._();
  static final StatusCode _instance = StatusCode._();
  static StatusCode get instance => _instance;
  bool checkStatusCode(int code){
    if(code == null){
      return false;
    }
    if(code == 200 ||code == 201 || code == 204 || code== 409 || code== 400 || code == 404 || code == 500 || code == 401 ){
      return true;
    }
    return false;
  }
}