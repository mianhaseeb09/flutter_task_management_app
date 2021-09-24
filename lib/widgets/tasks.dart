import 'package:flutter/material.dart';
import 'package:flutter_task_management_app/model/tasks.dart';

class TasksList extends StatelessWidget {
  final tasksList = Tasks.generateTasks();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        itemCount: tasksList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
    return Text('Add Task');
  }

  Widget _buildTasks(BuildContext context, Tasks tasks) {
    return Container(
      padding: EdgeInsets.all(15),
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
          SizedBox(
            height: 30,
          ),
          Text(
            tasks.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              _buildTasksStatus(
                  tasks.btnColor, tasks.iconColor, '${tasks.left} left'),
              SizedBox(
                width: 5,
              ),
              _buildTasksStatus(
                  Colors.white, tasks.iconColor, '${tasks.done} right'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTasksStatus(Color bgColor, Color textColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
