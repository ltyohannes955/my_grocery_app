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
      backgroundColor: Colors.black,
      appBar: AppBar(
        
        iconTheme: IconThemeData(
    color: Colors.white, //change your color here
  ),
        title: const Text('Asbeza', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black
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
              child: Icon(Icons.person, size: 80, color: Colors.white,),),
            
          ),
          const Padding(
            padding:  EdgeInsets.fromLTRB(20,80,0,0),
            child: Text('Name: "Name"',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
          ),
         
           const Padding(
            padding:  EdgeInsets.fromLTRB(20,50,0,0),
            child: Text('Email: "Email@gmail.com"',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          
           const Padding(
            padding:  EdgeInsets.fromLTRB(20,50,0,0),
            child: Text("Phone Number: 0911111111", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
          ),
          

        ],
      ),
        
    );
  }
}