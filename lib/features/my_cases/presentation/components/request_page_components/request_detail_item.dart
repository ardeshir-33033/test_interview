import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_interview/core/constants/constants.dart';
import 'package:test_interview/features/my_cases/presentation/components/request_page_components/request_detail_row.dart';
import 'package:test_interview/features/my_cases/presentation/components/request_page_components/search_widget.dart';
import '../../../domain/entity/request_detail_entity.dart';
import 'enter_button.dart';
import 'status_detail_box.dart';

class RequestDetailItem extends StatelessWidget {
  const RequestDetailItem({Key? key, required this.requestDetailEntity})
      : super(key: key);

  final RequestDetailEntity requestDetailEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 5,
                  offset: const Offset(0, 0),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Transform.translate(
                        offset: const Offset(-10, -6),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.bookmark,
                              size: 45,
                              color: Constants.navyBlue,
                            ),
                            const Text(
                              "خودم",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ))),
                RequestDetailRow(
                    title: "شناسه پرونده",
                    value: requestDetailEntity.orderId ?? "وارد نشده"),
                RequestDetailRow(
                    title: "نام مشتری",
                    value: requestDetailEntity.fullName ?? "وارد نشده"),
                RequestDetailRow(
                    title: "تلفن همراه",
                    value: requestDetailEntity.phoneNumber ?? "وارد نشده"),
                RequestDetailRow(
                    title: "محل بازدید",
                    value: requestDetailEntity.location ?? "وارد نشده"),
                StatusDetailBox(
                    visitTime: requestDetailEntity.visitTime ?? "",
                    visitDate: requestDetailEntity.visitDate ?? "",
                    status: requestDetailEntity.status ?? ""),
                EnterButton(status: requestDetailEntity.status ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
