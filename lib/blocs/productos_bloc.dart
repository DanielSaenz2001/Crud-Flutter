

const PRODUCTOS=["asdds Huawei", "Celular Samsung", "Motorola", "Apple"];

class ProductosBloc{
  Stream<List<String>> get getProductos async* {
    final List<String> productos=[];
    for(String producto in PRODUCTOS){
      await Future.delayed(Duration(seconds: 0));
      productos.add(producto);
      yield productos;
    }
  }

}