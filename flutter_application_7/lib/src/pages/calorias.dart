import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/src/home.dart';

class Calorias extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();

}

class _DropDownDemoState extends State<Calorias> {
  List<String> tipo = ['Verduras', 'Frutas','Carnes','Lacteos'];
  List<String> calVerduras = ['Jitomate', 'Lechuga', 'Brocoli'];
  List<String> calFrutas = ['Manzana', 'Papaya', 'Sandia'];
  List<String> calCarnes = ['Pollo', 'Res', 'Pescado'];
  List<String> calLacteos = ['Leche', 'Crema', 'Huevo'];
  
  List<String> provinces = [];
  
  var selectedCountry,selectedProvince,x,xx = 'aaaa',_resultado;
  Widget build(BuildContext context) {
  
    return new Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: new Text("           Consultar Calorias",textAlign: TextAlign.center, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Text(""),
          Text("Selecciona el tipo de alimento", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold,fontSize: 16,fontStyle: FontStyle.italic)),
          Text(""),
          DropdownButton<String>(
            dropdownColor: Colors.black,
            hint: Text('Tipo alimento', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            value: selectedCountry,
            isExpanded: true,
            items: tipo.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              );
            }).toList(),
            onChanged: (country) {
              if (country == 'Verduras') {
                provinces = calVerduras;
                x = 1;
                xx = 'Verduras';
                

              } else if (country == 'Frutas') {
                provinces = calFrutas;
                x = 2;
              } else if(country == 'Carnes'){
                provinces = calCarnes;
                x = 3;
              }else if(country == 'Lacteos'){
                provinces = calLacteos;
                x = 4;
              }else{
                provinces = [];
              }
              setState(() {
                selectedProvince = null;
                selectedCountry = country;
              });
            },
          ),
          Text(""),
          Text(""),
          Text("Selecciona el alimento", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold,fontSize: 16,fontStyle: FontStyle.italic)),
          Text(""),
          Text(""),
           DropdownButton<String>(
            hint: Text('Selecciona el alimento', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
            dropdownColor: Colors.black,
            value: selectedProvince,
            isExpanded: true,
            items: provinces.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value,textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              );
            }).toList(),
            
            onChanged: (province) {
              selectedProvince = province;              
              setState(() {
                selectedProvince = province;
                
                if(selectedProvince == 'Jitomate'||selectedProvince == 'Lechuga'||selectedProvince == 'Brocoli' ){
                switch (selectedProvince) {
                case 'Jitomate':
                _resultado = "El Jitomate tiene 18 calorias";
                break;
                case 'Lechuga': 
                _resultado = "La Lechuga tiene 15 calorias";
                break;
                case 'Brocoli': 
                _resultado = "El Brocoli tiene 34 calorias";
                break;
                }}else if(selectedProvince == 'Manzana'||selectedProvince == 'Papaya'||selectedProvince == 'Sandia' ){
                switch (selectedProvince) {
                case 'Manzana':
                _resultado = "La Manzana tiene 52 calorias";
                break;
                case 'Papaya': 
                _resultado = "La Papaya tiene 39 calorias";
                break;
                case 'Sandia': 
                _resultado = "La sandia tiene 30 calorias";
                break;
                }}else if(selectedProvince == 'Pollo'||selectedProvince == 'Res'||selectedProvince == 'Pescado' ){
                switch (selectedProvince) {
                case 'Pollo':
                _resultado = "El Pollo tiene 239 calorias";
                break;
                case 'Res': 
                _resultado = "La Res tiene 250 calorias";
                break;
                case 'Pescado': 
                _resultado = "El Pescadp tiene 206 calorias";
                break;
                }}else if(selectedProvince == 'Leche'||selectedProvince == 'Crema'||selectedProvince == 'Huevo' ){
                switch (selectedProvince) {
                case 'Leche':
                _resultado = "La leche tiene 42 calorias";
                break;
                case 'Crema': 
                _resultado = "La crema tiene 196 calorias";
                break;
                case 'Huevo': 
                _resultado = "El Huevo tiene 155 calorias";
                break;
                }}
                
              });
            },
          
          ),
          Text(""),
          Text(""),
          _card2(),
          SizedBox(height:25),

        ],
        
      ),

    );
  }
  
  Widget _card2(){

  final card =  Container(
    child:Column(
      children:<Widget> [
          Container(
          padding: EdgeInsets.all(20.0),
          child: Text("$_resultado por 100 gramos", textAlign: TextAlign.center,style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic) ),
          )
      ],
    )
  );

  return Container(
    child: ClipRRect(
      child: card,
      borderRadius: BorderRadius.circular(25.0), 
    ),
    decoration: BoxDecoration(
      color : Colors.green,
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 2.0,
          spreadRadius: 2.0,
          offset: Offset(2.0,6.0)
        )
      ]
    ),
  );
}


}