import 'package:flutter/material.dart';
import 'package:kustenpatent/screen/home/widget/header.dart';

import '../../model/data.dart';
import '../../model/detail_data.dart';
import '../../model/save_data.dart';
import '../detail/detail_screen.dart';
class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware{
  List<Map<String, String>> arrK = [];
  List<Map<String, String>> loadedData = [];

  @override
  initState() {
    super.initState();
  }

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
                          return GestureDetector(
                            onTap: (){
                              switch (index) {
                                case 0:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": DetailData.arrA,
                                        "arrB": Data.arrData,
                                        "index": index,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                        for (int i = 0; i < Data.arrData.length; i++) {
                                          if (i == 9) {
                                            Data.arrData[i]["total_que"] = returnValue.toString();
                                          }
                                        }
                                      });
                                    }
                                  });
                                break;
                                case 1: Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(),
                                    settings: RouteSettings(arguments: {
                                      "arrA": DetailData.arrB,
                                      "arrB": Data.arrData,
                                      "index": index,
                                    }),
                                  ),
                                ).then((returnValue) {
                                  if (returnValue != null) {
                                    setState(() {
                                      Data.arrData[9]["total_que"] = returnValue.toString();
                                      for (int i = 0; i < Data.arrData.length; i++) {
                                        if (i == 9) {
                                          Data.arrData[i]["total_que"] = returnValue.toString();
                                        }
                                      }
                                    });
                                  }
                                });
                                break;
                                case 2:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": DetailData.arrC,
                                        "arrB": Data.arrData,
                                        "index": index,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                        for (int i = 0; i < Data.arrData.length; i++) {
                                          if (i == 9) {
                                            Data.arrData[i]["total_que"] = returnValue.toString();
                                          }
                                        }
                                      });
                                    }
                                  });
                                break;
                                case 3:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": DetailData.arrD,
                                        "arrB": Data.arrData,
                                        "index": index,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                        for (int i = 0; i < Data.arrData.length; i++) {
                                          if (i == 9) {
                                            Data.arrData[i]["total_que"] = returnValue.toString();
                                          }
                                        }
                                      });
                                    }
                                  });
                                  break;

                                case 4:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": DetailData.arrE,
                                        "arrB": Data.arrData,
                                        "index": index,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                        for (int i = 0; i < Data.arrData.length; i++) {
                                          if (i == 9) {
                                            Data.arrData[i]["total_que"] = returnValue.toString();
                                          }
                                        }
                                      });
                                    }
                                  });
                                  break;

                                case 5:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": DetailData.arrF,
                                        "arrB": Data.arrData,
                                        "index": index,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                        for (int i = 0; i < Data.arrData.length; i++) {
                                          if (i == 9) {
                                            Data.arrData[i]["total_que"] = returnValue.toString();
                                          }
                                        }
                                      });
                                    }
                                  });
                                  break;
                                case 6:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": DetailData.arrG,
                                        "arrB": Data.arrData,
                                        "index": index,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                        for (int i = 0; i < Data.arrData.length; i++) {
                                          if (i == 9) {
                                            Data.arrData[i]["total_que"] = returnValue.toString();
                                          }
                                        }
                                      });
                                    }
                                  });
                                  break;
                                case 7:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": DetailData.arrH,
                                        "arrB": Data.arrData,
                                        "index": index,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                        for (int i = 0; i < Data.arrData.length; i++) {
                                          if (i == 9) {
                                            Data.arrData[i]["total_que"] = returnValue.toString();
                                          }
                                        }
                                      });
                                    }
                                  });
                                  break;
                                case 8:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": DetailData.arrI,
                                        "arrB": Data.arrData,
                                        "index": index,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                        for (int i = 0; i < Data.arrData.length; i++) {
                                          if (i == 9) {
                                            Data.arrData[i]["total_que"] = returnValue.toString();
                                          }
                                        }
                                      });
                                    }
                                  });
                                  break;
                                case 9:
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(),
                                      settings: RouteSettings(arguments: {
                                        "arrA": SaveData.arrK,
                                        "arrB": Data.arrData,
                                        "index": index,
                                        //"isTrue": true,
                                      }),
                                    ),
                                  ).then((returnValue) {
                                    if (returnValue != null) {
                                      setState(() {
                                        Data.arrData[9]["total_que"] = returnValue.toString();
                                      });
                                    }
                                  });
                                  break;
                                default:
                                  break;
                              }
                            },
                            child: Container(
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
                                          Column(
                                            children: [
                                              Text(
                                             '${Data.arrData[index]["total_que"]}',
                                                style: const TextStyle(
                                                  color: Colors.white, // Màu văn bản
                                                ),
                                              ),
                                              const Text("Fragen",
                                                style: TextStyle(
                                                color: Colors.white, // Màu văn bản
                                              ),)
                                            ],
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
