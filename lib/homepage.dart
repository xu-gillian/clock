import 'package:flutter/material.dart';
import 'clockview.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return Scaffold(
      appBar: AppBar(title: Text('Clock'), backgroundColor: Colors.black,),
      backgroundColor: Color(0xFF000000),
      body: Row(
        children: <Widget>[
          VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          formattedTime,
                          style: TextStyle(
                            fontFamily: 'avenir',
                            color: Colors.white, 
                            fontSize: 64
                          ),
                        ),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w300,
                            color: Colors.white, 
                            fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.center,
                      child: ClockView(
                        size: MediaQuery.of(context).size.height / 4,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Timezone',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w500,
                            color: Colors.white, 
                            fontSize: 20
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'UTC' + offsetSign + timezoneString,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
