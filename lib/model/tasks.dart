import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/constants/colors.dart';

class Tasks {
  IconData iconData;
  String title;
  Color bgColor;
  Color iconColor;
  Color btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;

  Tasks(
      {required this.iconData,
      required this.title,
      required this.bgColor,
      required this.iconColor,
      required this.btnColor,
      this.left,
      this.done,
      this.desc,
      this.isLast = false});

  static List<Tasks> generateTasks() {
    return [
      Tasks(
          iconData: Icons.person_rounded,
          title: 'Personal',
          bgColor: kYellowLight,
          iconColor: kYellowDark,
          btnColor: kYellow,
          left: 3,
          done: 1,
          desc: [
            {
              'time': '9:00 am',
              'title': 'Go for a walk with dog',
              'slot': '9:00 am - 10:00 am',
              'tailColor': kRedDark,
              'bgColor': kRedLight
            },
            {
              'time': '10:00 am',
              'title': 'Shot on Dribble',
              'slot': '10:00 am - 12:00 am',
              'tailColor': kBlueDark,
              'bgColor': kBlueLight
            },
            {
              'time': '11:00 am',
              'title': '',
              'slot': '',
              'tailColor': kBlueDark,
            },
            {
              'time': '12:00 am',
              'title': '',
              'slot': '',
              'tailColor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '1:00 pm',
              'title': 'Call with Client',
              'slot': '1:00 pm - 2:00 pm',
              'tailColor': kYellowDark,
              'bgColor': kYellowLight
            },
            {
              'time': '2:00 pm',
              'title': '',
              'slot': '',
              'tailColor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '3:00 pm',
              'title': '',
              'slot': '',
              'tailColor': Colors.grey.withOpacity(0.3),
            }
          ]),
      Tasks(
          iconData: Icons.cases_rounded,
          title: 'Work',
          bgColor: kRedLight,
          iconColor: kRedDark,
          btnColor: kRed,
          left: 0,
          done: 0),
      Tasks(
          iconData: Icons.favorite_rounded,
          title: 'Health',
          bgColor: kBlueLight,
          iconColor: kBlueDark,
          btnColor: kBlue,
          left: 0,
          done: 0),
      Tasks(
          iconData: Icons.favorite_rounded,
          title: 'Health',
          bgColor: kBlueLight,
          iconColor: kBlueDark,
          btnColor: kBlue,
          left: 0,
          done: 0,
          isLast: true)
    ];
  }
}
