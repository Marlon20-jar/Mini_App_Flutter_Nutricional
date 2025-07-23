import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Medidas extends StatefulWidget {
 @override
 _Medidas createState() => _Medidas();
}

late SharedPreferences prefs;
class _Medidas extends State<Medidas> {
  String codeDialog = "", valueText = "";
  int _counter = 0, x1 = 0, x2 = 0, x3 = 0;
  double _peso = 0.0, _pesos = 0.0;
  List items = [];
  List item = ["a","b","c","d","e","f"];
  
  @override
  
    void initState() {
      super.initState();
      _loadCounter();
      _loadValor();
      _loadVa();
    }
    
    //Funcion que obtiene el contador de cuantas tarjetas hay en medidas
    void _loadCounter() async {
        final prefs = await SharedPreferences.getInstance();
        setState(() {
           _counter = (prefs.getInt('counter') ?? 0);
        });
    }

    //Funcion que obtiene el peso de de las tarjetas
    void _loadValor() async {
        final prefs = await SharedPreferences.getInstance();
        setState(() {
            String _num = "$x3";
            _peso = (prefs.getDouble(_num)?? 0);
        });
    }
    
    //Funcion que ingresa los datos del peso a una lista
    void _loadVa() async {
        x3 = 0;
        final prefs = await SharedPreferences.getInstance();
        for (var i = 0; i <= _counter; i++) {         
            setState(() {
                String _num = "$x3";
                _pesos = (prefs.getDouble(_num)?? 0);
             });
            items.insert(x3,"$_pesos"); 
            x3 = i;
        }
    }

    //Funcion que incrementa el contador de tarjetas
    void _incrementCounter() async {
        final prefs = await SharedPreferences.getInstance();
        setState(() {
            _counter = (prefs.getInt('counter') ?? 0) + 1;
            prefs.setInt('counter', _counter);
        });
    }

    //Funcion que sube el valor de peso
    void _setValor() async {
        final prefs = await SharedPreferences.getInstance();
        setState(() {
            String _num = "$_counter";
            prefs.setDouble(_num, _peso);
        });
    }

    //borra las tarjetas
    void _borrar() async {
        final prefs = await SharedPreferences.getInstance();
        setState(() {
            prefs.clear();
        });
    }
  
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: new Text("               Mis medidas", textAlign: TextAlign.center, style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
        backgroundColor: Colors.white70,
      ),
      
      body: ListView.builder(      
        padding: EdgeInsets.symmetric(horizontal: 100.0,vertical:20.0),
        itemCount: _counter,
         itemBuilder: (context, a){   
           _loadVa();
           Text("");
           Text("");
  
           Container(
            padding: EdgeInsets.only(
              top: 320,
              bottom: 100,
              right: 100,
              left: 100
            ),
            decoration: BoxDecoration(
              color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/nutri.png'),
                    alignment: Alignment.topCenter)));
                    Text("");
                    Text("");
                   
           return Card(
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        ),
												color: Colors.green,
                        elevation:8,
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
												child: ListTile(
                          leading: Icon(Icons.monitor_weight_outlined, size: 50, color: Colors.white,),
														title: Text("Peso", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
														subtitle: Text(
																items[a] + " Kg", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
																maxLines: 3,
																overflow: TextOverflow.ellipsis,														),		            
    ));}
    ),
         
      floatingActionButton: FloatingActionButton.extended( 
        onPressed: (){
      //_borrar();
         _displayTextInputDialog(context);
        },       
        tooltip: 'Increment',     
        label: const Text('Agregar o eliminar'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
    );
  }
 
TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            ),
            elevation: 8,
            title: Text('Anota tu peso en KG'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Anota tu peso en KG"),
              keyboardType: TextInputType.number,
              maxLength: 4,
              inputFormatters: [FilteringTextInputFormatter.deny(","),FilteringTextInputFormatter.deny("-"),FilteringTextInputFormatter.deny(" ")],
              
            ),
            
            actions: <Widget>[
              // ignore: deprecated_member_use

              ElevatedButton(onPressed: (){
                setState(() {     
                    Navigator.pop(context);
                });
                },style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
               // fixedSize: const Size(50, 20),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                ),), child: Text('CANCELAR')),
              // ignore: deprecated_member_use
              // ignore: deprecated_member_use
              ElevatedButton(onPressed: (){
                setState(() {     
                //  _borrar();
                    _peso = double.parse(valueText);
                    _setValor();
                    _incrementCounter();
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
              ElevatedButton(onPressed: (){
                setState(() {     
                    _borrar();
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/");
                    Navigator.pushNamed(context, "/medidas");
                });
                },style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                fixedSize: const Size(1, 20),
                shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                ),), child: Icon(Icons.delete,size: 20,)),
             
            ],
          );
        });
  }
 
  } 

  


