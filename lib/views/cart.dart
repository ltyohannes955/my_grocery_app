import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/item bloc/item_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemInitalState) {
            return const Center(
                child: Text(
              "NO HISTORY TO SHOW!\n TOTAL: 0\$",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ));
          }
          if (state is ItemLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ItemLoadedState) {
            if (state.cart.isEmpty) {
              return Scaffold(
                backgroundColor: Colors.black,
                body:  Center(
                    child: Text(
                  "No items have been added please add items from the home page",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                  ),
                )),
              );
            } else {
              // ignore: non_constant_identifier_names
              num TotalPrice = 0;
              // ignore: no_leading_underscores_for_local_identifiers
              void _incrementCounter() {
                for (var element in state.cart) {
                  TotalPrice += (element.price * element.quantity);
                }
              }

              _incrementCounter();
              return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
    color: Colors.white,
  ),
        title: const Text('Asbeza', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        actions: [
          
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/profile');
            }, icon: const Icon(Icons.person), color: Colors.blue,)
        ],
      ),
      body: Column(
        children: [
          
          Container(
            margin: const EdgeInsets.only(top: 5),
              height: MediaQuery.of(context).size.height * .80,
            child: ListView.builder(
              itemCount: state.cart.length,
              itemBuilder: (BuildContext context, int index) {
                final itemVal = state.cart[index];
                return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                              child: Container(
                              width: 38,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              
                              margin: const EdgeInsets.fromLTRB(0,0,0,0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,10,0,0),
                                  child: Image.network(itemVal.image,width: 80, ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                     Row(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.all(8.0),
                                           child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                              
                                               SizedBox(
                                                width: MediaQuery.of(context).size.width * .4,
                                                 child: Text.rich(
                                                   TextSpan(
                                                   children: <TextSpan>[ TextSpan(text: 'Item name: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                                   TextSpan(text: '${itemVal.title}\$' ,style: TextStyle(fontSize: 15, color: Colors.white)),])),
                                               ),
                                                  Text.rich(TextSpan(
                                                    children:<TextSpan>[
                                                    TextSpan(
                                                    text: "Price: ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)), 
                                                    TextSpan(text: "${itemVal.price}\$" ,style: TextStyle( color: Colors.white))])),
                                                    Row(
                                                      children: [
                                                        IconButton(onPressed: (() {
                                                            BlocProvider.of<ItemBloc>(context).add(DecrementQuantity(index));
                                                            setState(() {});
                                                          }), icon: const Icon(Icons.remove_circle), color: Colors.blue, iconSize: 30,),
                                                      Text("${itemVal.quantity}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                      ),
                                                      IconButton(onPressed: (() {
                                                        BlocProvider.of<ItemBloc>(context).add(IncrementQunatity(index));
                                                        setState(() {});
                                                      }), 
                                                      icon: const Icon(Icons.add_circle), 
                                                      color: Colors.blue,),

                                                      IconButton(onPressed: () {
                                                        BlocProvider.of<ItemBloc>(context)
                                                          .add(ItemRemove(index));
                                                        setState(() {
                                                          
                                                        });
                                                      }, icon: const Icon(Icons.delete, color: Colors.red,))
                                                      ],
                                                    ),
                                                      
            
                                                    
                                             ],
                                           ),
                                         ),
                                        
                                       ],
                                     )
                                  ],
                                ),
                                
                              ]),
                              
                              ),
                            ),
                            
              );
              
            
                  }),
          ),
           Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total: ${TotalPrice.toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),     
        ],
      ),
            
    
    );
            }
          }
          return Container();
        },
      ),
    );
  }
}