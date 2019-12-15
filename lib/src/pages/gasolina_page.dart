import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:flutter_map/src/layer/marker_layer.dart';
// import 'package:flutter_map/flutter_map.dart';


class GasolinaPage extends StatefulWidget {
  GasolinaPage({Key key}) : super(key: key);

  _GasolinaPageState createState() => _GasolinaPageState();
}

class _GasolinaPageState extends State<GasolinaPage> {

 Completer<GoogleMapController> controller1;

  //static LatLng _center = LatLng(-15.4630239974464, 28.363397732282127);
  static LatLng _initialPosition;
  final  Set<Marker> _markers = Set();
  
  // Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};

  static  LatLng _lastMapPosition = _initialPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }
  void _getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
    });
  }


  _onMapCreated(GoogleMapController controller) {
    setState(() {
        // controller1.Carcomplete(controller);
    });
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }


  _updateMarkerPosition( MarkerId markerId , LatLng p){
    //Aquí debo actualizar el valor al marker
    //Investigar como agregarlo al map
    
    // _markers[markerId] = _markers.add(Marker(markerId: markerId));
    print("la nueva posicion es $p");
  }

  _onAddMarkerButtonPressed() {

    final id = "${_markers.length}";
    final markerId = MarkerId(id);

    setState(() {
      _markers.add(
          Marker(
              // markerId: MarkerId(_lastMapPosition.toString()),
              markerId: MarkerId(id),
              position: _lastMapPosition,
              draggable: true,
              // onDragEnd: ( _lastMapPosition){
              //   print("${_lastMapPosition.latitude}, ${_lastMapPosition.longitude} ");
              // },
              onDragEnd: ( _lastMapPosition) => _updateMarkerPosition(markerId, _lastMapPosition),
              
              infoWindow: InfoWindow(
                  title: "Gasolinera ",
                  snippet: "${_lastMapPosition.latitude}, ${_lastMapPosition.longitude} ",
                  onTap: (){
                  }
              ),
              onTap: (){
              },

              icon: BitmapDescriptor.defaultMarker));
              setState(() {
               _markers[markerId]= _markers;
              });
      
    });
  }
  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initialPosition == null ? Container(child: Center(child:Text('Cargando mapa..', style: TextStyle(fontFamily: 'Avenir-Medium', color: Colors.grey[400]),),),) : Container(
        child: Stack(children: <Widget>[
          GoogleMap(
            markers: _markers,
            mapType: _currentMapType,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 18.4746,
            ),
            onMapCreated: _onMapCreated,
            zoomGesturesEnabled: true,
            onCameraMove: _onCameraMove,
            myLocationEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: false,

          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    mapButton(_onAddMarkerButtonPressed,
                        Icon(
                            Icons.add_location
                        ), Colors.grey),
                    mapButton(
                        _onMapTypeButtonPressed,
                        Icon(
                          IconData(0xf473,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                        ),
                        Colors.deepOrange[300]),
                  ],
                )),
          )
        ]),
      ),
    );
  }
}