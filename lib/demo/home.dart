import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wallpaper/demo/page/collection.dart';
import 'package:wallpaper/demo/page/favorious.dart';
import 'package:wallpaper/demo/page/wallpaper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currTab=0;
  final List<Widget> screens=[
    Wallpaper(),
    Collection(),
    favorious()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currScreen=  Wallpaper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        
        bucket: bucket, 
        child: currScreen,
      ),
     bottomNavigationBar:  BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                 minWidth: 60,
                  onPressed: (){
                    setState(() {
                      currScreen=Wallpaper();
                      currTab=0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                      Icon(
                        Icons.wallpaper,
                        color:currTab==0? Colors.greenAccent: Colors.grey ,  
                      ),
                      Text(
                        'Wallpaper',
                        style: TextStyle(color:currTab==0? Colors.greenAccent: Colors.grey ,fontSize: 12),
                      )
                      
                    ],
                  ),
                  ),
                MaterialButton(
                  minWidth: 60,
                  onPressed: (){
                    setState(() {
                      currScreen=Collection();
                      currTab=1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                      Icon(
                        Icons.wallpaper,
                        color:currTab==1? Colors.greenAccent: Colors.grey ,  
                      ),
                      Text(
                        'Collection',
                        style: TextStyle(color:currTab==1?  Colors.greenAccent: Colors.grey,fontSize: 12),
                      )
                      
                    ],
                  ),
                  ),
                MaterialButton(

                  minWidth: 60,
                  onPressed: (){
                    setState(() {
                      currScreen=favorious();
                      currTab=2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                      Icon(
                        Icons.wallpaper,
                        color:currTab==2? Colors.greenAccent: Colors.grey ,  
                      ),
                      Text(
                        'Favorite',
                        style: TextStyle(color:currTab==2?  Colors.greenAccent: Colors.grey ,fontSize: 12),
                      )
                      
                    ],
                  ),
                  )
              ],
            )
          ],
        ),

      ) 
      ),
    );
  }
}