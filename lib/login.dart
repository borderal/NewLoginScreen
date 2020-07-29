import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'action_button.dart';
import 'package:flip_card/flip_card.dart';

Color kPrimaryColor = Color(0xFFFE4350);

class LogIn extends StatefulWidget {
  static String id = '/login_page';
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

    print(size.height);
    print(size.width);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Center(
              child: FlipCard(
                key: cardKey,
                flipOnTouch: false,
                front: Center(
                  child: Container(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: size.height *
                            (size.height > 770
                                ? 0.7
                                : size.height > 670 ? 0.8 : 0.9),
                        width: 500,
                        color: Colors.white,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterLogo(),
                                  Text(
                                    "LOG IN",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 30,
                                    child: Divider(
                                      color: kPrimaryColor,
                                      thickness: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      labelText: 'Email',
                                      suffixIcon: Icon(
                                        Icons.mail_outline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      labelText: 'Password',
                                      suffixIcon: Icon(
                                        Icons.lock_outline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 64,
                                  ),
                                  actionButton("Log In"),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "You do not have an account?",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          cardKey.currentState.toggleCard();
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: kPrimaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                back: Center(
                  child: Container(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: size.height *
                            (size.height > 770
                                ? 0.7
                                : size.height > 670 ? 0.8 : 0.9),
                        width: 500,
                        color: Colors.white,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterLogo(),
                                  Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 30,
                                    child: Divider(
                                      color: kPrimaryColor,
                                      thickness: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Name',
                                      labelText: 'Name',
                                      suffixIcon: Icon(
                                        Icons.person_outline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      labelText: 'Email',
                                      suffixIcon: Icon(
                                        Icons.mail_outline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      labelText: 'Password',
                                      suffixIcon: Icon(
                                        Icons.lock_outline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 64,
                                  ),
                                  actionButton("Create Account"),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account?",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          cardKey.currentState.toggleCard();
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Log In",
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: kPrimaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width / 2,
                  color: kPrimaryColor,
                ),
                Container(
                    height: double.infinity,
                    width: size.width / 2,
                    color: Colors.white),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up Today!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "It's easy and takes less than 30 seconds",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "HOME",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Icon(
                  Icons.menu,
                  color: Color(0xFFFE4350),
                  size: 28,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.copyright,
                      color: Colors.grey,
                      size: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Copyright 2020",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
