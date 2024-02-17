import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  static var keySave = "SaveArray";

  static List<Map<String, String>> arrK = [];

  static Future<void> saveData(List<Map<String, String>> dataList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonDataList = dataList.map((data) => json.encode(data)).toList();
    await prefs.setStringList(keySave, jsonDataList);
  }

  static Future<List<Map<String, String>>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonDataList = prefs.getStringList(keySave);
    if (jsonDataList != null) {
      List<Map<String, String>> dataList = jsonDataList.map((jsonData) {
        Map<String, dynamic> parsedData = json.decode(jsonData);
        return parsedData.map((key, value) => MapEntry(key, value.toString()));
      }).toList();
      return dataList;
    } else {
      return [];
    }
  }
  }
