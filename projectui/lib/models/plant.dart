import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Plant {
  int ID, UserID,Likes;
  String? PlantName,PlantPic;
  Plant(
      {required this.ID,
      required this.UserID,
      required this.PlantName,
      required this.PlantPic,
      required this.Likes
      });

  // factory UserRegister.fromJson(Map<String, dynamic> json) =>
  //     _$UserRegisterFromJson(json);
  // Map<String, dynamic> toJson() => _$UserRegisterToJson(this);
  Plant.fromJson(Map<String, dynamic> json)
      :
        ID = json["id"],
        PlantName = json['plant_name'],
        UserID = json['user_id'],
        PlantPic = json['plant_pic'],
        Likes = json['likes'];

  Map<String, dynamic> toJson() => {
        'id':ID,
        'user_id': UserID,
        'plant_name': PlantName,
        "plant_pic": PlantPic,
        'likes': Likes
      };
}