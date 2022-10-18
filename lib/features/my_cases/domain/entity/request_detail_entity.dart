class RequestDetailEntity {
  int? id;
  String? orderId;
  String? fullName;
  String? phoneNumber;
  String? location;
  String? status;
  String? visitDate;
  String? visitTime;

  RequestDetailEntity(
      {this.id,
      this.orderId,
      this.phoneNumber,
      this.status,
      this.fullName,
      this.location,
      this.visitDate,
      this.visitTime});
}
