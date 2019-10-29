import 'package:flutter/material.dart';
import 'package:mapas/src/pages/gasolina_page.dart';
import 'package:mapas/src/pages/local_detail_page.dart';
import 'package:mapas/src/pages/locales_page.dart';





Map <String , WidgetBuilder > getRoutes(){

  return <String, WidgetBuilder>{
        '/gasolineras'           : ( context ) => GasolinaPage(),
        '/locales'               : ( context ) => LocalesPage(),
        '/localdetail'           : ( context ) => LocalDetailPage()
        
      
  };
}
