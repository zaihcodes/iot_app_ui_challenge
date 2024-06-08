import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_app_ui_challenge/models/device_data.dart';
import 'package:iot_app_ui_challenge/models/device_model.dart';
import 'package:iot_app_ui_challenge/screens/home/widgets/device_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DeviceModel> devices = DeviceData.devices;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


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
                              final bgColor = int.parse('0xFF${devices[index].color.replaceAll('#', '')}');
                              return DevicesWidget(
                                name: devices[index].name,
                                svg: devices[index].icon,
                                color: Color(bgColor),
                                isActive: devices[index].isActive,
                                device: devices[index],
                                onChanged: (val) {
                                  setState(() {
                                    devices[index].isActive =
                                    !devices[index].isActive;
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





