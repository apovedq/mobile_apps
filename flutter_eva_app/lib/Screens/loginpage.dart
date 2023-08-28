import 'package:evva_app/Screens/registrationpage.dart';
import 'package:evva_app/brand_colors.dart';
import 'package:evva_app/widget/TaxiButton.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  static const String id = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                Text('Ingresa a tu cuenta como pasajera',
                  textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[

                      //Correo
                      TextField(
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

                      //contraseña
                      TextField(
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

                      //boton
                      Container(
                        height: 50,
                        child: TaxiButton(
                          title: 'Entrar',
                          color: BrandColors.colorButtons,
                            Style: TextStyle(
                          {
                            BlendMode.color,
                            fontSize: 40,
                          }
                        )

                          onPressed: (){



                          },
                        ),
                      )

                    ],
                  ),
                ),

              TextButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, RegistrationPage.id, (route) => false);
                },
                  child: Text('¿No tienes una cuenta? Registrate aquí'),
              )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

