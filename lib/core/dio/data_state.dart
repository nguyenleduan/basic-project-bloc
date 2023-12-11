
abstract class DataState<T> {
  final T? data;
  final int? statusCode;
  final String? error;
  const DataState({this.data, this.error,this.statusCode});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}
class DataFailed<T> extends DataState<T> {
  const DataFailed(int statusCode,String error) : super(statusCode:statusCode,error: error);
}
class DataError<T> extends DataState<T> {
  const DataError( String error) : super(  error: error);
}
class DataFailedEmpty<T> extends DataState<T> {
  const DataFailedEmpty(int statusCode,String error) : super(statusCode:statusCode,error: error);
}
