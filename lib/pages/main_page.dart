import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MainPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("sasafdsafdfdsaf"),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.calculate), label: "계산기"),
        NavigationDestination(icon: Icon(Icons.calculate), label: "퍼센트"),
        NavigationDestination(icon: Icon(Icons.calculate), label: "환율"),
        NavigationDestination(icon: Icon(Icons.calculate), label: "주식"),
        NavigationDestination(icon: Icon(Icons.calculate), label: "임금"),
        NavigationDestination(icon: Icon(Icons.calculate), label: "이자"),
        NavigationDestination(icon: Icon(Icons.calculate), label: "날자/나이"),
        NavigationDestination(icon: Icon(Icons.calculate), label: "세계시간"),
        NavigationDestination(icon: Icon(Icons.calculate), label: "설정"),
      ]),
    );
  }
}
