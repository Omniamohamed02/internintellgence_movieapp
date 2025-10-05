import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; 

class MyApiCallWidget extends StatefulWidget {
  @override
  _MyApiCallWidgetState createState() => _MyApiCallWidgetState();
}

class _MyApiCallWidgetState extends State<MyApiCallWidget> {
  late Dio _dio; 

  @override
  void initState() {
    super.initState();
    _dio = Dio(); 
    fetchData();
  }

  
  Future<void> fetchData() async {
    try {
      final response = await _dio.get('https://api.themoviedb.org/3/discover/movie?api_key=a7f83543ac745e9678b3e9cadfae7685&language=en&with_genres=28');
      print(response.data); 
     
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Data Example')),
      body: Center(
        child: Text('Data will be printed in console'),
      ),
    );
  }
}
