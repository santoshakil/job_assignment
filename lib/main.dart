import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'model/onTapModel.dart';

void main() {
  runApp(
    MaterialApp(
      home: Main(),
    ),
  );
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  GoogleMapController controller;
  Set<Marker> setMarker = {};

  @override
  void initState() {
    super.initState();
    currentLocation().then((value) {
      latlongController = new TextEditingController(
          text:
              "Your Location: $value \nShakil's Location: 23.788861, 90.375821");
    });
    myNameController = TextEditingController(text: 'Md Shakil Mia');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controlle) {
          setState(() {
            controller = controlle;
          });
          marker();
        },
        initialCameraPosition: CameraPosition(
          target: myLocation(),
          zoom: 16.0,
        ),
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        zoomControlsEnabled: true,
        compassEnabled: true,
        markers: setMarker,
      ),
    );
  }

  void marker() {
    setMarker.add(
      new Marker(
        markerId: MarkerId("My Location"),
        position: myLocation(),
        infoWindow: InfoWindow(
          title: "My Location",
          onTap: () {
            Fluttertoast.showToast(
              msg: "${latlongController.text}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
            showDialog(
              context: context,
              builder: (BuildContext contex) {
                return alertDialog();
              },
            );
          },
        ),
      ),
    );
  }

  myLocation() {
    return LatLng(23.788861, 90.375821);
  }
}
