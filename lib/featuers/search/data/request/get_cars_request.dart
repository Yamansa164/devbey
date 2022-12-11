class GetCarsRequest {
  final String location;
  final String dateFrom;
  final String dateTo;
  final String page;

  GetCarsRequest(
      {required this.location,
      required this.dateFrom,
      required this.dateTo,
      required this.page});
}
