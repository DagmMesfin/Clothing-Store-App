import 'package:flutter/material.dart';

class filter extends StatefulWidget {
  const filter({super.key});

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  String gender = '';
  String color = '';
  double current_slidder = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black54,
            ),
          ),
          title: Center(
            child: Text(
              'Filter',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      height: 60,
                      minWidth: 90,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey[100],
                      onPressed: () {
                        setState(() {
                          gender = '';
                        });
                      },
                      child: Center(
                        child: Text(
                          'All',
                        ),
                      ),
                    ),
                    MaterialButton(
                      height: 60,
                      minWidth: 90,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey[100],
                      onPressed: () {
                        setState(() {
                          gender = 'male';
                        });
                      },
                      child: Center(
                        child: Text(
                          'Men',
                        ),
                      ),
                    ),
                    MaterialButton(
                      height: 60,
                      minWidth: 90,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey[100],
                      onPressed: () {
                        setState(() {
                          gender = 'female';
                        });
                      },
                      child: Center(
                        child: Text(
                          'Women',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Brand',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    smallButton(
                      text: 'Adidas',
                    ),
                    smallButton(
                      text: 'Puma',
                    ),
                    smallButton(
                      text: 'CR7',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    smallButton(
                      text: 'Nike',
                    ),
                    smallButton(
                      text: 'Yeezy',
                    ),
                    smallButton(
                      text: 'Supreme',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Price Range',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${current_slidder}',
                    ),
                    Text(
                      '\$ 543',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: current_slidder,
                  max: 500,
                  //divisions: 5,
                  label: current_slidder.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      current_slidder = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      height: 60,
                      minWidth: 90,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey[100],
                      onPressed: () {
                        setState(() {
                          color = 'white';
                        });
                      },
                      child: Center(
                        child: Text(
                          'white',
                        ),
                      ),
                    ),
                    MaterialButton(
                      height: 60,
                      minWidth: 90,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.grey[100],
                      onPressed: () {
                        setState(() {
                          color = 'black';
                        });
                      },
                      child: Center(
                        child: Text(
                          'black',
                        ),
                      ),
                    ),
                    smallButton(
                      text: 'Grey',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    smallButton(
                      text: 'Yellow',
                    ),
                    smallButton(
                      text: 'Red',
                    ),
                    smallButton(
                      text: 'Green',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Another options',
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: MaterialButton(
                    height: 70,
                    minWidth: 400,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/search',
                          arguments: {'gender': gender, 'color': color});
                    },
                    color: Colors.purple[300],
                    child: Text(
                      'Apply Filter',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class smallButton extends StatelessWidget {
  final String text;
  const smallButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60,
      minWidth: 90,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey[100],
      onPressed: () {},
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}
