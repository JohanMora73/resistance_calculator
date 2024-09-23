import 'package:flutter/material.dart';
import 'home_page.dart';

class FiveBandPage extends StatefulWidget {
  const FiveBandPage({super.key});

  @override
  State<FiveBandPage> createState() => _FiveBandPageState();
}

class _FiveBandPageState extends State<FiveBandPage> {
  final List<String> colors2 = [
    'Negro',
    'Marron',
    'Rojo',
    'Naranja',
    'Amarillo',
    'Verde',
    'Azul',
    'Purpura',
    'Gris',
    'Blanco'
  ];
  final List<String> colors1 = [
    'Marron',
    'Rojo',
    'Naranja',
    'Amarillo',
    'Verde',
    'Azul',
    'Purpura',
    'Gris',
    'Blanco'
  ];
  final List<String> colors3 = [
    'Negro',
    'Marron',
    'Rojo',
    'Naranja',
    'Amarillo',
    'Dorado',
    'Plateado'
  ];
  final List<String> colors4 = [
    'Marron',
    'Rojo',
    'Dorado',
    'Plateado'
  ];
  String? _opcionSeleccionada;
  String? _opcionSeleccionada2;
  String? _opcionSeleccionada3;
  String? _opcionSeleccionada4;
  String? _opcionSeleccionada5;

  double _resistencia = 0.0;
  String _Ohmios = 'Ohms';
  String _tolerancia = '';

  // Método para obtener el color correspondiente
  Color? getColor(String colorName) {
    switch (colorName) {
      case 'Negro':
        return Colors.black;
      case 'Marron':
        return Colors.brown;
      case 'Rojo':
        return Colors.red;
      case 'Naranja':
        return Colors.orange;
      case 'Amarillo':
        return Colors.yellow;
      case 'Verde':
        return Colors.green;
      case 'Azul':
        return Colors.blue;
      case 'Purpura':
        return Colors.purple;
      case 'Gris':
        return Colors.grey;
      case 'Blanco':
        return Colors.white;
      case 'Dorado':
        return Colors.amber;
      case 'Plateado':
        return Colors.grey[300];
      default:
        return null;
    }
  }
  void _pError(){
    if (_opcionSeleccionada5! =='Marron'){
      _tolerancia= '1%';
    }
    else if (_opcionSeleccionada5! =='Rojo'){
      _tolerancia= '2%';
    }
    else if (_opcionSeleccionada5! =='Dorado'){
      _tolerancia= '5%';
    }
    else if (_opcionSeleccionada5! =='Plateado'){
      _tolerancia= '10%';
    }
  }

