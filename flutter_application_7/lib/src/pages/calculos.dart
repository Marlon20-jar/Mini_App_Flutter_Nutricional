import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculos extends StatefulWidget {
  @override
  _CalculosState createState() => _CalculosState();
}

class _CalculosState extends State<Calculos>{
  var _peso = 0, _imc = "",_imcHombre = "",_resultado = 0.0,_pesocon = 0.0,_estaturacon = 0.0,_edadcon = 0.0,alturacon = 0.0,suma1 = 0.0, _pesoIdealHombre = "", _pesoIdealMujer = "";
  
  final pesocon = new TextEditingController();
  final estaturacon = new TextEditingController();
  final edadcon = new TextEditingController();

  Widget build(BuildContext context) {

    
    return new Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: new Text("       Calculos nutricionales", textAlign: TextAlign.center, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
        
        backgroundColor: Colors.white70,
      ),
      
      body:ListView(
        padding: EdgeInsets.symmetric(horizontal: 60.0,vertical:20.0),
        children: <Widget>[
          
          Text("Ingresa los datos para obtener los calculos antropometricos", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold,fontSize: 21,fontStyle: FontStyle.italic)),
          Text(""),
          Text(""),
          _pesoInput(),
          _estaturaInput(),
          Text(""),
          Text(""),
          _card1(),
          Text(""),
          Text(""),
          Text(""),
          _botonn(),
          Text(""),
          Text(""),
        ],
    ),  
    );
  }

Widget _pesoInput(){
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: pesocon, 
      
      decoration: InputDecoration(
        //counter: Text("Letras : ${_nombre.length}"),
        hintText: "Ingresa tu peso en KG" ,
        labelText: "Peso",
        fillColor: Colors.white70,filled: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
        //helperText: 'Nombre de la Alerta',
       // suffix: Icon(Icons.text_fields),
        prefixIcon: Icon(Icons.monitor_weight, color: Colors.black87),
        border: OutlineInputBorder(
          borderSide:  BorderSide(width: 5),
          borderRadius: BorderRadius.circular(20.0),         
        ),
      ),
      
      keyboardType: TextInputType.number,
      maxLength: 4,
      inputFormatters: [FilteringTextInputFormatter.deny("-"),FilteringTextInputFormatter.deny(","),FilteringTextInputFormatter.deny(" ")],
    
    );
  }
Widget _estaturaInput(){
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,
      controller: estaturacon,
    
      decoration: InputDecoration(
        //counter: Text("Letras : ${_nombre.length}"),
        hintText: "Ingresa tu estatura en metros",
        labelText: "Estatura",
        fillColor: Colors.white70,filled: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
        //helperText: 'Nombre de la Alerta',
       // suffix: Icon(Icons.text_fields),
        prefixIcon: Icon(Icons.height_rounded, color: Colors.black87,),
        border: OutlineInputBorder(
          borderSide:  BorderSide(width: 5),
          borderRadius: BorderRadius.circular(20.0),         
        ),
      ),
      keyboardType: TextInputType.number,
      maxLength: 4,
      inputFormatters: [FilteringTextInputFormatter.deny("-"),FilteringTextInputFormatter.deny(","),FilteringTextInputFormatter.deny(" ")],
    
    );
  }

  Widget _botonn(){
    return ElevatedButton(onPressed: (
      
    ){
      setState(() { 
       _displayTextInputDialog(context);
        _estaturacon = double.parse(estaturacon.text);
        _pesocon = double.parse(pesocon.text);
        //_edadcon = double.parse(edadcon.text);
        _pesoIdealHombre = (0.75*(_estaturacon*100)-65.5).toStringAsFixed(1);
        _pesoIdealMujer = (0.675*(_estaturacon*100)-56.25).toStringAsFixed(1);
        _imc = (_pesocon/(_estaturacon * _estaturacon)).toStringAsFixed(2);
        if(double.parse(_imc) >= 18.5 && double.parse(_imc) <= 24.9){
          _imcHombre = " Peso Normal";
        }else if(double.parse(_imc) >= 25 && double.parse(_imc) <= 29.9){
          _imcHombre = "Sobrepeso";
        }else if(double.parse(_imc) >= 30 && double.parse(_imc) <= 34.9){
          _imcHombre = "Obesidad Grado 1";
        }else if(double.parse(_imc) >= 35 && double.parse(_imc) <= 39.9){
          _imcHombre = "Obesidad Grado 2";
        }else if(double.parse(_imc) >= 40){
          _imcHombre = "Obesidad Grado 3";
        }else if(double.parse(_imc) <= 18.4){
          _imcHombre = "Insuficiencia";
        }
        //_resultado = _pesocon/_imc;
      });
    },style: ElevatedButton.styleFrom(
      primary: Colors.green,
       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
       fixedSize: const Size(10, 50),
          shape: new RoundedRectangleBorder(
               borderRadius: new BorderRadius.circular(100.0),
               ),), child: Text("Calcular", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 20)));
  }

  Widget _card1(){
    
 TextStyle estilo = new TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16, color: Colors.black);
 
    return Card(
      
      child: Column(
        
        children:<Widget> [
          ListTile(
            leading: Icon(Icons.list,color:Colors.green),
            subtitle: Text("Peso: $_pesocon KG                     "                                                
            "Estatura: $_estaturacon Metros                     "                              
            "IMC: $_imc                             "
            "Clasificacion: $_imcHombre                          "
            "Peso ideal en Hombre: $_pesoIdealHombre                             "
            "Peso ideal en Mujeres: $_pesoIdealMujer", style: estilo,
            
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    TextStyle estilo = new TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 16, color: Colors.black);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            title: Text('Resultados'),
            content: Container(
  height: 150,
  child: Card(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Column(
        children:<Widget> [
          
          ListTile(
            
         //   leading: Icon(Icons.list,color:Colors.green),
            subtitle: Text('Peso: $_pesocon KG \nEstatura: $_estaturacon Metros  \nIMC: $_imc \nClasificacion: $_imcHombre  \nPeso ideal en Hombre: $_pesoIdealHombre KG \nPeso ideal en Mujeres: $_pesoIdealMujer KG', style: estilo,                                                         
 
            ),
            
          ),
        ],
      ),
    ),
),
            
            actions: <Widget>[
              // ignore: deprecated_member_use
              ElevatedButton(onPressed: (){
                setState(() {     

                    Navigator.pop(context);
                });
                },style: ElevatedButton.styleFrom(
                primary: Colors.green,
                //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
               // fixedSize: const Size(2, 20),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                ),), child: Text('       OK        ')),
              // ignore: deprecated_member_use
             
            ],
          );
        });
  }
}