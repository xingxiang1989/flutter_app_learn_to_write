import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/ui/providertest/bean/mymodel.dart';
import 'package:provider/provider.dart';

class ProviderTestPage extends StatefulWidget {
  @override
  _ProviderTestPageState createState() => _ProviderTestPageState();
}

class _ProviderTestPageState extends State<ProviderTestPage> {
  @override
  Widget build(BuildContext context) {
    print("build ooooo");
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: [
            //这里用builder封装一下，用于获取Model
            Builder(
              builder: (context){
                // 获取到provider提供出来的值
                MyModel _model = Provider.of<MyModel>(context);
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  color: Colors.lightBlueAccent,
                  child: Text('当前是：${_model.counter}'),
                );
              },
            ),
            Consumer<MyModel>(builder: (BuildContext context, MyModel model, Widget
            child){
              print("build container1");

              return Container(
                margin: const EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                color: Colors.lightGreen,
                child: Text(
                  '${model.counter}',
                ),
              );
            }),

            Builder(
              builder: (context){
                print('build textview dddd');
                return Text(
                    'ddddd'
                );
              },
            ),

            Consumer<MyModel>(builder: (context ,model, child){
              print("build container2");

              return TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states){
                      //设置按下时的背景颜色
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue[200];
                      }
                      return Colors.tealAccent;
                    }
                    ),
                  ),
                  onPressed:model.incrementCounter,
                  child: Icon(Icons.add));
            })
          ],
        )
      ),
    );
  }
}
