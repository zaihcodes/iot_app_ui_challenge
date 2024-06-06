import 'dart:ui';

class DeviceModel {
  String name = "";
  String color = "";
  bool isActive = false;
  String icon = "";

  DeviceModel(
      {required this.name,
      required this.color,
      required this.isActive,
      required this.icon});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
    isActive = json['isActive'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['color'] = color;
    data['isActive'] = isActive;
    data['icon'] = icon;
    return data;
  }

  getColor() {
    var hexColor = color.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
