class GetCarsRequest {
  final String location;
  final String dateFrom;
  final String dateTo;
  final int page;

  GetCarsRequest(
      {required this.location,
      required this.dateFrom,
      required this.dateTo,
      required this.page});
}
