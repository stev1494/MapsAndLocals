
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mapas/src/models/gasolineraModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

//import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';

class GasolinaPage extends StatefulWidget {
  GasolinaPage({Key key}) : super(key: key);

  _GasolinaPageState createState() => _GasolinaPageState();
}

class _GasolinaPageState extends State<GasolinaPage> {

   final CameraPosition _position = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
    );

    StreamSubscription<Position> _positionStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTracking();
  }

  _startTracking(){
    final geolocator = Geolocator();
    final locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 5);

    _positionStream = geolocator.getPositionStream(locationOptions).listen(_onLocationUpdate);
  }

  _onLocationUpdate( Position position){
      if(position!=null){
          print("position ${position.latitude},${position.longitude}");
        }
  }

  @override
  void dispose() {
    if(_positionStream!=null){
      _positionStream.cancel();
      _positionStream=null;
    }
    super.dispose();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
               GoogleMap(
                 initialCameraPosition: _position,
                 myLocationButtonEnabled: true,
                 myLocationEnabled: true,
                 onTap: ( LatLng p){
                    print("p: ${p.latitude},${p.longitude}");
                 },
               ),
            ],
          ),
        ),
    );  
  }



}