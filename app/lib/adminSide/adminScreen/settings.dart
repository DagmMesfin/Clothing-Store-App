import 'package:flutter/material.dart';

class setting extends StatelessWidget {
  const setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: Center(
              child: Text('G'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Name'),
          Card(
            child: Text('gdsc team1 '),
          ),
          Text('email'),
          Card(
            child: Text('gdscTeam1@gmail.com '),
          ),
        ],
      ),
    );
  }
}
