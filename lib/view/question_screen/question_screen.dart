import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app_task/dummy_db.dart';
import 'package:quiz_app_task/view/result_screen/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final String itemname;
  const QuestionScreen({super.key, required this.itemname});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var itemlist = [];
  int count = 0;
  int? selectedanswerindex;
  int rightAnswerCount = 0;

  CountDownController _timecontroller = CountDownController();

  @override
  void initState() {
    super.initState();
    items();
  }

  void items() {
    if (widget.itemname == "Information technology") {
      itemlist = Dummydb.technologyList;
    } else if (widget.itemname == " G K") {
      itemlist = Dummydb.GeneralknowledgeList ;
    } else if (widget.itemname == "English") {
      itemlist = Dummydb.English;
    } else   {
      itemlist = Dummydb.olympics;
    } 
  }

  void nextQuestion() {
    if (count < itemlist.length - 1) {
      setState(() {
        count++;
         selectedanswerindex = null; // Reset selected answer 
      });
    } else {
      // Navigate to the result screen if it was the last question
      //push replacement
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            RightanswerCount: rightAnswerCount,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
     
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        itemlist[count]["question"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.
                          white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.
                      white, width: 5),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 170,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        backgroundColor: Colors.
                        white,
                        child: CircularCountDownTimer(
                          duration: 30,
                          initialDuration: 0,
                          controller: _timecontroller,
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          ringColor: Colors.grey[300]!,
                          fillColor: Colors.purpleAccent[100]!,
                          backgroundColor:Colors.red,
                          strokeWidth: 8.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          autoStart: true,
                          onComplete: () {
                            selectedanswerindex = null;
                            nextQuestion();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(
                itemlist[count]["options"].length,
                (index) => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      if (selectedanswerindex == null) {
                        setState(() {
                          selectedanswerindex = index;
                          
                          if (index == itemlist[count]["answerindex"]
                          )
                          
                      
                           {
                            rightAnswerCount++;
                          }
                          
                        });
                        
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: getColor(index), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            itemlist[count]["options"][index],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.
                              white,
                            ),
                          ),
                          Icon(
                            Icons.circle_outlined,
                            color: 
                            Colors.
                            white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            if (selectedanswerindex != null)
              InkWell(
                onTap: () {
                  nextQuestion();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:Colors.white
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.
                        black,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color getColor(int optionIndex) {
    if (selectedanswerindex != null) {
      if (optionIndex == itemlist[count]["answerindex"]) {
        return Colors.green; // Correct answer
      }
      if (optionIndex == selectedanswerindex) {
        return Colors.red; // Selected answer is wrong
      }
    }
    return Colors.
    black; //  color for unselected options
  }
}