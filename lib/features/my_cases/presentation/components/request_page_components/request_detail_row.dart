import 'package:flutter/material.dart';
import 'package:test_interview/core/constants/constants.dart';

class RequestDetailRow extends StatelessWidget {
  const RequestDetailRow({Key? key, required this.value, required this.title})
      : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                width: 10,
                height: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                maxLines: 2,
                style: Constants.rowTextStyle,
              ),
            ],
          ),
          Text(
            value,
            style: Constants.rowValueTextStyle,
          ),
        ],
      ),
    );
  }
}
