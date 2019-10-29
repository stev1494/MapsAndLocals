import 'package:latlong/latlong.dart';
import 'dart:convert';

Gasolinera gasolineraFromJson(String str) => Gasolinera.fromJson(json.decode(str));

String gasolineraToJson(Gasolinera data) => json.encode(data.toJson());

class Gasolinera {
    String nombre;
    String latitud;
    String longitud;

    Gasolinera({
        this.nombre,
        this.latitud,
        this.longitud,
    });

    factory Gasolinera.fromJson(Map<String, dynamic> json) => Gasolinera(
        nombre: json["nombre"],
        latitud: json["latitud"],
        longitud: json["longitud"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "latitud": latitud,
        "longitud": longitud,
    };


    LatLng getLatLng(){
      final lat = double.parse(latitud);
      final long =  double.parse(longitud);

      return LatLng( lat , long);

    }
}