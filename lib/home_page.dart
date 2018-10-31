import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0;
  double sum = 0.0;

  TextEditingController t1 = new TextEditingController(text: "0");
  TextEditingController t2 = new TextEditingController(text: "0");

  void _addNumbers() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = (num1 + num2.toDouble());
      t1 = new TextEditingController(text: sum.toString());
      t2 = new TextEditingController(text: "0");
    });
  }

  void _diffNumbers() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = (num1 - num2).abs().toDouble();
      t1 = new TextEditingController(text: sum.toString());
      t2 = new TextEditingController(text: "0");
    });
  }

  void _multiplyNumbers() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = (num1 * num2).toDouble();
      t1 = new TextEditingController(text: sum.toString());
      t2 = new TextEditingController(text: "0");
    });
  }

  void _divideNumbers() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);

      if (num2 != 0) {
        sum = num1.toDouble() / num2.toDouble();
      } else {
        sum = 0.0;
      } //To avoid division by zero exception.
      t1 = new TextEditingController(text: sum.toString());
      t2 = new TextEditingController(text: "0");
    });
  }

  void _resetAll() {
    setState(() {
      t1 = new TextEditingController(text: "0");
      t2 = new TextEditingController(text: "0");
      sum = 0;
    });
  }

  Widget _bodyWidget() {
    return new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Output: $sum",
              style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
            new Padding(padding: EdgeInsets.only(bottom: 50.0)),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter number 1"),
              controller: t1,
            ),
            new Padding(padding: const EdgeInsets.only(bottom: 30.0)),
            new TextField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(hintText: "Enter number 2"),
              controller: t2,
            ),
            new Padding(padding: EdgeInsets.only(bottom: 30.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("+"),
                  onPressed: _addNumbers,
                  color: Colors.greenAccent,
                ),
                new MaterialButton(
                  child: new Text("-"),
                  onPressed: _diffNumbers,
                  color: Colors.greenAccent,
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new MaterialButton(
                  child: new Text("*"),
                  onPressed: _multiplyNumbers,
                  color: Colors.greenAccent,
                ),
                new MaterialButton(
                  child: new Text("/"),
                  onPressed: _divideNumbers,
                  color: Colors.greenAccent,
                  splashColor: Colors.blue,
                ),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
      ),
      body: _bodyWidget(),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 5.0,
        icon: const Icon(Icons.restore),
        onPressed: () {
          _resetAll();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
