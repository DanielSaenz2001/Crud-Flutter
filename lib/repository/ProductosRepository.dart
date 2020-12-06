

import 'dart:async';
import 'package:calidad_servicioupeu/api/api_productos.dart';
import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:dio/dio.dart';

class ProductosRepository{
  ProductosApi productosApi;

  ProductosRepository(){
    Dio _dio=Dio();
    _dio.options.headers["Content-Type"]="application/json";
    productosApi=ProductosApi(_dio);
  }

  Future<List<ModeloProductos>>   getProductos() async{
    return await productosApi.getProductos( );
  }

  Future<ModeloMensaje> deleteProducto(int id) async{
    return await productosApi.deleteProducto(id);
  }

  Future<ModeloMensaje> updateProducto(int id, ModeloProductos producto) async{
    return await productosApi.updateProducto(id, producto);
  }


  Future<ModeloMensaje> createProducto(ModeloProductos producto) async{
    return await productosApi.createProducto(producto);
  }

}