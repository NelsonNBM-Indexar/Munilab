import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/styles.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // Fondo superior con imagen
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/header_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Fondo inferior con imagen
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/footer_background_full.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            // Contenido principal scrollable
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 220, 16, 32),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Image.asset(
                      'assets/images/logo_munilab.png',
                      height: 60,
                    ),
                    SizedBox(height: 24),
                    SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('RUT o Email', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      decoration: InputDecoration(
                        hintText: '12.345.678-9 o correo@ejemplo.com',
                        prefixIcon: Icon(Icons.person, color: Color(0xFF4285F4)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Contraseña', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Tu contraseña',
                        prefixIcon: Icon(Icons.lock, color: Color(0xFF4285F4)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF4285F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        },
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        // Acción para recuperar contraseña
                      },
                      child: Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(color: Color(0xFF4285F4)),
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomeScreen()),
                        );
                      },
                      icon: Icon(Icons.arrow_back, color: Color(0xFF4285F4)),
                      label: Text('Volver al inicio', style: TextStyle(color: Color(0xFF4285F4))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
