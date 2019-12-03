import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _TabNavigaorState createState() => _TabNavigaorState();

}

class _TabNavigaorState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('搜索'),
      ),
    );
  }

}