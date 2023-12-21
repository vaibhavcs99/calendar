import 'package:calendar/home_page/home_page_controller.dart';
import 'package:calendar/ui/daily_view.dart';
import 'package:calendar/ui/day_week_indicator.dart';
import 'package:calendar/ui/weekly_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomePageController controller = HomePageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text('My Calendar', style: TextStyle(fontSize: 18)),
          actions: [
            DayOrWeekIndicator(controller: controller),
          ],
        ),
        body: Container(
          child: StreamBuilder<bool>(
              stream: controller.isWeekView,
              builder: (context, AsyncSnapshot<bool> isWeekViewData) {
                return SfDateRangePicker(
                  backgroundColor: Colors.grey.shade200,
                  view: DateRangePickerView.month,
                  selectionMode: (isWeekViewData.data!)
                      ? DateRangePickerSelectionMode.single
                      : DateRangePickerSelectionMode.range,
                  monthViewSettings:
                      const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    if (!isWeekViewData.data!) {
                      if (args.value.startDate != null &&
                          args.value.endDate != null) {
                        var endDate = args.value.endDate as DateTime;
                        var startDate = args.value.startDate as DateTime;

                        var totalDays = endDate.difference(startDate).inDays;
                        _showWeeklyBottomSheet(
                            context, totalDays + 1, startDate);
                      }
                    } else {
                      _showDailyBottomSheet();
                    }
                  },
                );
              }),
        ));
  }

  Future<dynamic> _showWeeklyBottomSheet(
      BuildContext context, int totalDays, DateTime startDate) {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            body: SizedBox(
              child: Column(
                children: [
                  const TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 0),
                    labelStyle: TextStyle(fontSize: 11),
                    unselectedLabelStyle: TextStyle(fontSize: 11),
                    tabs: [
                      Tab(text: 'All (70)'),
                      Tab(text: 'HRD (17)'),
                      Tab(text: 'Tech (24)'),
                      Tab(text: 'Follow up (29)'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: totalDays,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return WeeklyView(
                                callType: 'All',
                                day: (startDate.day + index).toString(),
                                month: DateFormat.MMM().format(startDate));
                          },
                        ),
                        ListView.builder(
                          itemCount: totalDays,
                          itemBuilder: (context, index) {
                            return WeeklyView(
                                callType: 'HRD',
                                day: (startDate.day + index).toString(),
                                month: DateFormat.MMM().format(startDate));
                          },
                        ),
                        ListView.builder(
                          itemCount: totalDays,
                          itemBuilder: (context, index) {
                            return WeeklyView(
                                callType: 'Tech',
                                day: (startDate.day + index).toString(),
                                month: DateFormat.MMM().format(startDate));
                          },
                        ),
                        ListView.builder(
                          itemCount: totalDays,
                          itemBuilder: (context, index) {
                            return WeeklyView(
                                callType: 'FollowUP',
                                day: (startDate.day + index).toString(),
                                month: DateFormat.MMM().format(startDate));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showDailyBottomSheet() {
    return showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return const DefaultTabController(
          length: 4,
          child: Scaffold(
            body: SizedBox(
              child: Column(
                children: [
                  TabBar(
                    labelPadding: EdgeInsets.symmetric(horizontal: 0),
                    labelStyle: TextStyle(fontSize: 11),
                    unselectedLabelStyle: TextStyle(fontSize: 11),
                    tabs: [
                      Tab(text: 'All (70)'),
                      Tab(text: 'HRD (17)'),
                      Tab(text: 'Tech (24)'),
                      Tab(text: 'Follow up (29)'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        DailyView(),
                        DailyView(),
                        DailyView(),
                        DailyView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
   controller.isWeekView.close();
    super.dispose();
  }
}
