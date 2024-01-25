import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8,0,0,8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 100,
              child: AspectRatio(
                aspectRatio: 1.0, // Adjust the aspect ratio as needed
                child: Image.asset(
                  'assets/images/logow.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              print("Show email");
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8,0,0,8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,8,0),
                    child: Image.asset(
                      'assets/images/email.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("Show phone");
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,8,0),
                      child: Image.asset(
                        'assets/images/callicon.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
