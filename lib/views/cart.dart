import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/card bloc/card_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state){
          if (state is CartInitial) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: const Text("No Items Added Please add items first!"),
            );
          }
          else if(state is CartLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (state is CartLoadedState){
            return ListView.builder(
              itemCount: state.item.length,
              itemBuilder: (context, index) {
                final itemVal = state.item[index];
                return Card(
                    elevation: 20,
                    child: Container(
                    width: 380,
                    height: 150,
                    color: Colors.white,
                    margin: const EdgeInsets.fromLTRB(58,10,0,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Image.network(itemVal.image,width: 100, ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               SizedBox(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Text.rich(
                                  TextSpan(
                                  children: <TextSpan>[ TextSpan(text: 'Item name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: itemVal.title ,style: TextStyle(fontSize: 15)),]))),
                                
                             ],
                           )
                        ],
                      )
                    ]),
                    
                    ),
                  );
              },);
          }

          return Container();
        }
      ),
    );
  }
}