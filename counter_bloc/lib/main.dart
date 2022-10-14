import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counterpage.dart';
import 'counter/handle.dart';
import 'counter/view.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

// lop quan sat tat ca cac su thay doi trang thai trong ung dung
class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print('${bloc.runtimeType} ${change}');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}
