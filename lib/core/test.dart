import 'package:flutter/material.dart';
import 'package:dio/dio.dart'; // تأكد من استيراد مكتبة Dio

class MyApiCallWidget extends StatefulWidget {
  @override
  _MyApiCallWidgetState createState() => _MyApiCallWidgetState();
}

class _MyApiCallWidgetState extends State<MyApiCallWidget> {
  late Dio _dio; // تعريف Dio

  @override
  void initState() {
    super.initState();
    _dio = Dio(); // تهيئة Dio
    fetchData(); // استدعاء الدالة لجلب البيانات
  }

  // دالة جلب البيانات من API
  Future<void> fetchData() async {
    try {
      final response = await _dio.get('https://api.themoviedb.org/3/discover/movie?api_key=a7f83543ac745e9678b3e9cadfae7685&language=en&with_genres=28');
      print(response.data); // طباعة البيانات في الكونسول

      // هنا ممكن تحط الكود عشان تعرض البيانات في واجهة المستخدم (UI)
    } catch (e) {
      print('Error: $e'); // إذا حصلت أي مشكلة في جلب البيانات
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
