import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/widgets/go_premium.dart';
import 'package:flutter_task_management_app/widgets/tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoPremium(),
          Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Tasks',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: TasksList(),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            //margin: EdgeInsets.only(left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/avatar.jpg'),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Hi Amanda',
            style: TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: [
        Icon(
          Icons.more_vert,
          color: Colors.black,
          size: 40,
        )
      ],
    );
  }
}
