import 'package:flutter/material.dart';
import 'package:test_interview/features/my_cases/domain/entity/request_header_entity.dart';
import 'package:test_interview/features/my_cases/presentation/components/request_page_components/paging_widget.dart';
import 'package:test_interview/features/my_cases/presentation/components/request_page_components/request_detail_item.dart';
import 'package:test_interview/features/my_cases/presentation/components/request_page_components/search_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTabBar extends StatefulWidget {
  final RequestHeaderEntity requestHeaderEntity;
  const CustomTabBar({super.key, required this.requestHeaderEntity});
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
              tabs: [
                Tab(
                  text: AppLocalizations.of(context)!.insurance,
                ),
                Tab(
                  text: AppLocalizations.of(context)!.bodyReview,
                ),
                Tab(
                  text: AppLocalizations.of(context)!.damage,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.beingBuilt,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SearchWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount:
                              widget.requestHeaderEntity.results!.length + 1,
                          itemBuilder: (context, int index) {
                            if (index ==
                                widget.requestHeaderEntity.results!.length) {
                              return PagingWidget(widget.requestHeaderEntity);
                            } else {
                              return RequestDetailItem(
                                  requestDetailEntity: widget
                                      .requestHeaderEntity.results![index]);
                            }
                          }),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.beingBuilt,
                    style: const TextStyle(
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
