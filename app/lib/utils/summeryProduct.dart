import 'package:flutter/material.dart';
import 'package:shega_cloth_store_app/screens/otherScreens/showdetails.dart';

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
                '$items',
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
                '$subtotal',
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
                '$discount',
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
                '$total',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
