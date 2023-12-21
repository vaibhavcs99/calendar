import 'package:flutter/material.dart';

class WeeklyView extends StatelessWidget {
  final String day;
  final String month;
  final String callType;
  const WeeklyView({
    super.key,
    required this.day,
    required this.callType,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white70,
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              color: Colors.transparent,
            )),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.0),
              border: const Border(
                left: BorderSide(
                  color: Colors.red,
                  width: 4.0,
                ),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      month,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                (callType == 'All' || callType == 'HRD')
                    ? const CircularView('02', 'HRD')
                    : const SizedBox.shrink(),
                (callType == 'All' || callType == 'Tech')
                    ? const CircularView('03', 'Tech 1')
                    : const SizedBox.shrink(),
                (callType == 'All' || callType == 'FollowUP')
                    ? const CircularView('05', 'Follow up')
                    : const SizedBox.shrink(),
                (callType == 'All')
                    ? const CircularView(
                        '10', 'Total', Colors.black54, Colors.white)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularView extends StatelessWidget {
  final String number;
  final String title;
  final Color bgColor;
  final Color textColor;
  const CircularView(this.number, this.title,
      [this.bgColor = Colors.white, this.textColor = Colors.black]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Center(
              child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
              border: Border.all(color: Colors.grey.shade400, width: 1.0),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  color: textColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
          Text(title, style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
