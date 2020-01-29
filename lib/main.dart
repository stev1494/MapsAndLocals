import 'package:flutter/material.dart';

import 'package:mapas/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapas CareAPP',
      initialRoute: '/',
      routes: getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primaryColor: Color.fromRGBO(32, 32, 32, 1)
      ),
      home: MyHomePage(title: 'Stev'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(  
        title: Text(widget.title),
      ),
      body: FadeInImage.assetNetwork(
        image: 'https://ep01.epimg.net/internacional/imagenes/2016/09/15/actualidad/1473950908_051813_1473950996_sumario_normal.gif',
        placeholder: 'images/no-auto.png',
      ),
      
      floatingActionButton: makeBottom(context),

    );
  }




  Widget makeBottom ( BuildContext context){

    return Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.local_gas_station, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/gasolineras');
              },
            ),
            IconButton(
              icon: Icon(Icons.store, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/locales');

              },
            ),
            IconButton(
              icon: Icon(Icons.card_travel, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/viajes');

              },
            ),
            
          ],
        ),
      ),
    );


  } 
}
