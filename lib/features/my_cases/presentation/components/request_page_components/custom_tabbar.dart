import 'package:flutter/material.dart';
import 'package:test_interview/features/my_cases/presentation/components/request_page_components/request_detail_item.dart';

import '../../../domain/entity/request_detail_entity.dart';

class CustomTabBar extends StatefulWidget {
  final RequestDetailEntity requestDetailEntity;
  const CustomTabBar({super.key, required this.requestDetailEntity});
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 1.4,
            decoration: BoxDecoration(
              color: const Color(0xff1C4870),
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: TabBar(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: Colors.white,
              ),
              labelColor: const Color(0xff1C4870),
              unselectedLabelColor: Colors.white,
              labelStyle:
                  TextStyle(fontSize: MediaQuery.of(context).size.width / 30),
              tabs: const [
                Tab(
                  text: 'بیمه بدنه',
                ),
                Tab(
                  text: 'بازدید بدنه',
                ),
                Tab(
                  text: 'خسارت',
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const Center(
                  child: Text(
                    "در دست ساخت",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                RequestDetailItem(
                    requestDetailEntity: widget.requestDetailEntity),
                const Center(
                  child: Text(
                    "در دست ساخت",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
