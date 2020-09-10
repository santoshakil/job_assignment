import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

TextEditingController latlongController;
TextEditingController myNameController;

Widget alertDialog() {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: 3,
          child: TextField(
            controller: myNameController,
            decoration: InputDecoration(hintText: 'Name: Md. Shakil Mia'),
          ),
        ),
        Card(
          elevation: 3,
          child: TextField(
            controller: latlongController,
            decoration: InputDecoration(
                hintText:
                    "Shakil's Location: 23.788861, 90.375821\nYour Location: ${latlongController.text}"),
          ),
        ),
      ],
    ),
    actions: [
      new RaisedButton(
        onPressed: () {
          print("Name: ${myNameController.text}\n${latlongController.text}\n");
          Fluttertoast.showToast(
            msg: "Submitted to the Console",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        },
        child: Text('Submit'),
      )
    ],
  );
}

Future currentLocation() async {
  Position position =
      await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  double lat = position.latitude;
  double lon = position.longitude;
  String latlon = '$lat, $lon';
  return latlon;
}
