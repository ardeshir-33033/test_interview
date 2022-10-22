import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../locator.dart';
import '../../getx/request_controller.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);
  Timer? timer;
  final RequestController requestController = locator<RequestController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 15,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(right: 5.0, bottom: 10),
                  hintText: "شناسه پرونده را وارد کنید",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey)),
              onChanged: (val) {
                if (timer != null) timer!.cancel();
                timer = Timer(const Duration(milliseconds: 700),
                    () => requestController.search(val));
              },
            ),
          ),
          const Icon(Icons.search),
        ],
      ),
    );
  }
}
