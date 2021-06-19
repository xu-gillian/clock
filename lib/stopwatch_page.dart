import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(title: 'Stopwatch', home: StopwatchPage(), theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF212121)));
//   }
// }

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = new Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    setState(() {});
  }

  void resetTimer() {
    _stopwatch.reset();
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Stopwatch'), backgroundColor: Colors.black,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(formatTime(_stopwatch.elapsedMilliseconds),
                  style: TextStyle(fontSize: 48.0, color: Colors.white)),
              ElevatedButton(
                  onPressed: handleStartStop,
                  child: Text(_stopwatch.isRunning ? 'Stop' : 'Start')),
              ElevatedButton(
                  onPressed: resetTimer,
                  child: Text(_stopwatch.isRunning ? 'Reset' : 'Reset')),
            ],
          ),
        ),
     );
  }
}
