import '/adminSide/adminLogin.dart';
import '/database/auth.dart';
import '/prefs/loginPreference.dart';
import '/screens/first-page.dart';
import '/screens/resetpassword.dart';
import '/screens/signup.dart';
import '/utils/snackBar.dart';
import '/utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController userpasswordController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  bool isfinished = true;
  @override
  Widget build(BuildContext context) {
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
                          builder: (context) => adminLogin(),
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
            ),
            textFields(
              controller: userpasswordController,
              hint: 'Password',
              prefix: Icon(
                Icons.shopping_bag_rounded,
              ),
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
                          isfinished = false;
                        });
                        String result = await authMethod().UserSignin(
                          email: userEmailController.text,
                          password: userpasswordController.text,
                        );
                        setState(() {
                          isfinished = true;
                        });
                        if (result == 'success') {
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
                      child: isfinished
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
                            ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => reset(),
                    ),
                  );
                },
                child: Text(
                  'Forgot Password ?',
                ),
              ),
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
