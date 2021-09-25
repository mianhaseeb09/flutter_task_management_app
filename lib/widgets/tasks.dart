import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/model/tasks.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_task_management_app/screen/detail_screen.dart';

class TasksList extends StatelessWidget {
  final tasksList = Tasks.generateTasks();

  TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: GridView.builder(
        itemCount: tasksList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => tasksList[index].isLast
            ? _buildAddTask()
            : _buildTasks(context, tasksList[index]),
      ),
    );
  }

  Widget _buildAddTask() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: const Center(
          child: Text(
        '+ Add',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )),
    );
  }

  Widget _buildTasks(BuildContext context, Tasks tasks) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailScreen(
            tasks: tasks,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: tasks.bgColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              tasks.iconData,
              color: tasks.iconColor,
              size: 35,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              tasks.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _buildTasksStatus(
                    tasks.btnColor, tasks.iconColor, '${tasks.left} left'),
                const SizedBox(
                  width: 5,
                ),
                _buildTasksStatus(
                    Colors.white, tasks.iconColor, '${tasks.done} done'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTasksStatus(Color bgColor, Color textColor, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
