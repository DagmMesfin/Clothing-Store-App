import '/screens/otherScreens/checkout.dart';
import '/utils/summeryProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class productScreen extends StatefulWidget {
  const productScreen({
    super.key,
  });

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  int items = 0;
  int subtotal = 0;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Cart',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 10,
            ),
            child: Container(
              height: 360,
              color: Colors.grey[300],
              child: ListView(
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('cart')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('cart')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                      return SizedBox(
                        height: 350,
                        child: ListView.builder(
                          itemCount: (snapshot.data! as dynamic).docs.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  snapshot.data!.docs[index]
                                                      ['imageurl'],
                                                ),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20),
                                          child: Column(
                                            children: [
                                              Text(
                                                snapshot.data!.docs[index]
                                                    ['title'],
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                snapshot.data!.docs[index]
                                                    ['price'],
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.delete_outline,
                                            size: 40,
                                            color: Color.fromARGB(
                                                255, 222, 118, 122),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Row(
                                            children: [
                                              ClipOval(
                                                child: Material(
                                                  color: Color.fromARGB(
                                                      255, 121, 121, 186),
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      color: Colors.white,
                                                      size: 30,
                                                      Icons.minimize_outlined,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              ClipOval(
                                                child: Material(
                                                  color: Color.fromARGB(
                                                      255, 121, 121, 186),
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(),
            flex: 1,
          ),
          summery(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              height: 60,
              minWidth: 300,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => checkOut(),
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
    );
  }
}
