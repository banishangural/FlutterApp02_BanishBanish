import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  String _msg1 = '';
  String _msg2 = ''; //message to be shown in button 2
  final _msg2Ini = 'Click Me';
  int count = 0;
  bool ifClicked = false;

  @override
  Widget build(BuildContext context) {
    Object onPressed1() {
      if (_enabled) {
        return () {
          setState(() {
            ifClicked = true;
            count = count + 1;
            _msg1 = 'Clicked + $count';
          });
          print('Click me button pressed');
        };
      } else {
        setState(() {
          _msg1 = '';
        });
        print('onPressed1 returning NULL');
        return null;
      }
    }

    Object onPressed2() {
      if (_enabled) {
        print('Reset Button is running');
        return () {
          print('Reset Button pressed');
          setState(() {
            _msg1 = _msg2Ini;
            count = 0;
            ifClicked = false;
          });
        };
      } else {
        setState(() {
          _msg2 = '';
        });
        print('onPressed2 returning NULL');
        return null;
      }
    }

    print('The build is being RUN');

    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      print('onChangedValue is $onChangedValue');
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          if (ifClicked) {
                            _msg1 = 'Clicked + $count';
                          } else {
                            _msg1 = _msg2Ini;
                          }
                          _msg2 = 'Reset';
                          print('_enabled is true');
                        } else {
                          _msg1 = '';
                          _msg2 = '';
                          print('_enabled is false');
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 8,
                            textColor: Colors.red.shade100,
                            color: Colors.redAccent,
                            highlightColor: Colors.blue,
                            splashColor: Colors.green.shade300,
                            padding: EdgeInsets.all(20.0),
                            onPressed: onPressed1(),
                            child: Text(_msg1),
                          )),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 8,
                          textColor: Colors.blue.shade100,
                          color: Colors.blue,
                          highlightColor: Colors.yellow,
                          splashColor: Colors.green.shade300,
                          padding: EdgeInsets.all(20.0),
                          onPressed: onPressed2(),
                          child: Text(_msg2),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
