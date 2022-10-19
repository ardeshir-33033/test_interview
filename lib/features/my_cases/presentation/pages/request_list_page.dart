import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_interview/core/utils/request_status.dart';
import 'package:test_interview/features/my_cases/presentation/components/custom_loading.dart';
import 'package:test_interview/locator.dart';
import '../components/request_page_components/request_list_items.dart';
import '../getx/request_controller.dart';

class RequestListPage extends StatelessWidget {
  RequestListPage({Key? key}) : super(key: key);

  final RequestController requestController = locator<RequestController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<RequestController>(builder: (logic) {
          return Column(
            children: [
              requestController.requestListStatus.status == Status.Loading
                  ? const Center(child: CustomLoadingAnimation())
                  : requestController.requestListStatus.status == Status.Success
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: requestController
                                  .requestHeader.results?.length,
                              itemBuilder: (context, int index) {
                                return RequestListItem(
                                  requestDetailEntity: requestController
                                      .requestHeader.results![index],
                                );
                              }))
                      : Text(requestController.error ?? ""),
            ],
          );
        }),
      ),
    );
  }
}
