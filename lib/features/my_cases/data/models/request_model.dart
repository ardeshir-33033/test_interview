class Request {
  int? id;
  String? orderId;
  String? fileType;
  String? visitLocation;
  String? applicantUserFullName;
  String? applicantUserPhoneNumber;
  String? creatorUserType;
  bool? healthCertificateUpload;
  String? visitDate;
  String? visitTime;
  String? status;

  Request(
      {this.id,
        this.orderId,
        this.fileType,
        this.visitLocation,
        this.applicantUserFullName,
        this.applicantUserPhoneNumber,
        this.creatorUserType,
        this.healthCertificateUpload,
        this.visitDate,
        this.visitTime,
        this.status});

  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    fileType = json['file_type'];
    visitLocation = json['visit_location'];
    applicantUserFullName = json['applicant_user_full_name'];
    applicantUserPhoneNumber = json['applicant_user_phone_number'];
    creatorUserType = json['creator_user_type'];
    healthCertificateUpload = json['health_certificate_upload'];
    visitDate = json['visit_date'];
    visitTime = json['visit_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['file_type'] = this.fileType;
    data['visit_location'] = this.visitLocation;
    data['applicant_user_full_name'] = this.applicantUserFullName;
    data['applicant_user_phone_number'] = this.applicantUserPhoneNumber;
    data['creator_user_type'] = this.creatorUserType;
    data['health_certificate_upload'] = this.healthCertificateUpload;
    data['visit_date'] = this.visitDate;
    data['visit_time'] = this.visitTime;
    data['status'] = this.status;
    return data;
  }
}