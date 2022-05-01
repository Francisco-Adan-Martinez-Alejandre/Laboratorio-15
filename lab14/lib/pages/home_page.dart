import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab14/pages/userinfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _estudiantes = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => leerJson(context));
  }

  Future<void> leerJson(BuildContext context) async {
    final String lectura = await rootBundle.loadString('data/informacion.json');
    final decodificacion = await json.decode(lectura);
    setState(() {
      _estudiantes = decodificacion["estudiantes"];
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
                            nombre: _estudiantes[index]["nombre"],
                            matricula: _estudiantes[index]["matricula"],
                            carrera: _estudiantes[index]["carrera"],
                            semestre: _estudiantes[index]["semestre"],
                            telefono: _estudiantes[index]["telefono"],
                            correo: _estudiantes[index]["correo"])));
              },
              onLongPress: () {
                _borrarPersona(context, _estudiantes[index]);
              },
              title: Text(_estudiantes[index]["nombre"]),
              subtitle: Text(_estudiantes[index]["matricula"]),
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(204, 156, 25, 156),
                child: Text(_estudiantes[index]["nombre"].substring(0, 1)),
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
              content: Text("¿Está seguro de querer eliminar a " +
                  persona["nombre"] +
                  " ?"),
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
