import 'package:flutter/material.dart';
import 'package:senior/profileScreen.dart';
import 'package:senior/styles/IconBroken.dart';

class HomeApp extends StatelessWidget {
  static const String baseImageAssets = "assets/images";

  List<String> home = [
    "Schedules",
    "History",
    "Bookings",
    "Medications",
  ];
  List<String> images = [
    "$baseImageAssets/Schedules.png",
    "$baseImageAssets/history.jpg",
    "$baseImageAssets/bookings.jpg",
    "$baseImageAssets/medications.jpeg",
  ];

  HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff283DAA),
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
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: const Icon(IconBroken.Profile),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, i) =>
                CustemCard(home[i], images[i], context),
          ),
        ));
  }

  Widget CustemCard(
      String text, String images, BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => screen));
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
                SizedBox(
                  height: 15,
                ),
                Text(
                  text,
                  style: TextStyle(
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
