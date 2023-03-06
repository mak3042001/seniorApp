import 'package:flutter/material.dart';
import 'package:senior/notificationScreen.dart';
import 'package:senior/profileScreen.dart';
import 'package:senior/styles/IconBroken.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: const Text("Contacts"),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));
          },
          icon: const Icon(IconBroken.Notification,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: const Icon(IconBroken.Profile , color: Colors.grey,),
          ),
        ],
      ),
      body: ListView.separated(itemBuilder: (context,index) => matrialList(context ,),
          separatorBuilder: (context,index)=>Divider(color: Colors.grey[600],height: 5.0), itemCount: 5),
    );
  }
}

Widget matrialList (BuildContext context ,){
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/first.jpg"),
            radius: 35,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Abdullah",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),),
              const SizedBox(
                height: 5,
              ),
              Text("hello, how are you",style: Theme.of(context).textTheme.bodySmall,),
            ],
          )
        ],
      ),
    ),
  );
}

