import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/screens/login.dart';

import '/database/auth.dart';
import '/prefs/loginPreference.dart';
import '/screens/first-page.dart';
import '/utils/snackBar.dart';
import '/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isCheak = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  bool isFinishedLogin = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    DocumentSnapshot<Map<String, dynamic>> userData;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
                left: 30,
              ),
              child: Text(
                'Getting Started',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'create an account to continue,',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            textFields(
              controller: userEmailController,
              hint: ' email',
              prefix: Icon(
                Icons.email_outlined,
              ),
              maxLines: 1,
            ),
            textFields(
              controller: usernameController,
              hint: 'username',
              prefix: Icon(
                Icons.person_2_outlined,
              ),
              maxLines: 1,
            ),
            textFields(
              controller: userpasswordController,
              hint: 'Password',
              prefix: Icon(
                Icons.password_outlined,
              ),
              maxLines: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Checkbox(
                    value: isCheak,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          isCheak = value;
                        });
                      }
                    },
                    visualDensity: VisualDensity(
                      horizontal: -3.0,
                      vertical: -3.0,
                    ),
                  ),
                  Text(
                    'By creating an account, you agree to our\n Term and Condition',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<defaultt>(
                  builder: (context, value, child) {
                    return MaterialButton(
                      height: 60,
                      minWidth: width * 0.8,
                      color: Color.fromARGB(255, 128, 140, 220),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () async {
                        setState(() {
                          isFinishedLogin = true;
                        });
                        String result = await authMethod().UserSignUp(
                          userName: usernameController.text,
                          email: userEmailController.text,
                          password: userpasswordController.text,
                        );
                        setState(() {
                          isFinishedLogin = false;
                        });
                        if (result == 'success') {
                          userData = await _firestore
                              .collection('users')
                              .doc(
                                FirebaseAuth.instance.currentUser!.uid,
                              )
                              .get();

                          print(userData.data());
                          Provider.of<UserProvider>(context, listen: false)
                              .userSignInMap(userData.data()!);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => first(),
                            ),
                          );
                          setState(() {
                            value.toggle();
                            value.isUserLogin();
                          });
                        } else {
                          showSnack(
                            'please,enter correct information or register first!',
                            context,
                          );
                        }
                      },
                      child: isFinishedLogin
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              width: width * 0.6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Sign up',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.login_outlined,
                                  ),
                                ],
                              ),
                            ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You have an account? '),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => signin(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign In',
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
