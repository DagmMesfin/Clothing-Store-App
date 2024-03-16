import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/screens/profile/about_us.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 40),
          SizedBox(width: 100),
          Text(
            'Contact Us',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              width: 300,
              height: 300,
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                        ),
                      ]),
                  SizedBox(height: 15),
                  Text(
                    'Talk to us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'We\'ll help you find the right products\n               and pricing for you,')
                ],
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 20),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactSection()),
          );
        },
        child: ElevatedButton(
          onPressed: () {
            launch(
                'tel:+1234567890'); // Replace phone number with your desired number
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fixedSize: Size(250, 40),
          ),
          child: Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 7),
              Text('Call +1234567890'), // Display phone number
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      SizedBox(height: 5),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactSection()),
          );
        },
        child: ElevatedButton(
          onPressed: () {
            launch(
                'https://t.me/DSCAASTU'); // Replace phone number with your desired number
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fixedSize: Size(250, 40),
          ),
          child: Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 7),
              Text('Telegram'), // Display phone number
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      SizedBox(height: 5),
      GestureDetector(
        onTap: () {},
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fixedSize: Size(250, 40),
          ),
          child: Row(
            children: [
              Icon(Icons.facebook),
              SizedBox(width: 7),
              Text('Facebok'),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      SizedBox(height: 5),
      SizedBox(height: 5),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactSection()),
          );
        },
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fixedSize: Size(250, 40),
          ),
          child: Row(
            children: [
              Icon(Icons.mail),
              SizedBox(width: 7),
              Text('Email'),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUSSection()),
          );
        },
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutUSSection()),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fixedSize: Size(350, 100),
          ),
          child: Row(
            children: [
              Icon(Icons.web),
              SizedBox(width: 7),
              Text('Visit our website\n\n'),
              Text('About US ?'),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    ]))));
  }
}
