
class TodoModel {
  String? id;
  String? title;
  String? description;

  TodoModel({
    this.id,required this.title,required this.description,
  });
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        title: json['title'], description: json['description'], id: json['id']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['id'] = id;
    return data;
  }
  
}