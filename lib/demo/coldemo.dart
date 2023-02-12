import 'package:flutter/material.dart';

import '../../views/widgets/CustomAppBar.dart';


class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.white,
        title: CustomAppBar(
          word1: "Co",
          word2: "llection",

        ),
        actions: [
              IconButton(
                icon: Icon(Icons.more_vert,color: Colors.grey,),
                onPressed: () {},
              ),
             
            ],


       ),
      body: Center(child: Text('coll',style: TextStyle(fontSize: 40),)),
    );
  }
}