import 'package:calidad_servicioupeu/api/api_productos.dart';
import 'package:calidad_servicioupeu/modelo/usuario_modelo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
//import 'package:calidad_serv/views/register_act.dart';

import 'package:calidad_servicioupeu/ui/drawer/navigationHomeScreen.dart';

class   LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity>{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  void doLogin(String email, String password) {
    if (password.length < 1) {
      toast("La contraseña contiene al menos 8 caracteres.");
      return;
    }
    setState(() {
      //presenter.login(email, password);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 60.0),
                    child: Column(
                      children: <Widget>[
                        Text("Sistema de Monitoreo de calidad de Atención",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 28.0,
                                fontWeight: FontWeight.w600))
                      ],
                    )),
                new Row(
                  children: <Widget>[
                    Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 30.0),
                        child: Text(
                          "Usuario:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          controller: emailController,
                          obscureText: false,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'yudhanewbie@gmail.com',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: new Text(
                          "Clave:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                new Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.redAccent,
                          width: 0.5,
                          style: BorderStyle.solid),
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '*********',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 24.0,
                ),
                MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  /*onPressed: () {
                    doLogin(emailController.text.trim(),
                        passwordController.text.trim());
                  },*/

                  onPressed: () async{
                    var token="Token";

                    final prefs= await SharedPreferences.getInstance();


                    final api=Provider.of<ProductosApi>(context, listen: false);
                    final usuario=new ModeloUsuario();
                    usuario.email=emailController.text.trim();
                    usuario.password=passwordController.text.trim();

                    if (usuario.password.length < 1) {
                      toast("La contraseña contiene al menos 8 caracteres.");
                    }else{
                      print(usuario.toJson().toString());
                      api.login(usuario).then((value) {
                        print("Probando!!!......"+value.email);
                        token=value.token_type+" "+value.access_token;
                        prefs.setString("token", token);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationHomeScreen()));

                      }).catchError((Object onError){
                        print(onError);
                        print("asdas");
                      });
                    }
                  },
                  child: Text("Ingresar"),
                ),
                MaterialButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () async{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationHomeScreen()));
                  },
                  child: Text("Home"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void finish() => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => NavigationHomeScreen()));

  @override
  void toast(String message) => Toast.show(message, context,
      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

  @override
  sucsseslogin(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("api_token", data);
      prefs.setString("nombre_user", data);
      //prefs.commit();
    });
  }
}
