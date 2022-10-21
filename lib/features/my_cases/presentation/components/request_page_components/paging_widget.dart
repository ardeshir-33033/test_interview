import 'package:flutter/material.dart';
import 'package:test_interview/core/constants/constants.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_header_entity.dart';

import '../../../../../locator.dart';
import '../../getx/request_controller.dart';

class PagingWidget extends StatefulWidget {
  const PagingWidget(this._requestHeaderEntity, {super.key});

  final RequestHeaderEntity _requestHeaderEntity;

  @override
  State<PagingWidget> createState() => _PagingWidgetState();
}

class _PagingWidgetState extends State<PagingWidget> {
  final RequestController requestController = locator<RequestController>();

  List<dynamic> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createPages();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: 30,
      child: Align(
        alignment: Alignment.center,
        child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: pages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            bool current = widget._requestHeaderEntity.current == index + 1 ? true : false;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: InkWell(
                  onTap: () {
                    requestController.getRequests(page: pages[index]);
                  },
                  child: Text(pages[index].toString() , style: TextStyle(color:  current ? Constants.navyBlue : Colors.black54 , fontWeight:current ? FontWeight.w800 :FontWeight.w600 ),)),
            );
          },
        ),
      ),
    );
  }

  createPages() {
    if (widget._requestHeaderEntity.pageCount! > 5) {
      /// TODO: Implement pagination for more than 5
    } else {
      for (int i = 1; i < widget._requestHeaderEntity.pageCount! + 1; i++) {
        pages.add(i);
      }
    }
  }
}
