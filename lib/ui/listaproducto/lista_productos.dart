


import 'package:calidad_servicioupeu/api/api_productos.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaProducto extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Lista Producto"),),
        ),
        body: _listFutureProductos(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            var token="Token";


            final prefs= await SharedPreferences.getInstance();


            final api=Provider.of<ProductosApi>(context, listen: false);
            final usuario=new ModeloUsuario();
            usuario.email="admin";
            usuario.password="123456";


            api.login(usuario).then((value) {

              print("Probando!!!......"+value.email);
              //token=value.token_type+" "+value.access_token;
              prefs.setString("token", token);
            }).catchError((onError){
              print(onError.toString());
            });

          },
          child: Icon(Icons.account_balance),
        ),
      );
  }

  FutureBuilder _listFutureProductos(BuildContext context){
    return FutureBuilder<List<ModeloProductos>>(
      future: Provider.of<ProductosApi>(context, listen: false).getProductos(),
        builder: (BuildContext context, AsyncSnapshot<List<ModeloProductos>>  snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasError){
            return Container(
              child: Center(child: Text("Error al Recuperar Productos")),
            );
          }
          final productos=snapshot.data;
          print(productos.length);
          //Implementar
          return _listProductos(context: context, productos: productos);
        }else{
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        }
    );
  }

 ListView _listProductos({BuildContext context, List<ModeloProductos> productos}){
    return ListView.builder(
      itemCount: productos.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(productos[index].id.toString()),
                title: Text(productos[index].nombre),
              ),
            ),
          );
        }
    );
 }



}