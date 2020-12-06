

import 'dart:async';


import 'package:calidad_servicioupeu/modelo/productos_modelo.dart';
import 'package:calidad_servicioupeu/repository/ProductosRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'productos_event.dart';
part 'productos_state.dart';

class ProductosBloc extends Bloc<ProductosEvent, ProductosState>{

  final ProductosRepository _productosRepository;

  ProductosBloc({ProductosRepository productosRepository}) :
        _productosRepository=productosRepository,
        super(ProductosInitialState());


  @override
  Stream<ProductosState> mapEventToState(ProductosEvent event) async*{
    print("USANDO LA VALIDACION DE TOKEN");
    if(event is ListarProductosEvent){

      yield ProductosLoadingState();
      try{
        List<ModeloProductos> productosList= await _productosRepository.getProductos();
        yield ProductosLoadedState(productosList);
      }catch(e){
        print("Error ${e.toString()}");
        yield ProductosError(e);
      }
    }else if(event is DeleteProductoEvent){
      try{
        await _productosRepository.deleteProducto(event.producto.id);
        yield ProductosLoadingState();
        List<ModeloProductos> productosList= await _productosRepository.getProductos();
        yield ProductosLoadedState(productosList);
      }catch(e){
        print("Error ${e.toString()}");
        yield ProductosError(e);
      }
    }else if(event is CreateProductoEvent){
      try{
        await _productosRepository.createProducto(event.producto);
        yield ProductosLoadingState();
        List<ModeloProductos> productosList= await _productosRepository.getProductos();
        yield ProductosLoadedState(productosList);
      }catch(e){
        print("Error ${e.toString()}");
        yield ProductosError(e);
      }
    }else if(event is UpdateProductoEvent){
      try{
        await _productosRepository.updateProducto(event.producto.id, event.producto);
        yield ProductosLoadingState();
        List<ModeloProductos> productosList= await _productosRepository.getProductos();
        yield ProductosLoadedState(productosList);
      }catch(e){
        print("Error ${e.toString()}");
        yield ProductosError(e);
      }
    }
  }

}