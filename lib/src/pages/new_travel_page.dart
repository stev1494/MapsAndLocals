import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:intl/intl.dart';

import 'gastos_page.dart';



class NewTravelPage extends StatefulWidget {

  // final tab;
  // NewTravelPage(this.tab);
  // NewTravelPage({Key key}) : super(key: key);

  @override
  _NewTravelPageState createState() => _NewTravelPageState();
}

class _NewTravelPageState extends State<NewTravelPage> with SingleTickerProviderStateMixin  {

bool state = true;
String _myActivity;
final formKey = new GlobalKey<FormState>();
var color = Colors.black;
String mensaje = 'Tomar hora actual';
var now ;
var date;
var hour;
TabController _controller;
 
  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 2 , vsync: this );
  }
  @override
  void dispose (){
    //eliminando recursos 
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topAppBar(context) ,
      body: _getTabBarView(
        <Widget>[
         _body(),

         GastosPage(),
        ]
      ),
    

    );
  }

Widget _body(){
  return ListView(
        children: <Widget>[
            _showFilter(),

             Padding(
              padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
              child: Column(
                children: <Widget>[
                  _formNewTravel(),
                  _formInicioDestino('Origen','Ingrese el lugar de origen'),
                  _formInicioDestino('Destino','Ingrese el lugar de destino'),
                  _formHora(state),
                  _actionButton(),
                  ////////////////////////////////                
                  //AQUI LLAMAR A MYCARBUTTOM
                  ///Elimar este ruteo
              
                  //////////////////////////////////

               ],
              )
            )
            
        ],
      );
}


Widget _actionButton(){

  return Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton.extended(
          
          label: Text(mensaje),
          icon: Icon( Icons.timer,),
          onPressed:(){
            _validate() ? state = false  : state = false ;
            color =  Color.fromRGBO(210, 100, 50, 1);
            _getDate();
            print(hour);
            setState(() {
              state = this.state;
              mensaje = 'Hora actual'; 
            });
          },
          backgroundColor:color ,
        ),
      );
}

Widget _topAppBar ( BuildContext context){
    return AppBar(
      title: Text('NUEVO VIAJE'),
      bottom: _getTabBar(),
      backgroundColor: Colors.black,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back_ios,color: Color.fromRGBO(210, 100, 50, 1),),
              onTap: () {
                  Navigator.pop(context);
              },
      )
      
    );
  }


Widget _showFilter(){

    return Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(

                  titleText: 'Vehículo',
                  hintText: 'Escoja el auto usado',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },

                  dataSource: [
                    {
                      "display": "Aveo",
                      "value": "Aveo",
                    },
                    {
                      "display": "YYY",
                      "value": "YYY",
                    },
                    {
                      "display": "ZZZ",
                      "value": "ZZZ",
                    },                    
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),

              // Container(
              //   padding: EdgeInsets.all(8),
              //   child: RaisedButton(
              //     child: Text('Save'),
              //     onPressed: _saveForm,
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(16),
              //   child: Text(_myActivityResult),
              // )
              
            ],
          ),
        ),
      );
  }


Widget _formNewTravel(){
  return TextFormField(
      // controller: controller,
      // keyboardType: textInputType,
      
      decoration: InputDecoration(
        labelText: 'Motivo de viaje',
        hintText: 'Escriba el motivo de su viaje',
        suffixIcon: Icon(Icons.card_travel),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),

    );

}

Widget _formInicioDestino(String label , String hint ){
    return TextFormField(
          // controller: controller,
          // keyboardType: textInputType,
          decoration: InputDecoration(

            labelText: label,
            hintText: hint,
            suffixIcon: Icon(Icons.location_on),

            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromRGBO(203, 99, 51, 1),
              ),
            ),
          ),

        );
}


Widget _formHora(bool state){
return TextFormField(
      // controller: controller,
      // keyboardType: textInputType,
      
      enabled: state,
      decoration: InputDecoration(
        labelText: 'Hora de viaje',
        hintText: 'Escriba la hora del viaje',
        suffixIcon: Icon(Icons.av_timer),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),

    );

}

bool _validate(){

   return true;
}

void _getDate(){
  now = DateTime.now();
  hour = DateFormat('kk:mm').format(now);
  date = DateFormat('yyyy-MM-dd ').format(now);
}


 TabBar _getTabBar(){
  return TabBar(
    tabs: <Tab>[
      Tab(icon:Icon(Icons.library_books),
          child: Text('INFORMAMACIÓN'),
      ),
      Tab(icon:Icon(Icons.attach_money),
          child: Text('GASTOS'),
      
      ),
    ],
    controller: _controller,
  );
 }

TabBarView _getTabBarView( var displays){
   return TabBarView(
     children: displays,
     controller: _controller,
   );
 }


}