
import 'package:calidad_servicioupeu/api/api_productos.dart';
import 'package:calidad_servicioupeu/ui/listaproducto/lista_productos.dart';
import 'package:calidad_servicioupeu/ui/login_act.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider<ProductosApi>(
      create: (context)=>ProductosApi.create(),
      child: LoginActivity()
    );
  }

}