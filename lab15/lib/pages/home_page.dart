import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lab15/pages/userinfo.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _estudiantes = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => leerJson(context));
  }

  Future<String> getJsonFromFirebaseRestAPI() async {
    String url =
        "https://laboratorio-15-default-rtdb.firebaseio.com/estudiantes.json";
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future<void> leerJson(BuildContext context) async {
    String jsonString = await getJsonFromFirebaseRestAPI();
    final jsonResponse = json.decode(jsonString);
    setState(() {
      for (Map<String, dynamic> i in jsonResponse) {
        _estudiantes.add(Estudiante.fromJson(i));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(204, 156, 25, 156),
          centerTitle: true,
          title: const Text(
            'Estudiantes',
            style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          ),
        ),
        body: ListView.builder(
          itemCount: _estudiantes.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Userinfo(
                            nombre: _estudiantes[index].nombre,
                            matricula: _estudiantes[index].matricula,
                            carrera: _estudiantes[index].carrera,
                            semestre: _estudiantes[index].semestre,
                            telefono: _estudiantes[index].telefono,
                            correo: _estudiantes[index].correo)));
              },
              onLongPress: () {
                _borrarPersona(context, _estudiantes[index]);
              },
              title: Text(_estudiantes[index].nombre),
              subtitle: Text(_estudiantes[index].matricula),
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(204, 156, 25, 156),
                child: Text(_estudiantes[index].nombre.substring(0, 1)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            );
          },
        ));
  }

  _borrarPersona(context, persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("Eliminar contacto"),
              content: Text(
                  "¿Está seguro de querer eliminar a " + persona.nombre + " ?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _estudiantes.remove(persona);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Borrar",
                    )),
              ],
            ));
  }
}

class Estudiante {
  Estudiante(this.nombre, this.matricula, this.carrera, this.semestre,
      this.telefono, this.correo);

  final String nombre;
  final String matricula;
  final String carrera;
  final String semestre;
  final String telefono;
  final String correo;

  factory Estudiante.fromJson(Map<String, dynamic> parsedJson) {
    return Estudiante(
      parsedJson['nombre'].toString(),
      parsedJson['matricula'].toString(),
      parsedJson['carrera'].toString(),
      parsedJson['semestre'].toString(),
      parsedJson['telefono'].toString(),
      parsedJson['correo'].toString(),
    );
  }
}
