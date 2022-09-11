// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../views/home_page.dart';
import '../views/sign_up.dart';
import '../utils/app_large_text.dart';
import '../utils/app_text.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey();
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/weather_bg.jpg',
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Container(
            color: Colors.black54,
          ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 40,
                  child: Icon(
                    Icons.account_circle_sharp,
                    size: 60,
                    color: Colors.black87,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: AppLargeText(
                    text: 'Log In',
                    color: Colors.amber,
                    size: 20.0,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: nameController,
                          // keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: TextStyle(
                              color: Colors.amber.shade200,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: cityController,
                          decoration: InputDecoration(
                            hintText: 'City',
                            hintStyle: TextStyle(
                              color: Colors.amber.shade200,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: stateController,
                          decoration: InputDecoration(
                            hintText: 'State',
                            hintStyle: TextStyle(
                              color: Colors.amber.shade200,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: Colors.amber,
                            checkColor: Colors.amber.shade100,
                            onChanged: (value) {
                              setState(
                                () {
                                  isChecked = value!;
                                },
                              );
                            },
                          ),
                          AppText(
                            text: 'Remember Me',
                            color: Colors.amber,
                            size: 14.0,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (nameController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return HomePage(
                                  name: nameController.text,
                                );
                              },
                            ),
                          );
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Your name is required'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Container(
                        width: 300,
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.amber.shade300,
                        ),
                        child: AppLargeText(
                          text: 'Log In',
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(32, 10, 0, 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: AppText(
                              text: "Don't have an account?",
                              color: Colors.amber.shade50,
                              size: 12.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return SignUp();
                                  },
                                ),
                              );
                            },
                            child: AppLargeText(
                              text: 'Sign Up',
                              color: Colors.amber,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
