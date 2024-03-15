import 'package:flutter/material.dart';

class summery extends StatelessWidget {
  const summery({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order summary',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items',
              ),
              Text(
                '3',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
              ),
              Text(
                '\$567',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
              ),
              Text(
                '\$5',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charges',
              ),
              Text(
                '\$2',
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 4,
            color: Colors.black54,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Total',
              ),
              Text(
                '\$423',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
