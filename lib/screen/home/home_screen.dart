import 'package:flutter/material.dart';
import 'package:kustenpatent/screen/home/widget/header.dart';

import '../../model/data.dart';
class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Header(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 320,
                      color: Colors.red,
                      child: Image.asset(
                        'assets/images/defaultimage.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,0,20),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.blue,
                            margin: const EdgeInsets.all(4.0),
                            child: Stack(
                              children: [
                                Image.asset(
                                  '${Data.arrData[index]["img"]}',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    color: Colors.black.withOpacity(0.3), // Màu nền cho văn bản
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context).size.width / 2,
                                              maxHeight: 50,// Set maximum width to half of the screen width
                                            ),
                                            child: Text(
                                              '${Data.arrData[index]["title"]}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                color: Colors.white, // Màu văn bản
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          '123',
                                          style: TextStyle(
                                            color: Colors.white, // Màu văn bản
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: Data.arrData.length,
                      ),
                    ),
                  ],
                ),
          ),
        ],
      )
    );
  }
}
