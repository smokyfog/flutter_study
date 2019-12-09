import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/search_dao.dart';
import 'package:flutter_trip/model/search_model.dart';
import 'package:flutter_trip/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _TabNavigaorState createState() => _TabNavigaorState();

}

class _TabNavigaorState extends State<SearchPage> {
  String showText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SearchBar(
            hideLeft: true,
            defaultText: '哈哈',
            hint: '123',
            leftButtonClick: () {
              Navigator.pop(context);
            },
            onChanged: _onTextChange,
          ),
          InkWell(
            onTap: () {
              SearchDao.fetch('https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=%E9%95%BF%E5%9F%8E')
              .then((SearchModel value) {
                setState(() {
                  showText = value.data[0].url;
                });
              })
              ;
            },
            child: Text('get'),
          ),
          Text(showText)
        ],
      )
    );
  }
  _onTextChange(text) {

  } 
}