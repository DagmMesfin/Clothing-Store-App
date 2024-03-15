import 'dart:typed_data';

import '../../database/user.dart';
import '/screens/otherScreens/pro.dart';
import '/screens/otherScreens/showdetails.dart';
import '/utils/likeanimation.dart';
import '/utils/pickImages.dart';
import '/utils/textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

int active_index = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final images = [
    'assets/sh1.jpg',
    'assets/sh2.jpg',
    'assets/sh3.jpg',
    'assets/sh4.jpg',
  ];

  TextEditingController userSearchController = TextEditingController();
  Uint8List? file;
  String username = '';
  String posturl = '';
  // late AnimationController _controller;
  // late Animation _coloranimation;
  @override
  void initState() {
    super.initState();

    // _controller = AnimationController(
    //   vsync: this,
    //   duration: Duration(
    //     milliseconds: 200,
    //   ),
    // );
    // _coloranimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
    //     .animate(_controller);
    // _controller.forward();
    // _controller.addListener(() {
    //   setState(() {});
    // });
    getdata();
  }

  Future<void> getdata() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(snap);

    setState(() {
      username = snap['userName'];
      posturl = snap['photourl'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: InkWell(
                  onTap: () async {
                    Uint8List im = await pickedImages(ImageSource.gallery);
                    setState(() {
                      file = im;
                    });
                  },
                  child: file != null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: MemoryImage(file!),
                        )
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            posturl,
                          ),
                        ),
                ),
                title: Text(
                  'Hello!',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                subtitle: Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notification_add_outlined,
                    ),
                  ),
                ),
              ),
              textFields(
                controller: userSearchController,
                hint: 'search here',
                prefix: Icon(
                  Icons.search,
                ),
              ),
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  return BuildImages(imagee: images[index]);
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  autoPlayAnimationDuration: Duration(microseconds: 50),
                  autoPlay: false,
                  reverse: true,
                  height: 200,
                  onPageChanged: (index, reason) {
                    setState(() {
                      active_index = index;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              indicator(index: images.length),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Pro(),
                          ),
                        );
                      },
                      child: Text(
                        'see all',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (
                  context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return buildAdvertise(
                          image: snapshot.data!.docs[index]['photourl'],
                          title: snapshot.data!.docs[index]['title'],
                          price: snapshot.data!.docs[index]['price'],
                          discription: snapshot.data!.docs[index]
                              ['description'],
                          like: snapshot.data!.docs[index],
                          index: index,
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Most Popular',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Pro(),
                          ),
                        );
                      },
                      child: Text(
                        'see all',
                      ),
                    ),
                  ),
                ],
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (
                  context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  }
                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return buildAdvertise(
                          image: snapshot.data!.docs[index]['photourl'],
                          title: snapshot.data!.docs[index]['title'],
                          price: snapshot.data!.docs[index]['price'],
                          discription: snapshot.data!.docs[index]
                              ['description'],
                          like: snapshot.data!.docs[index],
                          index: index,
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
    );
  }
}

class buildAdvertise extends StatefulWidget {
  final int index;
  final String title;
  final String price;
  final discription;
  final image;
  final like;
  const buildAdvertise({
    super.key,
    required this.index,
    required this.price,
    required this.title,
    required this.image,
    required this.discription,
    required this.like,
  });

  @override
  State<buildAdvertise> createState() => _buildAdvertiseState();
}

class _buildAdvertiseState extends State<buildAdvertise> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => showDetails(
              title: widget.title,
              discription: widget.discription,
              price: widget.price,
              images: widget.image,
              indexs: widget.index,
              like: widget.like,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 150,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        left: 120,
                        child: likeAnimation(
                          snap: widget.like,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '\$ ${widget.price}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildImages extends StatelessWidget {
  final String imagee;
  const BuildImages({super.key, required this.imagee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Image(
        image: AssetImage(imagee),
        fit: BoxFit.fill,
      ),
    );
  }
}

class indicator extends StatelessWidget {
  final int index;
  const indicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
        activeIndex: active_index,
        count: index,
        effect: JumpingDotEffect(activeDotColor: Colors.blue));
  }
}
