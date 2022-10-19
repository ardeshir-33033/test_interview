import 'package:flutter/material.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_detail_entity.dart';
import '../components/request_page_components/custom_tabbar.dart';

class RequestDetailPage extends StatelessWidget {
  const RequestDetailPage({Key? key, required this.requestDetailEntity})
      : super(key: key);

  final RequestDetailEntity requestDetailEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        title: const Text("پرونده های من"),
        backgroundColor: const Color(0xff1C4870),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: CustomTabBar(
              requestDetailEntity: requestDetailEntity,
            )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
