

import 'package:flutter/material.dart';
import 'package:quiz_app_task/dummy_db.dart';
import 'package:quiz_app_task/view/question_screen/question_screen.dart';


class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.RightanswerCount});
  final int RightanswerCount;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starCount = 0;

  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      left: 15, right: 15, bottom: index == 1 ? 30 : 0),
                  child: Icon(
                    Icons.star,
                    color: index < starCount
                        ? Colors.yellow
                        
                        : Colors.
                        white,
                    size: index == 1 ? 80 : 50,
                  ),
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "Congratulations",
            style: TextStyle(
                fontSize: 26,
                color: Colors.pink,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 26),
          Text("Your score",
              style: TextStyle(
                color: Colors.pink,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            "${widget.RightanswerCount} / ${Dummydb.English.length}",
            style: TextStyle(
                color: Colors.pink,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.
                        white,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.replay,color:Colors.pink,),
                
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuestionScreen(itemname: "itemname")));
                  },
                  child: Text(
                    "Retry",
                    style: TextStyle(
                        color:Colors.
                        white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ],
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.
                        white,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home,color:Colors.
                        white,),
              
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.
                        white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ],
            )),
          ),
       
        ],
      ),
    );
  }
}
