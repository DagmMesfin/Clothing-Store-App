import '/utils/snackBar.dart';
import '/utils/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class reset extends StatefulWidget {
  reset({super.key});

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();
  bool isfinished = true;
  Future resetpassword() async {
    try {
      setState(() {
        isfinished = false;
      });
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      setState(() {
        isfinished = true;
      });
      return showSnack('check your email.we send you the reset link.', context);
    } catch (e) {
      print(
        e.toString(),
      );
      setState(() {
        isfinished = true;
      });
      return showSnack(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Enter your Email and we will send you a link to reset your password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          textFields(
            maxLines: 1,
            hint: 'Enter your Email',
            controller: email,
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            height: 50,
            minWidth: 100,
            onPressed: resetpassword,
            color: Color.fromARGB(255, 122, 115, 174),
            child: isfinished
                ? Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}
