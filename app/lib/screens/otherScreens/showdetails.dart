import 'package:shega_cloth_store_app/database/auth.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';

import '/utils/likeanimation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

int items = 0;
int subtotal = 0;
int total = 0;
int discount = 0;

class showDetails extends StatefulWidget {
  final int indexs;
  final price;
  final title;
  final images;
  final discription;
  final like;
  const showDetails({
    super.key,
    required this.indexs,
    required this.title,
    required this.price,
    required this.images,
    required this.discription,
    required this.like,
  });

  @override
  State<showDetails> createState() => _showDetailsState();
}

bool isfinish = true;

class _showDetailsState extends State<showDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.images),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Material(
                                    color: Colors.grey[300],
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.grey[300],
                                child: likeAnimation(
                                  product: widget.like,
                                  snap: FirebaseAuth.instance.currentUser!,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 14, top: 10),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_border_outlined,
                              size: 30,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${widget.like['like'].length}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 20,
                    ),
                    child: Text(
                      '${widget.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 105, 94, 231),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.discription,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Text(
                  'Size',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    MaterialButton(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      onPressed: () {},
                      height: 50,
                      minWidth: 50,
                      child: Text(
                        '8',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      onPressed: () {},
                      height: 50,
                      minWidth: 50,
                      child: Text(
                        '10',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      onPressed: () {},
                      height: 50,
                      minWidth: 50,
                      child: Text(
                        '38',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 10),
                  MaterialButton(
                    height: 50,
                    minWidth: 300,
                    color: Color.fromARGB(255, 144, 106, 213),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 144, 106,
                              213)), // Same color as button color
                    ),
                    onPressed: () async {
                      setState(() {
                        isfinish = false;
                      });
                      String res = await authMethod().toCart(
                        imageurl: widget.images,
                        title: widget.title,
                        price: widget.price,
                      );
                      setState(() {
                        isfinish = true;
                      });
                      if (res == 'success') {
                        showSnack('Added to cart', context);
                      } else {
                        showSnack('some error occured.cheak your connection',
                            context);
                      }
                      setState(() {
                        isfinish = true;
                      });

                      //calculating the summary

                      items = items + 1;
                      if (items <= 3) {
                        discount = 1;
                      } else {
                        discount = 3;
                      }
                      subtotal = widget.price + subtotal;
                      total = total + subtotal - discount;
                    },
                    child: isfinish
                        ? Center(
                            child: Text(
                              'Buy Now',
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: Colors.green,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: MaterialButton(
                      height: 50,
                      minWidth: 50,
                      shape: CircleBorder(
                          eccentricity: BorderSide.strokeAlignOutside),
                      onPressed: () {},
                      child: Center(
                        child: Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
