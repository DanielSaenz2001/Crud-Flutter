

import 'package:calidad_servicioupeu/blocs/productos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget{

  final productisBloc= new ProductosBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Prueba Streams",
      home: Scaffold(
        appBar: AppBar(
          title: new Center(child: new Text("Prueba Streams")),
        ),
        body: StreamBuilder(
          stream: productisBloc.getProductos,
          builder: (_,AsyncSnapshot<List<String>> snapshot){
            final productos=snapshot.data?? [];
            print(snapshot.data);
            return ListView.builder(
              itemCount: productos.length,
                itemBuilder: (_, i){
                return ListTile(
                  title: Text(productos[i]),
                );
                }
            );
          },
        ),
      ),
    );
  }
}