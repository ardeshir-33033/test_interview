import 'package:flutter/material.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_detail_entity.dart';

class RequestListItem extends StatelessWidget {
  RequestListItem({Key? key, required this.requestDetailEntity})
      : super(key: key);

  RequestDetailEntity requestDetailEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/detail",
              arguments: requestDetailEntity);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(requestDetailEntity.fullName ?? ""),
              const SizedBox(
                height: 10.0,
              ),
              Text(requestDetailEntity.phoneNumber ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
