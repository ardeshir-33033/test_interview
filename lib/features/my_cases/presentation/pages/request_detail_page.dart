import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/request_status.dart';
import '../../../../locator.dart';
import '../components/custom_loading.dart';
import '../components/request_page_components/custom_tabbar.dart';
import '../getx/request_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RequestDetailPage extends StatefulWidget {
  const RequestDetailPage({Key? key}) : super(key: key);

  @override
  State<RequestDetailPage> createState() => _RequestDetailPageState();
}

class _RequestDetailPageState extends State<RequestDetailPage> {
  final CircularBottomNavigationController _navigationController =
      CircularBottomNavigationController(0);

  final RequestController requestController = locator<RequestController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
        barHeight: 50,
        circleSize: 40,
        iconsSize: 20,
        selectedIconColor: Constants.navyBlue,
        barBackgroundColor: Colors.white,
        backgroundBoxShadow: const <BoxShadow>[
          BoxShadow(color: Colors.black45, blurRadius: 5.0),
        ],
        animationDuration: const Duration(milliseconds: 300),
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        title: Text(AppLocalizations.of(context)!.myCases),
        backgroundColor: const Color(0xff1C4870),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: GetBuilder<RequestController>(builder: (logic) {
        return SafeArea(
          child: requestController.requestListStatus.status == Status.Loading
              ? const Center(child: CustomLoadingAnimation())
              : requestController.requestListStatus.status == Status.Success
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                            child: CustomTabBar(
                          requestHeaderEntity: requestController.requestHeader,
                        )),
                      ],
                    )
                  : Text(requestController.error ?? ""),
        );
      }),
    );
  }

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "پرونده های من",
      Colors.white,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.layers,
      "خانه",
      Colors.white,
    ),
    TabItem(
      Icons.notifications,
      "ارسال نواقص",
      Colors.white,
    ),
  ]);
}
