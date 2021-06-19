import 'package:flutter/material.dart';
import 'package:clock_dev/constants/constants.dart';
import 'constants/constants.dart';

class LocationList extends StatefulWidget {
  final String selectedLocation;
  LocationList({required this.selectedLocation});

  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: getListView(),
          ),
        ),
      ),
    );
  }

  Widget getListView() {
    var listView = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            TimeLocation[index],
            style: widget.selectedLocation == TimeLocation[index]
                ? kSelectedTextStyle
                : kTopRowTextStyle,
          ),
          onTap: () {
            Navigator.pop(context, TimeLocation[index]);
          },
        );
      },
      itemCount: 387,
    );
    return listView;
  }
}
