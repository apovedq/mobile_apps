
import 'package:evva_app/Screens/loginpage.dart';
import 'package:evva_app/brand_colors.dart';
import 'package:evva_app/widget/TaxiButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatelessWidget {

  static const String id = 'register';
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();


  void showSnackBar (String title, context) {
      final snackbar = SnackBar(
        content: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var idController = TextEditingController();

  void registerUser(BuildContext context) async {
    final User user = (await _auth.createUserWithEmailAndPassword
    (
    email: emailController.text,
    password: passwordController.text,
    ).catchError((ex){

      //probar error y dar mensaje
      PlatformException thisEx = ex;
      showSnackBar(thisEx.message, context);

    })).user;

    if (user != null) {
        print('Registro exitoso');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 70,),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('images/logo.png'),
                ),

                SizedBox(height: 40,),

                Text('Crea una cuenta como pasajera',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[

                      //Nombre Completo
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Nombre Completo',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 10.0
                            )
                        ),
                        style: TextStyle(fontSize: 14),
                      ),

                      SizedBox(height: 10,),

                      //Celular
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Número de celular',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 10.0
                            )
                        ),
                        style: TextStyle(fontSize: 14),
                      ),

                      SizedBox(height: 10,),

                      //Direccion de Correo Electronico
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Dirección de correo electronico',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 10.0
                            )
                        ),
                        style: TextStyle(fontSize: 14),
                      ),

                      SizedBox(height: 10,),

                      //Cedula
                      TextField(
                        controller: idController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Documento legal de identidad (CC, CE, TI...)',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 10.0
                            )
                        ),
                        style: TextStyle(fontSize: 14),
                      ),

                      SizedBox(height: 10,),

                      //Contraseña
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 10.0
                            )
                        ),
                        style: TextStyle(fontSize: 14),
                      ),

                      SizedBox(height: 40,),

                      Container(
                        height: 50,
                        child: TaxiButton(
                          title: 'Comencemos',
                          color: BrandColors.colorButtons,
                          onPressed: (){

                            //Probar coneccion a internet

                            if(fullNameController.text.length < 3) {
                              showSnackBar('Por favor, asegúrate de que tu nombre sea válido.', context);
                              return;
                            }

                            if(phoneController.text.length < 10) {
                              showSnackBar('Por favor, asegúrate de que hayas escrito bien tu número.', context);
                              return;
                            }

                            if(!emailController.text.contains('@')) {
                              showSnackBar('Por favor, ingresa una direccón de correo valida', context);
                              return;
                            }

                            if(passwordController.text.length < 8) {
                              showSnackBar('La contraseña debe contener al menos 8 caracteres.', context);
                              return;
                            }

                            registerUser(context);

                          },
                        ),
                      )

                    ],
                  ),
                ),

                TextButton(
                  onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
                  },
                  child: Text('¿Ya tienes una cuenta? Inicia sesion aquí'),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
