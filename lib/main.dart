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
      home: MyHomePage(title: 'Sprint'),
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
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/gasolineras');
              },
              child: Container(
                child: new Text('Ir a Mapas'),
                
              ),
            ),

            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        
        onPressed: (){
          Navigator.pushNamed(context, '/locales');
        },
        
       icon: Icon(Icons.navigate_next),
       label: Text('Locales'),
      ), 
    );
  }
}
