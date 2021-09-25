import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/model/tasks.dart';
import 'package:flutter_task_management_app/widgets/date_picker.dart';
import 'package:flutter_task_management_app/widgets/tasks_time_line.dart';
import 'package:flutter_task_management_app/widgets/tasks_title.dart';

class DetailScreen extends StatelessWidget {
  final Tasks tasks;

  const DetailScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailList = tasks.desc;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [DatePicker(), TasksTitle()],
              ),
            ),
          ),
          detailList == null
              ? SliverFillRemaining(
                  child: Container(
                      color: Colors.white,
                      child: const Center(
                          child: Text(
                        'No Tasks Today',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ))))
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (_, index) => TasksTimeLine(detail: detailList[index]),
                      childCount: detailList.length)),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(top: 35),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {},
          elevation: 0,
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 20,
      ),
      actions: const [
        Icon(
          Icons.more_vert,
          size: 40,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${tasks.title} tasks',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'You have ${tasks.left} tasks for today',
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildBottomNavigationBar() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10)
        ]),
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          items: const [
            BottomNavigationBarItem(
                label: 'Home', icon: Icon(Icons.home_rounded)),
            BottomNavigationBarItem(
                label: 'person', icon: Icon(Icons.person_rounded))
          ]),
    ),
  );
}
