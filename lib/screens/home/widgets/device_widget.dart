
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iot_app_ui_challenge/models/device_model.dart';
import 'package:iot_app_ui_challenge/screens/control_panel/control_panel_screen.dart';

class DevicesWidget extends StatelessWidget {
  final String name;
  final String svg;
  final Color color;
  final bool isActive;
  final Function(bool) onChanged;
  final DeviceModel device;
  const DevicesWidget(
      {
        required this.name,
        required this.svg,
        required this.color,
        required this.onChanged,
        required this.isActive,
        required this.device,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        transitionDuration: const Duration(milliseconds: 600),
        closedElevation: 0,
        openElevation: 0,
        openShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        openBuilder: (BuildContext context, VoidCallback _) {
          return  ControlPanelScreen(tag: name,);
        },
        tappable: name == "Smart AC" ? true : false,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 0.6,
              ),
              color: isActive ? color : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        svg,
                        color: isActive ? Colors.white : Colors.black,
                        height: 35,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 65,
                        child: Text(
                          name,
                          style: TextStyle(
                              height: 1.2,
                              fontSize: 14,
                              color: isActive ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    alignment: Alignment.center,
                    scaleY: 0.8,
                    scaleX: 0.85,
                    child: CupertinoSwitch(
                      onChanged: onChanged,
                      value: device.isActive,
                      activeColor: isActive
                          ? Colors.white.withOpacity(0.4)
                          : Colors.black,
                      trackColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


}
