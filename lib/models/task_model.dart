class TaskModel {
  
  int? idTask;
  String? nameTask;
  String? dscTask;
  bool? sttTask;

  TaskModel({this.sttTask,this.idTask,this.nameTask,this.dscTask});
  factory TaskModel.fromMap(Map<String,dynamic> map){
    return TaskModel(
      idTask: map['idTask'],
      dscTask: map['dscTask'],
      nameTask: map['nameTask'],
      sttTask: map['sttTask']
    );
  }

}