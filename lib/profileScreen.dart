import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senior/static.dart';
import 'styles/IconBroken.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff3647EC), Color(0xff1E2983)]
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(100.0),
                    )
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                IconBroken.Arrow___Left_2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 295.0,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    IconBroken.Profile,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                               Text(
                                "Senior",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/first.jpg",
                        ),
                        radius: 65.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              defaultFormField(
                type: TextInputType.name,
                text: "Mohamed Ahmed",
                prefix: IconBroken.Profile,
              ),
              const SizedBox(
                height: 10.0,
              ),
              defaultFormField
                (
                controller: dateController,
                type: TextInputType.datetime,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((value)
                  {
                    dateController.text = DateFormat.yMMMd().format(value!);
                  }
                  );
                },
                text: dateController.text != null ? "30/4/2001":dateController.text,
                prefix: IconBroken.Calendar,
              ),
              const SizedBox(
                height: 10.0,
              ),
              defaultFormField(
                type: TextInputType.number,
                text: "01149718874",
                prefix: IconBroken.Call,
              ),
              const SizedBox(
                height: 10.0,
              ),
              defaultFormField(
                type: TextInputType.emailAddress,
                text: "mak3042001@gmail.com",
                prefix: IconBroken.Message,
              ),
              const SizedBox(
                height: 10.0,
              ),
              defaultFormField(
                  onTap: null,
                  type: TextInputType.none,
                  text: "Password",
                  prefix: IconBroken.Lock,
                  suffix: IconBroken.Edit,
                  suffixpressed: (){}
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: 250,
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xff3849EF), Color(0xff1F2883)]
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
