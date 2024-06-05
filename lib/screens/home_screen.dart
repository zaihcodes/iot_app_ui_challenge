import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_app_ui_challenge/models/device_data.dart';
import 'package:iot_app_ui_challenge/models/device_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              const Color(0xAB69F0AF).withOpacity(0.4),
              Colors.amber.withOpacity(0.2)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hi, Zaihcodes',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.person,
                      size: 25,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                        bottom: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "A total of 4 devices",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "Living Room",
                                  style: TextStyle(
                                      height: 1.1,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.grey[300],
                              size: 30,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.65,
                            ),
                            itemBuilder: (context, index) {
                              final device = DeviceData.devices[index];
                              return DeviceCard(
                                device: device,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
