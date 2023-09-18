import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  
  @override
  Widget build(BuildContext context) {

    TextEditingController txtConName = TextEditingController();
    TextEditingController txtConDsc = TextEditingController();
    String dropDownValue = "Pendiente";
    List<String> dropDownValues = [
      'Pendiente',
      'Completado',
      'En proceso'
    ];
    
    final txtNameTask = TextFormField(
      controller: txtConName,
    );

    final txtDscTask = TextFormField(
      controller: txtConDsc,
    );

    final DropdownButton ddBStatus = DropdownButton(
      value: dropDownValue,
      items: dropDownValues.map(
        (status) => DropdownMenuItem(
          value: status,
          child: Text(status)
        )
      ).toList(), 
      onChanged: (value){
        dropDownValue = value;
        setState(() { });
      }
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Column(
        children: [
          txtNameTask,
          txtDscTask,
          ddBStatus
        ],
      ),
    );
  }
}