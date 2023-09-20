import 'package:flutter/material.dart';
import 'package:pmsn20232/models/task_model.dart';

class CardTaskWidget extends StatelessWidget {
  CardTaskWidget(
    {super.key,required this.taskModel}
  );

  TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(taskModel.nameTask!),
              Text(taskModel.dscTask!)
            ],
          )
        ],
      ),
    );
  }
}