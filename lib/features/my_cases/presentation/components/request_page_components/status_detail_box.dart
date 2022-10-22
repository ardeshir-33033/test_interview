import 'package:flutter/material.dart';
import 'package:test_interview/core/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusDetailBox extends StatelessWidget {
  const StatusDetailBox(
      {Key? key,
      required this.visitTime,
      required this.visitDate,
      required this.status})
      : super(key: key);

  final String status;
  final String visitDate;
  final String visitTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.black45,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    AppLocalizations.of(context)!.caseStatus,
                    style: Constants.rowTextStyle,
                  ),
                ],
              ),
              Text(
                status,
                style: Constants.rowValueTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.black45,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    AppLocalizations.of(context)!.visitTime,
                    style: Constants.rowTextStyle,
                  ),
                ],
              ),
              Text(
                "$visitDate - $visitTime",
                style: Constants.rowValueTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
