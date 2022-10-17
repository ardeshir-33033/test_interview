import 'package:flutter/material.dart';

class RequestListPage extends StatelessWidget {
  const RequestListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 5, itemBuilder: (context, int index) {
                    return Container();
              }))
        ],
      ),
    );
  }
}
