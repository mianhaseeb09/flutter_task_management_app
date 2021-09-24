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
  bool isLast;

  Tasks(
      { required this.iconData,
      required this.title,
      required this.bgColor,
      required this.iconColor,
      required this.btnColor,
      this.left,
      this.done,
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
          done: 1),
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
      // Tasks(
      //     iconData: Icons.,
      //     title: '',
      //     bgColor: ,
      //     iconColor: kBlueDark,
      //     btnColor: kBlue,
      //     left: 0,
      //     done: 0,
      //     isLast: true)
    ];
  }
}
