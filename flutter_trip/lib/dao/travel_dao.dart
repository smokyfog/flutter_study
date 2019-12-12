
import 'dart:async';
import 'dart:convert';
import 'package:flutter_trip/model/travel_model.dart';
import 'package:http/http.dart' as http;


const URL = 'https://www.devio.org/io/flutter_app/json/travel_page.json';

var params = {
  "districtId": -1,
  "groupChannelCode": "RX-OMF",
  "type": null,
  "lat": -180,
  "lon": -180,
  "locatedDistrictId": 0,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {},
  "contentType": "json"
};

// 旅拍类别接口
class TravelDao {
  static Future<TravelItemModel> fetch(
      String url,
      String groupChannelCode,
      int pageIndex,
      int pageSize
    ) async {
    Map paramsMap = params['pagePara'];
    paramsMap['pageIndex'] = pageIndex;
    paramsMap['pageSize'] = pageSize;
    params['groupChannelCode'] = groupChannelCode;

    final response = await http.post(url, body: json.encode(params));
    if(response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();  // 修复中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelItemModel.fromJson(result);
    } else {
      throw Exception('Failed to load travel');
    }
  }
}