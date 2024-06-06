
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/device_model.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    required this.device,
    super.key,
  });

  final DeviceModel device;

  @override
  State<DeviceCard> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late bool isOn;
  @override
  void initState() {
    super.initState();
    isOn = widget.device.isActive;
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = int.parse('0xFF${widget.device.color.replaceAll('#', '')}');
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
          color: isOn ? Color(bgColor) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              widget.device.icon,
              height: 40,
              // ignore: deprecated_member_use
              color: isOn ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: 60,
              child: Text(
                widget.device.name,
                maxLines: 2,
                style: TextStyle(
                  color: isOn ? Colors.white : Colors.black,
                ),
              ),
            ),
            CupertinoSwitch(
              value: isOn,
              onChanged: (value) {
                setState(() {
                  isOn = value;
                });
              },
              trackColor: Colors.black,
              activeColor: Colors.white.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}