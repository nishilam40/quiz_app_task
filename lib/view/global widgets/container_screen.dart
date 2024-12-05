


import 'package:flutter/material.dart';


class ContainerScreen extends StatelessWidget {
  final String image;
  final String items;
  final void Function()? containerTap;
  const ContainerScreen(
      {super.key,
      required this.image,
      required this.items,
      required this.containerTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: containerTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.
                        grey,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Image.network(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items,
                      style: TextStyle(
                          color:Colors.
                        white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "10 Questions",
                      style: TextStyle(
                          color: Colors.
                        white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
