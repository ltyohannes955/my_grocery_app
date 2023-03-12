import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/card bloc/card_bloc.dart';
import '../bloc/item bloc/item_bloc.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homepage();
}

class _homepage extends State<homePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
    color: Colors.black,
  ),
        title: const Text('Asbeza', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart),color: Colors.blue,),
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/profile');
            }, icon: Icon(Icons.person), color: Colors.blue,)
        ],
      ),
      body: BlocBuilder<ItemBloc, ItemState>(builder: (context, state){
        if (state is ItemInitalState){
          return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 100, 80, 50),
            child: Image.asset('assets/images/cart.jpg', width: 100,),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text("We deliver groceries at your doorstep", 
            style: TextStyle(color: Colors.white, fontSize: 40,),
            textAlign: TextAlign.center,),
          ),
          
          const Spacer(),

          ElevatedButton(
            onPressed: () {
              BlocProvider.of<ItemBloc>(context)
                      .add(GetDataButtonPressed());
            }, style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.all(24.0),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
                  child: const Text("Get started"),),
            

          const Spacer()
      ]);
        }
        else if(state is ItemLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        }
        else if (state is ItemLoadedState){
          return ListView.builder(
            itemCount: state.item.length,
            itemBuilder: (BuildContext context, int index) {
              final itemVal = state.item[index];
              return Card(
                    elevation: 20,
                    child: Container(
                    width: 380,
                    height: 150,
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(40,10,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Image.network(itemVal.image,width: 80, ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Row(
                             children: [
                               Column(
                                 children: [
                                   SizedBox(
                                    width: MediaQuery.of(context).size.width * .5,
                                    child: Text.rich(
                                      TextSpan(
                                      children: <TextSpan>[ TextSpan(text: 'Item name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      TextSpan(text: itemVal.title ,style: TextStyle(fontSize: 15)),]))),
                                      Text.rich(TextSpan(
                                        children:<TextSpan>[
                                        TextSpan(
                                        text: "Price: ", style: TextStyle(fontWeight: FontWeight.bold)), 
                                        TextSpan(text: "${itemVal.price}\$")])),
                                 ],
                               ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,0,20,0),
                                  child: ElevatedButton(onPressed: () {
                                    BlocProvider.of<CartBloc>(context)
                          .add(GetDataButtonPress());
                                  }, style: ElevatedButton.styleFrom(
                                       padding:
                                        const EdgeInsets.all(10.0),
                                        textStyle: const TextStyle(
                                            fontSize: 10, fontWeight: FontWeight.bold,color: Colors.white)),
                                        child: const Text("ADD"), ),
                                ),
                             ],
                           )
                        ],
                      )
                    ]),
                    
                    ),
                  );
            },
          );
          }
          return Container();
        },
    ),
    
    );
  }
}