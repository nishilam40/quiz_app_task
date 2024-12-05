

import 'package:flutter/material.dart';
import 'package:quiz_app_task/dummy_db.dart';
import 'package:quiz_app_task/view/global%20widgets/container_screen.dart';
import 'package:quiz_app_task/view/question_screen/question_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
       appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: CircleAvatar(
              radius: 30,
              backgroundImage:NetworkImage("https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&w=600") ,
            ),
          ),
          SizedBox(
            width: 5,
          ),
      
      
        
        ]
       ),
        
      
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's Play",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.9),
                      itemCount: Dummydb.items.length,
                      itemBuilder: (context, index) => ContainerScreen(
                        
                        containerTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionScreen(
                                  itemname: Dummydb.items[index]["items"],
                                ),
                              ));
                        },
                        image: Dummydb.items[index]["images"],
                        items: Dummydb.items[index]["items"],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
