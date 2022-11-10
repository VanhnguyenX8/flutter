import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget with ChangeNotifier{
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider<MyModel>( //                                <--- Provider
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                // Consumer xay dung lai Widget nhung de toi uu dung luong thi k nhat thiet phai build lai ca ElevatedButton
                // chinh vi the ma dung [Provider.of]
                  builder: (context, myModel, child) {
                    return ElevatedButton(
                      child: Text('Do something'),
                      onPressed: (){
                        // We have access to the model.
                        myModel.doSomething();
                      },
                    );
                  },
                )
               
              ),

              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
// khong thay doi giao dien khi gia tri data da thay doi. Vi provider widget k lang nghe nhung thay doi ve gia tri ma no cung cap
// changeNotifier lang nghe cac thay doi trong data models khi co thay doi no se dung lai bat ki widget nao trong cosumner 

class MyModel with ChangeNotifier{ //                                               <--- MyModel
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();// thpng bao co cay widget build lai
  }
}
