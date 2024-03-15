import '/adminSide/adminScreen/products/products.dart';
import '/utils/collections.dart';
import 'package:flutter/material.dart';

class catagories extends StatelessWidget {
  const catagories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                height: 200,
                width: 250,
                child: Card(
                  elevation: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => catagories(),
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                collection().im[0],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text('Mens'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 200,
                width: 250,
                child: Card(
                  elevation: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => products(),
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                collection().im[2],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text('Kids'),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          child: Container(
            height: 200,
            width: 250,
            child: Card(
              elevation: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => products(),
                    child: Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            collection().im[1],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text('  Womens'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
