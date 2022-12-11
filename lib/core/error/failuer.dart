 class Failuer {
   Failuer({required this.message});
  String message;
}

/// general failures
class ServerFailure implements Failuer {
  @override
  String message ='Server Failure';
}
class NoInternetFailure implements Failuer {
  @override
  String message='No Internet Connection';
}