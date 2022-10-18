import 'package:test_interview/features/my_cases/domain/entity/request_detail_entity.dart';

class Request extends RequestDetailEntity {
  Request({
    int? id,
    String? orderId,
    String? fileType,
    String? visitLocation,
    String? applicantUserFullName,
    String? applicantUserPhoneNumber,
    String? creatorUserType,
    bool? healthCertificateUpload,
    String? visitDate,
    String? visitTime,
    String? status,
  }) : super(
            id: id,
            status: status,
            phoneNumber: applicantUserPhoneNumber,
            fullName: applicantUserFullName,
            orderId: orderId,
            location: visitLocation,
            visitDate: visitDate,
            visitTime: visitTime);

  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    location = json['visit_location'];
    fullName = json['applicant_user_full_name'];
    phoneNumber = json['applicant_user_phone_number'];
    visitDate = json['visit_date'];
    visitTime = json['visit_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['visit_location'] = location;
    data['applicant_user_full_name'] = fullName;
    data['applicant_user_phone_number'] = phoneNumber;
    data['visit_date'] = visitDate;
    data['visit_time'] = visitTime;
    data['status'] = status;
    return data;
  }
}
