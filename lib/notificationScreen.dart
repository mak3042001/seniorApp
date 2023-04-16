import 'package:flutter/material.dart';
import 'package:senior/contactScreen.dart';
import 'package:senior/profileScreen.dart';
import 'package:senior/styles/IconBroken.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ContactsScreen()));
          },
            child: const Text("Contacts" , style: TextStyle(color: Colors.grey),)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconBroken.Arrow___Left_2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconBroken.Notification,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: const Icon(IconBroken.Profile , color: Colors.grey,),
          ),
        ],
      ),
      body: ListView.separated(itemBuilder: (context,index) => matrialList(context , index),
          separatorBuilder: (context,index)=>Divider(color: Colors.grey[600],height: 5.0), itemCount: 5),
    );
  }
}

Widget matrialList (BuildContext context , int i){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: 70,
      // child: ListTile(
      //   onTap: (){
      //     // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
      //   },
      //
      //   title: Text(
      //     "text",
      //     style: const TextStyle(
      //         fontSize: 25,
      //         fontWeight: FontWeight.bold
      //     ),
      //   ),
      //   leading: CircleAvatar(
      //     radius: 30,
      //     backgroundImage: AssetImage(
      //       "assets/first.jpg",
      //     ),
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("title$i",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),),
          const SizedBox(
            height: 5,
          ),
          Text("you must take bla bla",style: Theme.of(context).textTheme.bodySmall,),
        ],
      ),
    ),
  );
}

