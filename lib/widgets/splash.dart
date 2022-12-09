import 'package:flutter/material.dart';

class SplashGlobal extends StatelessWidget {
  final String mensaje;
  final MainAxisAlignment posicion;
  final double tamMensaje;
  final double separacion;

  const SplashGlobal({
    Key? key,
    required this.mensaje,
    this.posicion = MainAxisAlignment.center,
    this.tamMensaje = 20.0,
    this.separacion = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: posicion,
        children: [
          Text(
            mensaje,
            style: TextStyle(
              fontSize: tamMensaje,
            ),
          ),
          SizedBox(
            height: separacion,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}