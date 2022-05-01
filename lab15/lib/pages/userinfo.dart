import 'package:flutter/material.dart';

class Userinfo extends StatelessWidget {
  final String nombre;
  final String matricula;
  final String carrera;
  final String semestre;
  final String telefono;
  final String correo;

  const Userinfo(
      {Key? key,
      required this.nombre,
      required this.matricula,
      required this.carrera,
      required this.semestre,
      required this.telefono,
      required this.correo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(204, 156, 25, 156),
          centerTitle: true,
          title: const Text(
            'Información del Estudiante',
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 201, 78, 191),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipOval(child: Image.asset('assets/person.jpg', width: 200)),
              Container(
                  color: const Color.fromARGB(255, 211, 6, 142),
                  height: 40,
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nombre,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  )),
              Container(
                color: const Color.fromARGB(255, 211, 6, 142),
                height: 40,
                width: 320,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.account_box,
                        color: Color.fromARGB(255, 255, 255, 255)),
                    Text(carrera,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)))
                  ],
                ),
              ),
              Container(
                  color: const Color.fromARGB(255, 211, 6, 142),
                  height: 40,
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Matrícula: " + matricula,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  )),
              Container(
                  color: const Color.fromARGB(255, 211, 6, 142),
                  height: 40,
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Semestre: " + semestre,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  )),
              Container(
                  color: const Color.fromARGB(255, 211, 6, 142),
                  height: 40,
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Teléfono: " + telefono,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  )),
              Container(
                  color: const Color.fromARGB(255, 211, 6, 142),
                  height: 40,
                  width: 320,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Correo: " + correo,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  )),
              const SizedBox(height: 50),
            ],
          ),
        ));
  }
}
