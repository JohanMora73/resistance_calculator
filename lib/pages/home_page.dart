import 'package:flutter/material.dart';
import 'four_band_page.dart';
import 'five_band_page.dart';
import 'six_band_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Image.asset(
            'assets/images/fondo.png',
            height: 100, // Ajusta el tamaño de la imagen
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown, Colors.white],  // Definir los colores del gradiente
                  begin: Alignment.topLeft,  // Punto inicial del gradiente
                  end: Alignment.bottomRight, // Punto final del gradiente
                ),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Center(
                child: Text(
                  'Calculadora de Resistencias', // Título de la aplicación
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black, fontStyle: FontStyle.normal),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourBandPage()),
                );
              },
              child: Text('Resistecia de 4 bandas'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FiveBandPage()),
                );
              },
              child: Text('Resistecia de 5 bandas'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SixBandPage()),
                );
              },
              child: Text('Resistecia de 6 bandas'),
            ),
          ],

        ),

      ),
    );
  }
}
