import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_nhom2/model/product.dart';

class API {
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    var url = 'https://fakestoreapi.com/products';
    var response = await dio.request(url);
    List<Product> ls = [];
    if (response.statusCode == 200) {
      List data = response.data;
      ls = data.map(
        (json)=>Product.formJson(json))
      .toList();
    } else {
      print('Lỗi chi đó rồi tề ');
    }
    return ls;
  }
}

var testAPI = API();