import 'package:app/adminSide/adminScreen/order/orders.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/otherScreens/orders.dart';
import 'package:app/utils/summeryProduct.dart';
import 'package:flutter/material.dart';

class checkOut extends StatefulWidget {
  const checkOut({super.key});

  @override
  State<checkOut> createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 30,
            ),
          ),
        ),
        title: Center(
          child: Text(
            'Check Out',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Material(
                  color: Colors.grey[200],
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_city,
                    ),
                  ),
                ),
              ),
              title: Text(
                '325 15th eighth Avenue,NewYork',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('sephjfvdfvf dvf/m bg  fgfbfgbgfb'),
            ),
            ListTile(
              leading: ClipOval(
                child: Material(
                  color: Colors.grey[200],
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.lock_clock_outlined,
                    ),
                  ),
                ),
              ),
              title: Text(
                '325 15th eighth Avenue,NewYork',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('sephjfvdfvf dvf/m bg  fgfbfgbgfb'),
            ),
            SizedBox(
              height: 40,
            ),
            summery(),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose payment method',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.payment,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text('Paypal'),
                    ),
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.credit_card,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text('Credit Card'),
                    ),
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.attach_money,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text('Cash'),
                    ),
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: MaterialButton(
                height: 60,
                minWidth: 400,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ordersuser(),
                    ),
                  );
                },
                color: Color.fromARGB(255, 135, 121, 170),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Check Out',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
