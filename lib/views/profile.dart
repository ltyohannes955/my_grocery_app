import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
   Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
        title: const Text('Asbeza', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(170, 40, 0, 0),
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey
              ),
              child: Icon(Icons.person, size: 80,),),
            
          ),
          const Padding(
            padding:  EdgeInsets.fromLTRB(20,0,0,0),
            child: Text('Name: "Name"',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
         
           const Padding(
            padding:  EdgeInsets.fromLTRB(20,50,0,0),
            child: Text('Email: "Email@gmail.com"',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          
           const Padding(
            padding:  EdgeInsets.fromLTRB(20,50,0,0),
            child: Text("Phone Number: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),

        ],
      ),
        
    );
  }
}