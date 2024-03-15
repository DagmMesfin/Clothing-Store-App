import 'package:flutter/material.dart';

class orders extends StatelessWidget {
  const orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('0'),
          Text('gdsc group1'),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bike_scooter,
              color: Colors.blueAccent,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
