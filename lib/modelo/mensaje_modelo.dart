
class ModeloMensaje{
  String mensaje;

  ModeloMensaje({
    this.mensaje
    });

factory ModeloMensaje.fromJson(Map<String, dynamic> json)=>ModeloMensaje(mensaje: json["mensaje"]);

Map<String, dynamic> toJson(){
  final Map<String, dynamic>  data=new Map<String, dynamic>();
  data["mensaje"]=this.mensaje;
  return data;
}


}