  void _calcularResistencia() {
    if (_opcionSeleccionada != null &&
        _opcionSeleccionada2 != null &&
        _opcionSeleccionada3 != null &&
        _opcionSeleccionada4 != null) {
      if (_opcionSeleccionada4! == 'Negro') {
        _resistencia = ((colors1.indexOf(_opcionSeleccionada!) + 1.0) * 100.0 +
            (colors2.indexOf(_opcionSeleccionada2!)*10) +
            (colors2.indexOf(_opcionSeleccionada3!))) as double;

      } else if (_opcionSeleccionada4! == 'Marron') {
        _resistencia = ((colors1.indexOf(_opcionSeleccionada!) + 1.0) * 100.0 +
            (colors2.indexOf(_opcionSeleccionada2!)*10) +
            (colors2.indexOf(_opcionSeleccionada3!))) *
            10.0 as double;
      } else if (_opcionSeleccionada4 == 'Rojo') {
        _resistencia = ((colors1.indexOf(_opcionSeleccionada!) + 1.0) * 100.0 +
            (colors2.indexOf(_opcionSeleccionada2!)*10) +
            (colors2.indexOf(_opcionSeleccionada3!))) *
            100.0 as double;
      } else if (_opcionSeleccionada4 == 'Naranja') {
        _resistencia = ((colors1.indexOf(_opcionSeleccionada!) + 1.0) * 100.0 +
            (colors2.indexOf(_opcionSeleccionada2!)*10) +
            (colors2.indexOf(_opcionSeleccionada3!))) *
            1000.0 as double;
      } else if (_opcionSeleccionada4 == 'Amarillo') {
        _resistencia = ((colors1.indexOf(_opcionSeleccionada!) + 1.0) * 100.0 +
            (colors2.indexOf(_opcionSeleccionada2!)*10) +
            (colors2.indexOf(_opcionSeleccionada3!))) *
            10000.0 as double;
      } else if (_opcionSeleccionada4 == 'Dorado') {
        _resistencia = ((colors1.indexOf(_opcionSeleccionada!) + 1.0) * 100.0 +
            (colors2.indexOf(_opcionSeleccionada2!)*10) +
            (colors2.indexOf(_opcionSeleccionada3!))) /
            10.0 as double;
      } else if (_opcionSeleccionada4 == 'Plateado') {
        _resistencia = ((colors1.indexOf(_opcionSeleccionada!) + 1.0) * 100.0 +
            (colors2.indexOf(_opcionSeleccionada2!)*10) +
            (colors2.indexOf(_opcionSeleccionada3!))) /
            100.0 as double;
      }
      if (_resistencia>1000000.0){
        _resistencia=_resistencia/1000000.0;
        _Ohmios='M Ohm';
      }
      else if (_resistencia>1000.0){
        _resistencia=_resistencia/1000.0;
        _Ohmios='K Ohm';
      }
      else {
        _Ohmios = 'Ohms';
      }
      _pError();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.brown[200],
          //image: DecorationImage(image: AssetImage("assets/images/fondo.png")),
          //fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 15, // Distancia desde el fondo
              left: 10, // Distancia desde la derecha
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/fondo.png',
                    // Imagen en la parte superior derecha
                    height: 100, // Ajusta el tamaño de la imagen
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.brown, Colors.white],
                        // Definir los colores del gradiente
                        begin: Alignment.topLeft,
                        // Punto inicial del gradiente
                        end: Alignment.bottomRight, // Punto final del gradiente
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Resistencias de 5 bandas', // Título de la aplicación
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontStyle: FontStyle.normal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 200, // Distancia desde el fondo
              left: 60, // Distancia desde la derecha
              child: DropdownButton<String>(
                hint: Text('Banda 1'),
                dropdownColor: Colors.white,
                // Texto por defecto antes de seleccionar
                value: _opcionSeleccionada,
                // La opción actualmente seleccionada
                items: colors1.map((String color1) {
                  return DropdownMenuItem<String>(
                    value: color1,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 20,
                          color: getColor(color1),
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(color1),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _opcionSeleccionada =
                        newValue; // Actualizar la opción seleccionada
                  });
                },
              ),
            ),
            Positioned(
              top: 280,
              left: 60,
              child: DropdownButton<String>(
                hint: Text('Banda 2'),
                dropdownColor: Colors.white,
                // Texto por defecto antes de seleccionar
                value: _opcionSeleccionada2,
                // La opción actualmente seleccionada
                items: colors2.map((String color2) {
                  return DropdownMenuItem<String>(
                    value: color2,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 20,
                          color: getColor(color2),
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(color2),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _opcionSeleccionada2 =
                        newValue; // Actualizar la opción seleccionada
                  });
                },
              ),
            ),
            Positioned(
              top: 360,
              left: 60,
              child: DropdownButton<String>(
                hint: Text('Banda 3'),
                dropdownColor: Colors.white,
                // Texto por defecto antes de seleccionar
                value: _opcionSeleccionada3,
                // La opción actualmente seleccionada
                items: colors2.map((String color3) {
                  return DropdownMenuItem<String>(
                    value: color3,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 20,
                          color: getColor(color3),
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(color3),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _opcionSeleccionada3 =
                        newValue; // Actualizar la opción seleccionada
                  });
                },
              ),
            ),
            Positioned(
              top: 440,
              left: 60,
              child: DropdownButton<String>(
                hint: Text('Banda 4'),
                dropdownColor: Colors.white,
                // Texto por defecto antes de seleccionar
                value: _opcionSeleccionada4,
                // La opción actualmente seleccionada
                items: colors3.map((String color4) {
                  return DropdownMenuItem<String>(
                    value: color4,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 20,
                          color: getColor(color4),
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(color4),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _opcionSeleccionada4 =
                        newValue; // Actualizar la opción seleccionada
                  });
                },
              ),
            ),
            Positioned(
              top: 520,
              left: 60,
              child: DropdownButton<String>(
                hint: Text('Banda 5'),
                dropdownColor: Colors.white,
                // Texto por defecto antes de seleccionar
                value: _opcionSeleccionada5,
                // La opción actualmente seleccionada
                items: colors4.map((String color5) {
                  return DropdownMenuItem<String>(
                    value: color5,
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 20,
                          color: getColor(color5),
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(color5),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _opcionSeleccionada5 =
                        newValue; // Actualizar la opción seleccionada
                  });
                },
              ),
            ),
            Positioned(
              bottom: 16, // Distancia desde el fondo
              left: 16, // Distancia desde la derecha
              child: ElevatedButton(
                onPressed: () {
                  _resistencia = 0;
                  _calcularResistencia();
                },
                child: Text('Calcular'),
              ),
            ),
            Positioned(
              bottom: 16, // Distancia desde el fondo
              right: 16, // Distancia desde la derecha
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Menu'),
              ),
            ),
            Positioned(
              top: 600,
              left: 10,
              child: Text(
                "La resistencia es de: ${_resistencia} ${_Ohmios} ${_tolerancia}",
                style:
                    const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
