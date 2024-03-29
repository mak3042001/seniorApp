import 'package:flutter/material.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app.dart';
import 'package:senior/data/data_source/data_source.dart';
import 'package:senior/data/network/dio_factory.dart';
import 'package:senior/main.dart';
import 'package:senior/presentation/ai_screen/ai_screen_view/ai_screen.dart';
import 'package:senior/presentation/booking/booking_view/booking.dart';
import 'package:senior/presentation/history_category/history_category_view/history_category_screen.dart';
import 'package:senior/presentation/medications/medication_view/medications.dart';
import 'package:senior/presentation/medications_code/medication_code_view/medication_code_view.dart';
import 'package:senior/presentation/notification/notification_view/notificationScreen.dart';
import 'package:senior/presentation/profile/profile_view/profileScreen.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/schedules/schedules_view/Schedules.dart';

import '../../app/di.dart';
import '../message/message_view/messageScreen.dart';



class HomeApp extends StatefulWidget {
  static const String baseImageAssets = "assets/images";


   HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<String> home = [
    StringManager.schedules,
    StringManager.information,
    StringManager.booking,
    StringManager.medications,
    StringManager.textReader,
    StringManager.chat,
    StringManager.medicationCode,
  ];

  List<String> images = [
    "${HomeApp.baseImageAssets}/Schedules.png",
    "${HomeApp.baseImageAssets}/history.jpg",
    "${HomeApp.baseImageAssets}/bookings.jpg",
    "${HomeApp.baseImageAssets}/medications.jpeg",
    "${HomeApp.baseImageAssets}/camScan.jpg",
    "${HomeApp.baseImageAssets}/chat.jpeg",
    "${HomeApp.baseImageAssets}/code.jpg",
  ];

  List<Widget> screen = [
    const SchedulesScreen(),
    const HistoryCategoriesScreen(),
    const Booking(),
    const Medications(),
     const AiScreen(),
    const MessageScreen(),
    const MedicationCodeView(),
  ];

  @override
  void initState() {
    super.initState();
    instance<DioFactory>().getDio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff283DAA),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NotificationScreen()));
            },
            icon: const Icon(IconBroken.Notification),
          ),
          title: const Text(
            "Care",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
              icon: const Icon(IconBroken.Profile),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: screen.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) =>
                custemCard(home[i], images[i], context , screen[i]),
          ),
        ));
  }

  Widget custemCard(
      String text, String images, BuildContext context, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: SizedBox(
        height: 170,
        width: 200,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    images,
                  ),
                  radius: 40,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

