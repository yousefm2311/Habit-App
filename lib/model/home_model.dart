// class HomeModel {
//   int? id;
//   String? hobby, note;
//   List<ModelDate> days_of_hobby = [];

//   HomeModel.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     hobby = json["hobby"];
//     note = json["note"];
//     json["days_of_hobby"].forEach((element) {
//       days_of_hobby.add()
//     });
//   }
// }

// class ModelDate {
//   String? value;
//   ModelDate.fromJson(Map<String, dynamic> json){

//   }
// }

class HobbyModel {
  int? id;
  List<String>? daysOfHobby;
  String? hobby;
  String? note;
  int? user;

  HobbyModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    daysOfHobby = List<String>.from(json['days_of_hobby']);
    hobby = json['hobby'];
    note = json['note'];
    user = json['user'];
  }
}
