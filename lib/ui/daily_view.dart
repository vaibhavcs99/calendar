import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DailyView extends StatelessWidget {
  const DailyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 3,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balram Naidu'),
                            Text('ID: LOREM123456354'),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            launchUrl(Uri(scheme: 'tel', path: '1234567890'));
                          },
                          child: Icon(
                            Icons.call_outlined,
                            color: Colors.lightBlue.shade200,
                          ),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Offered:',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        Text(
                          '₹X,XX,XXX',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Current:',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        Text(
                          '₹X,XX,XXX',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8)),
                          height: 6,
                          width: 6,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'Medium Priority',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.amber,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Due Date',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12),
                            ),
                            Text(
                              '05 Jun 23',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Level',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12),
                            ),
                            Text('10', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Days Left',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12),
                            ),
                            Text('92', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
