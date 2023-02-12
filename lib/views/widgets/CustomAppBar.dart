import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  String word1;
  String word2;
   CustomAppBar({super.key , 
   
   required this.word1,
   required this.word2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: RichText(

            text: TextSpan(

              text: word1 , 
              style: TextStyle(color: Color.fromARGB(255, 184, 231, 199),
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
              children:[

                TextSpan(
                  text: " $word2",
                  style:   TextStyle(color: Color.fromARGB(255, 186, 192, 188),
                  fontSize: 15,
                  fontWeight: FontWeight.w600
                ),
                ),
              ]
            )
            ),
        ),
      ],
    );
  }
}