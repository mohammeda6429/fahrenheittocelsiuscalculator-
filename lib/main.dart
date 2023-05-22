import 'package:flutter/material.dart';

void main() {
  runApp(const fahrenheittocelsius());
}

class fahrenheittocelsius extends StatelessWidget {
  const fahrenheittocelsius({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fahrenheit to Celcius Calc',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fahrenheit to Celcius Dev: Amin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String t1='',result='';double n1=0.0;Color clr=Colors.grey, fc=Colors.black;
  TemperatureConvert t=TemperatureConvert();

  void _incrementCounter() {
    setState(() {
      result=t.convert(F:n1);
      print('button is clicked');
      if (t1 == '') {result ='Enter Fahrenheit Please';
      fc=Colors.red;}
      else if(n1>212) {clr= Colors.redAccent; fc=Colors.black;}
      else if(n1<212 && n1>32) {clr=Colors.lightGreen; fc=Colors.black;}
      else if(n1<32) {clr=Colors.lightBlue; fc=Colors.black;}
      else if(n1<= -20 ) {clr=Colors.blueGrey; fc=Colors.black;}

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            Container(color: clr
                ,child: Text(result, style: TextStyle(fontSize: 21),)),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Enter Fahrenheit Please',
                  border: OutlineInputBorder(),), keyboardType: TextInputType.number,
                onChanged: (text){
                  t1=text;
                  n1=double.parse(t1);
                },

              ),
            ),
            Container(color: Colors.purple,
              child: RawMaterialButton(onPressed: _incrementCounter,child: Text('Convert Fahrenheit to Celcius'),),)
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class TemperatureConvert{
  double F=0.0;String msg='';
  double C = 0.0;
  TemperatureConvert({this.F=0.0});

  String convert({F}){
    C = ((F - 32) * 5 / 9);
    if(F>212) msg='Water is in Gas State';
    else if(F>32 && F<212) msg='Water is in Liquid State';
    else if(F<32) msg='Water is in Solid State';
    return '$C celsius degrees $msg';
  }
}
