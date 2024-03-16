import '/database/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class likeAnimation extends StatefulWidget {
  final snap;
  final product;

  const likeAnimation({super.key, required this.snap, required this.product});

  @override
  State<likeAnimation> createState() => _likeAnimationState();
}

class _likeAnimationState extends State<likeAnimation> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await authMethod()
            .likepost(widget.product["userID"], widget.product['like']);
      },
      icon: widget.product['like'].contains(widget.snap.uid)
          ? Icon(
              Icons.favorite,
              color: Colors.redAccent,
            )
          : Icon(
              Icons.favorite_border_outlined,
              color: Colors.grey,
            ),
    );
  }
}
