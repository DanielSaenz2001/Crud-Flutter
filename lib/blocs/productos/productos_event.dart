

part of 'productos_bloc.dart';

abstract class ProductosEvent{
  final ModeloProductos producto;
const ProductosEvent({this.producto});
}

class ListarProductosEvent extends ProductosEvent{ ListarProductosEvent(); }

class DeleteProductoEvent extends ProductosEvent{
      DeleteProductoEvent(
          {@required ModeloProductos producto}
          ):super(producto:producto);
}

class UpdateProductoEvent extends ProductosEvent{
  UpdateProductoEvent({@required ModeloProductos producto}):super(producto:producto);
}

class CreateProductoEvent extends ProductosEvent{
  CreateProductoEvent({@required ModeloProductos producto}):super(producto:producto);
}