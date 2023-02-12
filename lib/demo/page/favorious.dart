import 'package:flutter/material.dart';

import '../../views/widgets/CustomAppBar.dart';


class favorious extends StatefulWidget {
  const favorious({Key? key}) : super(key: key);

  @override
  State<favorious> createState() => _favoriousState();
}

class _favoriousState extends State<favorious> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomAppBar(
          word1: "Fa",
          word2: "vorite",

        ),
        actions: [
              IconButton(
                icon: Icon(Icons.more_vert,color: Colors.grey,),
                onPressed: () {},
              ),
             
            ],

        ),
      body: Center(child: Text('Wall',style: TextStyle(fontSize: 40),)),
    );
  }
}