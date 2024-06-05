import 'package:iot_app_ui_challenge/models/device_model.dart';

class DeviceData {
  static List<DeviceModel> devices = [
    DeviceModel(
        name: 'Smart Spotlight',
        isActive: true,
        color: "#ff5f5f",
        icon: 'assets/svg/light.svg'),
    DeviceModel(
        name: 'Smart AC',
        isActive: true,
        color: "#7739ff",
        icon: 'assets/svg/ac.svg'),
    DeviceModel(
        name: 'Smart TV',
        isActive: false,
        color: "#c9c306",
        icon: 'assets/svg/tv.svg'),
    DeviceModel(
        name: 'Smart Sound',
        isActive: false,
        color: "#c207db",
        icon: 'assets/svg/speaker.svg'),
  ];
}
