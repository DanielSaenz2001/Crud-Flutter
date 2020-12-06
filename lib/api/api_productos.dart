import 'package:calidad_servicioupeu/modelo/mensaje_modelo.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart' hide Headers;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

part 'api_productos.g.dart';

@RestApi(baseUrl: "http://ec2-3-239-129-10.compute-1.amazonaws.com:8000/api")
abstract class ProductosApi{
  factory ProductosApi(Dio dio, {String baseUrl})=_ProductosApi;

  static ProductosApi create(){
    final dio=Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ProductosApi(dio);
  }
  
  @GET("/productos")
  Future<List<ModeloProductos>> getProductos();

  @GET("/productos2")
  Future<List<ModeloProductos>> getProductos2(@Header("Authorization") String token);

  @POST("/auth/login")
  Future<ModeloUsuario> login(@Body() ModeloUsuario usuario);

  @GET("/productos/{id}")
  Future<ModeloProductos> getProductoId(@Path("id") String id);

  @DELETE("/productos/{id}")
  Future<ModeloMensaje> deleteProducto(@Path("id") int id);

  @PUT("/productos/{id}")
  Future<ModeloMensaje> updateProducto(@Path("id") int id, @Body() ModeloProductos producto);

  @POST("/productos")
  Future<ModeloMensaje> createProducto(@Body() ModeloProductos producto);

}



