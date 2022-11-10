import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// void main() => runApp(MyApp());

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(create: (_) => MyModel()),
        ChangeNotifierProvider<TextModel>(create: (_) => TextModel()),
        ChangeNotifierProvider<SettingModel>(create: (_) => SettingModel()),
      ],
      child: MyApp(),
    ));
    
    class SettingModel extends ChangeNotifier{
      bool _isdark = false;
      get isdask => _isdark;
      void setTheme(value) {
        _isdark = value;
        notifyListeners();
      }
      
    }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: context.watch<SettingModel>().isdask ? Brightness.dark : Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Basic'),
          actions: [
            Switch(value: context.watch<SettingModel>().isdask, onChanged: (value) {
              Provider.of<SettingModel>(context, listen: false).setTheme(value);
             
            })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Consumer<TextModel>(builder: (context, value, child) {
                return ElevatedButton(
                    onPressed: () {
                      value.doSomething();
                    },
                    child: child);
              }),
            ),
            Container(
              child: Consumer<TextModel>(builder: (context, value, child) {
                return Text(value.name);
              }),
            ),
            Column(children: <Widget>[
              Text(
                '${context.watch<MyModel>().i.toString()}',
              ),
            ])
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.read<MyModel>().tang();
          },
          label: const Text('data'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  int i = 0;
  void tang() {
    i = i + 1;
    notifyListeners();
  }

  void giam() {
    i = i - 1;
    notifyListeners();
  }
}

class TextModel with ChangeNotifier {
  String name = 'text';
  void doSomething() {
    name = 'new text';
    notifyListeners();
  }
}
