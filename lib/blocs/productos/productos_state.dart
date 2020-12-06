


part of 'productos_bloc.dart';

class ProductosState{ }

class ProductosInitialState extends ProductosState{ }

class ProductosLoadingState extends ProductosState{}

class ProductosLoadedState extends ProductosState{
  List<ModeloProductos> productosList;
  ProductosLoadedState(this.productosList);
}

class ProductosError extends ProductosState{
  Error e;
  ProductosError(this.e);
}