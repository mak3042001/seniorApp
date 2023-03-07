import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senior/static.dart';
import 'package:senior/styles/IconBroken.dart';

class SeniorScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  SeniorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.noHeader,
            animType: AnimType.rightSlide,
            title: 'Edit Profile',
            body: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/no_user.png",
                  ),
                  radius: 50.0,
                ),
                awesomeDialogFormField(
                  prefix: IconBroken.Profile,
                  controller: userNameController,
                  type: TextInputType.text,
                  text: "UserName",
                ),
                awesomeDialogFormField(
                  prefix: IconBroken.Calendar,
                  controller: dateController,
                  type: TextInputType.datetime,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      dateController.text = DateFormat.yMMMd().format(value!);
                    });
                  },
                  text: "Birthday",
                ),
                awesomeDialogFormField(
                  prefix: IconBroken.Call,
                  controller: phoneController,
                  type: TextInputType.text,
                  text: "Phone Number",
                ),
                awesomeDialogFormField(
                  prefix: IconBroken.Message,
                  controller: mailController,
                  type: TextInputType.text,
                  text: "E-mail",
                ),
              ],
            ),
            btnOkText: "SUBMIT",
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        },
        child: const Icon(IconBroken.Add_User),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconBroken.Arrow___Left_2,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Seniors",
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context,index) => customCard(context),
      ),
    );
  }

  Widget customCard(BuildContext context)=> Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff3647EC), Color(0xff1E2983)]),
        ),
        height: 120,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/no_user.png",
                ),
                radius: 50.0,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Name:  ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey , fontSize: 20),
                      ),
                      Text(
                        "Mohamed Ahmed",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white, fontSize: 20 , fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Age:  " ,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey , fontSize: 20),
                      ),
                      Text(
                        "65 YEAR",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white, fontSize: 20 , fontWeight: FontWeight.bold),

                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
}
