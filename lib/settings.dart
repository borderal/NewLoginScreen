import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class User {
  static const String AutomaticSignIn = 'Automatically Sign In';
  static const String DarkTheme = 'Dark Theme';
  String firstName = '';
  String lastName = '';
  Map Switches = {
    AutomaticSignIn: false,
    DarkTheme: false,
  };
  bool emailSubscription = false;
  bool mobileNotifications = false;

  save() {
    print('saving user using a web service');
  }
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 2,
        margin: EdgeInsets.fromLTRB(64, 32, 64, 64),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                  builder: (context) => Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              style: TextStyle(
                                fontFamily: 'HelveticaNeue',
                              ),
                              decoration: InputDecoration(
                                labelText: 'First name',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.firstName = val),
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Last name',
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your last name.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.lastName = val)),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text(
                                'Subscribe',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            SwitchListTile(
                                title: const Text(
                                  'Email Notifications',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.emailSubscription,
                                onChanged: (bool val) => setState(
                                    () => _user.emailSubscription = val)),
                            SwitchListTile(
                                title: const Text(
                                  'Mobile Notifications',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.mobileNotifications,
                                onChanged: (bool val) => setState(
                                    () => _user.mobileNotifications = val)),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                              child: Text(
                                'Interests',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'HelveticaNeue',
                                ),
                              ),
                            ),
                            CheckboxListTile(
                                title: const Text(
                                  'Automatically Sign In',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.Switches[User.AutomaticSignIn],
                                onChanged: (val) {
                                  setState(() => _user
                                      .Switches[User.AutomaticSignIn] = val);
                                }),
                            CheckboxListTile(
                                title: const Text(
                                  'Dark Theme',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                ),
                                value: _user.Switches[User.DarkTheme],
                                onChanged: (val) {
                                  Brightness currentBrightness =
                                      DynamicTheme.of(context).brightness;
                                  DynamicTheme.of(context).setBrightness(
                                      currentBrightness == Brightness.light
                                          ? Brightness.dark
                                          : Brightness.light);
                                }),
                            Container(
                                height: 80,
                                // margin: EdgeInsets.only(left: 200, right: 200),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                    color: Color(0xFF0D46BB),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        _user.save();
                                        _showDialog(context);
                                        print(_user);
                                        print(_user.firstName);
                                      }
                                    },
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'HelveticaNeue',
                                      ),
                                    ))),
                          ])))),
        ),
      ),
    );
    void toggleTheme() {
      //toggle the theme from dark to light
      Brightness currentBrightness = DynamicTheme.of(context).brightness;
      DynamicTheme.of(context).setBrightness(
          currentBrightness == Brightness.light
              ? Brightness.dark
              : Brightness.light);
    }
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}
