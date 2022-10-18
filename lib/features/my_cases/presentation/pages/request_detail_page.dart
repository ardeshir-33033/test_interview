import 'package:flutter/material.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_detail_entity.dart';

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
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    color: const Color(0xff1C4870),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          "بیمه بدنه",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: const Center(child: Text("بازدید بدنه")),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text("اعلام خسارت",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
