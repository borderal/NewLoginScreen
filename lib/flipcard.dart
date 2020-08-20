import 'package:flutter/material.dart';
import 'package:webDemo/hud.dart';
import 'action_button.dart';
import 'package:flip_card/flip_card.dart';
import 'constants.dart';

class FlipCardWidget extends StatelessWidget {
  FlipCardWidget({@required this.size});

  final Size size;

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      front: Container(
        width: size.width / 4,
        height: size.height / 2,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black)],
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
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
                  height: 200,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: actionButton(
                    "Log In",
                  ),
                ),
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
      back: Container(
        width: size.width / 4,
        height: size.height / 2,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black)],
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white),
        child: Center(
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
    );
  }
}
