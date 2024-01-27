import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static var keySave = "SaveArray";

  static var arrK = [
    {
      "question": "Was sind die wichtigsten Flaggen des internationalen Flaggenalphabets, die ständig an Bord sein sollten?",
      "ans1": "die Flaggen Alpha, Charlie und Bravo.",
      "ans2": "die Flaggen Quebec, Charlie und November.",
      "ans3": "die Flaggen Oscar, Sierra und Bravo.",
      "right": "2"
    },
  ];

  static void saveData(List<Map<String, dynamic>> arrK) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        "SaveData", arrK.map((e) => e.toString()).toList());
  }

  static Future<List<Map<String, String>>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? dataList = prefs.getStringList("SaveData");
    if (dataList != null) {
      List<Map<String, String>> arrK = dataList.map((e) {
        final Map<String, dynamic> parsedData = json.decode(e);
        return Map<String, String>.from(parsedData);
      }).toList();
      return arrK;
    } else {
      return [];
    }
  }
}
