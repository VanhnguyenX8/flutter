import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  //Lắng nghe một ChangeNotifier , hiển thị nó cho con cháu của nó và xây dựng lại những người phụ thuộc bất cứ khi nào ChangeNotifier.notifyListaries được gọi.
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: const MyApp(),
  ));
}

class Counter with ChangeNotifier {
  int value = 0;
  
  void tang() {
    
    value = value + 1;
    // khong the thieu notifyListeners() : day la ham hien thi thong bao va hien thi cac gia tri thay doi
    notifyListeners();
    // /Gọi phương thức này bất cứ khi nào đối tượng thay đổi, để thông báo cho bất kỳ máy khách nào đối tượng có thể đã thay đổi.
    //Những người nghe được thêm vào trong lần lặp lại này sẽ không được truy cập. Những người nghe bị xóa trong lần lặp lại này sẽ không được truy cập sau khi họ bị xóa.
  }

  void giam() {
    value = value - 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ' provider_counter',
      home: MyHomePage(),
    );
  }
}
// can ChangeNotifierProvider
// ham thay doi gia tri ke thua tu [ChangeNotifier]
// Cosumer va ham read.<Counter>

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('provider counter')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            ' bam vao de tang gia tri:',
            style: TextStyle(fontSize: 20),
          ),
          // [Consumer] dùng tìm kiếm tiện ích con Nhà cung cấp tổ tiên
          // và lấy ra mô hình của nó (trong trường hợp này là Counter).
          // Sau đó, nó sử dụng mô hình đó để xây dựng các widget và sẽ kích hoạt
          // xây dựng lại nếu mô hình được cập nhật.
          Consumer<Counter>(
            builder: (context, counter, child) => Container(
                margin: const EdgeInsets.all(25),
                child: Text(
                  '${counter.value}',
                  textAlign: TextAlign.center,
                )),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: OutlinedButton(
              child: const Text(
                'tang',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                var counter = context.read<Counter>();
                counter.tang();
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.all(25),
            child: OutlinedButton(
              child: const Text(
                'giam',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                var counter = context.read<Counter>();
                counter.giam();
              },
            ),
          ),
        ],
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     var counter = context.read<Counter>();
      //     counter.tang();
      //   },
      //   tooltip: 'tang',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
