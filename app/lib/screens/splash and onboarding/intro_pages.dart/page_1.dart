import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Page_1 extends StatelessWidget {
  const Page_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
               Color(0xffB81736),
                Color(0xff281537),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/on_boarding_images/1.gif',
                  height: 300,
                  width: 300,
                ),
                Text(
                  'Shega Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            
          ],
        ),
      );
  }
}