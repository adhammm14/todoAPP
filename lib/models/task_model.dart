class TaskModel {
  String? date;
  String? title;
  String? startTime;
  String? endTime;
  String? description;
  String? category;


  TaskModel({required this.date,required this.title,required this.startTime,
    required this.endTime,
    required this.description,
    required this.category});

  TaskModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    title = json['title'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    description = json['description'];
    category = json['category'];

  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'title': title,
      'startTime': startTime,
      'endTime': endTime,
      'description' : description,
      'category' : category,
    };
  }
}