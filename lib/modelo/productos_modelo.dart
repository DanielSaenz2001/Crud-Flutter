


class ModeloProductos{
  int id;
  String nombre;
  int stock;
  String descripcion;
  double precio_total;
  String codigo_producto;
  String imagen_producto;

  ModeloProductos({
    this.id,
    this.nombre,
    this.stock,
    this.precio_total,
    //this.precio_total,
    this.descripcion,
    this.codigo_producto,
    this.imagen_producto
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data=new Map<String, dynamic>();
    data['id']=this.id;
    data['nombre']=this.nombre;
    data['stock']=this.stock;
    data['precio_total']=this.precio_total;
    //data['precio_total']=this.precio_total;
    data['descripcion']=this.descripcion;
    data['codigo_producto']=this.codigo_producto;
    data['imagen_producto']=this.imagen_producto;
    return data;
  }

  ModeloProductos.fromJson(Map<String, dynamic> json){
    id=json['id'];
    nombre=json['nombre'];
    stock=json['stock'];
    json['precio_total'] == precio_total ? 0.0 : json['precio_total'].toDouble();
    //precio_total=json['precio_total'];
    descripcion=json['descripcion'];
    codigo_producto=json['codigo_producto'];
    imagen_producto=json['imagen_producto'];
  }

}