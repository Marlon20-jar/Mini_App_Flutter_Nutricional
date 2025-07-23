import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  Widget build(BuildContext context){
    return new Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              top: 280,
              bottom: 100,
              right: 100,
              left: 100
            ),
            decoration: BoxDecoration(
              color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/nutri.png'),
                    alignment: Alignment.topCenter)),
  child: Column(
              children: <Widget>[
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                          height:75, //height of button
                          width: 250,
                          child: ElevatedButton.icon(onPressed: () {
                            Navigator.pushNamed(context, "/medidas");
                            },
                            icon: Icon(Icons.rule_folder,color: Colors.green), 
                            label: Text("Mis Medidas",style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                            primary: Colors.white, 
                            side: BorderSide(width:2 , color:Colors.black),                          
                            shape: RoundedRectangleBorder( 
                            borderRadius: BorderRadius.circular(30)
                             ),                        
                            )
                           )
                          ),
                        )
                      ],
                    ),
                      Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                          height:75, //height of button
                          width: 250,
                          child: ElevatedButton.icon(onPressed: () {
                            Navigator.pushNamed(context, "/calculos");
                            },
                            icon: Icon(Icons.calculate,color: Colors.green), 
                            label: Text("Mis Calculos",style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                            primary: Colors.white, 
                            side: BorderSide(width:2 , color:Colors.black),                          
                            shape: RoundedRectangleBorder( 
                            borderRadius: BorderRadius.circular(30)
                             ),                        
                            )
                           )
                          ),
                        )
                      ],
                    ),
                   Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                          height:75, //height of button
                          width: 250,
                          child: ElevatedButton.icon(onPressed: () {
                            Navigator.pushNamed(context, "/calorias");
                            },
                            icon: Icon(Icons.mark_email_read,color: Colors.green), 
                            label: Text("Calorias",style: TextStyle(color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                            primary: Colors.white, 
                            side: BorderSide(width:2 , color:Colors.black),                          
                            shape: RoundedRectangleBorder( 
                            borderRadius: BorderRadius.circular(30)
                             ),                        
                            )
                           )
                          ),
                        )
                      ],
                    ),
                  ]
                  )               
              ]
              )
          )   
       );
  }
}