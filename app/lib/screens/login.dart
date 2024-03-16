import 'package:shega_cloth_store_app/database/googleauth.dart';
import 'package:shega_cloth_store_app/database/provider.dart';
import 'package:shega_cloth_store_app/screens/otherScreens/resetpassword.dart';
import 'package:shega_cloth_store_app/utils/smallContainer.dart';

import '/adminSide/adminLogin.dart';
import '/database/auth.dart';
import '/prefs/loginPreference.dart';
import '/screens/first-page.dart';
import '/screens/signup.dart';
import '/utils/snackBar.dart';
import '/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController userpasswordController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  bool isloggedin = true;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userData;
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AdminLogin(),
                        ),
                      );
                    },
                    child: Text(
                      'Admin Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
                left: 30,
              ),
              child: Text(
                'Let\'s Sign You In',
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
                'Welcome back,',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            textFields(
              controller: userEmailController,
              hint: 'Username or email',
              prefix: Icon(
                Icons.person_2_outlined,
              ),
              maxLines: 1,
            ),
            textFields(
              controller: userpasswordController,
              hint: 'Password',
              prefix: Icon(
                Icons.shopping_bag_rounded,
              ),
              maxLines: 1,
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
                        minWidth: 400,
                        color: Color.fromARGB(255, 128, 140, 220),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () async {
                          setState(() {
                            isloggedin = false;
                          });
                          String result = await authMethod().UserSignin(
                            email: userEmailController.text,
                            password: userpasswordController.text,
                          );
                          setState(() {
                            isloggedin = true;
                          });
                          if (result == 'success') {
                            var snapshot = await _firestore
                                .collection('users')
                                .doc(
                                  FirebaseAuth.instance.currentUser!.uid,
                                )
                                .get();
                            userData = snapshot.data()!;
                            print(userData);
                            Provider.of<UserProvider>(context, listen: false)
                                .userSignInMap(userData);

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
                        child: isloggedin
                            ? Container(
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Signin',
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
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              ));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Center(
              child: TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>reset(),),);
              }, child: Text('Forgot Password ?',style: TextStyle(fontSize: 15,color: Colors.blue[500],),),),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account ? '),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => signup(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            smallcont(
              images: 'assets/google.jpg',
              ontapp: () => google().signInWithGoogle(),
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
