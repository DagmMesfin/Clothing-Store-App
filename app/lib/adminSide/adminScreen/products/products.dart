import '/adminSide/adminScreen/products/addingProduct.dart';
import '/adminSide/adminScreen/products/editPro.dart';
import '/adminSide/adminScreen/products/bottomsheet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class products extends StatelessWidget {
  const products({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data!.docs.length,
                  (index) {
                    return GestureDetector(
                      child: Container(
                        height: 200,
                        width: 250,
                        child: Card(
                          elevation: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      snapshot.data!.docs[index]['photourl'],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data!.docs[index]['title'],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => editProduct(
                                            snap: snapshot.data!.docs[index],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showBottom(
                                        context,
                                        snapshot.data!.docs[index]['postId'],
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: -1,
              right: -1,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => addPro(),
                    ),
                  );
                },
                backgroundColor: Color.fromARGB(255, 110, 102, 195),
                child: Icon(
                  Icons.add,
                ),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
