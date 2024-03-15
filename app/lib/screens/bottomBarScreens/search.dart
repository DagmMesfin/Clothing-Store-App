import '/screens/otherScreens/filter.dart';
import '/screens/otherScreens/showdetails.dart';
import '/utils/likeanimation.dart';
import '/utils/shimmerwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isShowData = false;

  Future<QuerySnapshot<Object?>> performSearchAndFilter(String searchQuery,
      [String gender = '', String color = '']) {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('products');
    Query filteredQuery = usersRef;

    if (gender.isNotEmpty) {
      filteredQuery = filteredQuery.where('gender', isEqualTo: gender);
    }

    if (color.isNotEmpty) {
      filteredQuery = filteredQuery.where('color', isEqualTo: color);
    }

    if (searchQuery.isNotEmpty) {
      filteredQuery =
          filteredQuery.where('title', isGreaterThanOrEqualTo: searchQuery);
    }

    return filteredQuery.get();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = {};
    if (ModalRoute.of(context)!.settings.arguments != null) {
      arguments =
          ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            isShowData = true;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey[400],
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: const Icon(
                              Icons.clear,
                            ),
                          ),
                          hintText: 'search here',
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Results for\" ${searchController.text}\"',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/filter',
                              arguments: searchController.text);
                        },
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            color: Color.fromARGB(255, 99, 96, 169),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                searchController.text != ''
                    ? FutureBuilder(
                        future: arguments["gender"] != null &&
                                arguments["color"] != null
                            ? performSearchAndFilter(
                                searchController.text,
                                arguments["color"] as String,
                                arguments['gender'] as String)
                            : performSearchAndFilter(searchController.text),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                children: List.generate(
                                  7,
                                  (index) => const shimmer(),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                children: List.generate(
                                    snapshot.data!.docs.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => showDetails(
                                            indexs: index,
                                            title: snapshot.data!.docs[index]
                                                ['title'],
                                            price: snapshot.data!.docs[index]
                                                ['price'],
                                            images: snapshot.data!.docs[index]
                                                ['photourl'],
                                            discription: snapshot.data!
                                                .docs[index]['description'],
                                            like: snapshot.data!.docs[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 150,
                                                width: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      snapshot.data!.docs[index]
                                                          ['photourl'],
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 150,
                                                child: likeAnimation(
                                                  snap: snapshot
                                                      .data!.docs[index],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      snapshot.data!.docs[index]
                                                          ['title'],
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    Text(
                                                      '\$ ${snapshot.data!.docs[index]['price']} ',
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipOval(
                                                  clipBehavior: Clip.antiAlias,
                                                  child: Material(
                                                    color: const Color.fromARGB(
                                                        214, 117, 73, 220),
                                                    child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          //color: Colors.purple,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          );
                        },
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          children: List.generate(
                            7,
                            (index) => const shimmer(),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
