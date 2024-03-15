import '/adminSide/adminScreen/catagories/catagories.dart';
import '/adminSide/adminScreen/products/products.dart';
import 'package:flutter/material.dart';

class dashBoard extends StatefulWidget {
  const dashBoard({super.key});

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => catagories(),
              ),
            );
          },
          child: Container(
            height: 200,
            width: 250,
            child: Card(
              elevation: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('3'),
                  Text('Catagorys'),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => products(),
              ),
            );
          },
          child: Container(
            height: 200,
            width: 250,
            child: Card(
              elevation: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('3'),
                  Text('products'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
