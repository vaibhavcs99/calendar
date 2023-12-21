import 'package:calendar/home_page/home_page_controller.dart';
import 'package:flutter/material.dart';

class DayOrWeekIndicator extends StatelessWidget {
  const DayOrWeekIndicator({
    super.key,
    required this.controller,
  });

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.isWeekView.add(!controller.isWeekView.value);
      },
      child: StreamBuilder<Object>(
          stream: controller.isWeekView,
          builder: (context, snapshot) {
            return Row(
              children: [
                Container(
                  width: 55,
                  height: 35,
                  decoration: BoxDecoration(
                      color: controller.isWeekView.value
                          ? Colors.lightBlue.shade200
                          : Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                          color: Colors.lightBlue.shade200, width: 1.0)),
                  child: Center(
                    child: Text(
                      'Day',
                      style: TextStyle(
                          color: controller.isWeekView.value
                              ? Colors.white
                              : Colors.lightBlue.shade200),
                    ),
                  ),
                ),
                Container(
                  width: 55,
                  height: 35,
                  decoration: BoxDecoration(
                      color: controller.isWeekView.value
                          ? Colors.white
                          : Colors.lightBlue.shade200,
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                          color: Colors.lightBlue.shade200, width: 1.0)),
                  child: Center(
                    child: Text(
                      'Week',
                      style: TextStyle(
                          color: controller.isWeekView.value
                              ? Colors.lightBlue.shade200
                              : Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8)
              ],
            );
          }),
    );
  }
}
