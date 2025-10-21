import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/colors.dart';

class KnowMoreScreen extends StatefulWidget {
  @override
  _KnowMoreScreenState createState() => _KnowMoreScreenState();
}

class _KnowMoreScreenState extends State<KnowMoreScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.of(context).pop(); // or use Navigator.pushNamed(context, '/welcome') if using named routes
          },
        ),
        title: Image.asset(
          'assets/images/logo_munilab.png',
          height: 36,
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¿Qué puedes hacer?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 24),
            // Grid de funcionalidades
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 64) / 2,
                  child: _featureCard(
                    'Tarjeta Vecino Digital',
                    'Accede a beneficios municipales exclusivos',
                    Colors.blue.shade50,
                    Icon(FontAwesomeIcons.addressCard, color: Colors.blue, size: 45),
                    'La Tarjeta Vecino Digital te permite acceder a descuentos y beneficios exclusivos en servicios municipales y comercios asociados, todo desde tu celular.',
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 64) / 2,
                  child: _featureCard(
                    'Talleres y Cursos',
                    'Capacítate en nuevas habilidades',
                    Colors.pink.shade50,
                    Icon(FontAwesomeIcons.briefcase, color: Colors.pink, size: 45),
                    'Inscríbete en talleres, cursos y capacitaciones municipales para aprender nuevas habilidades y potenciar tu desarrollo personal y profesional.',
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 64) / 2,
                  child: _featureCard(
                    'Pymes locales',
                    'Descubre y apoya negocios locales',
                    Colors.green.shade50,
                    Icon(FontAwesomeIcons.solarPanel, color: Colors.green, size: 45),
                    'Vitrina de emprendimientos locales de los vecinos, que se pueden acceder con descuento si tienes tarjeta vecino',
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 64) / 2,
                  child: _featureCard(
                    'Eventos y Actividades',
                    'Participa en la vida comunitaria',
                    Colors.orange.shade50,
                    Icon(FontAwesomeIcons.calendarDays, color: Colors.orange, size: 45),
                    'Infórmate sobre eventos, ferias, actividades deportivas y culturales organizadas por la municipalidad para toda la comunidad.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/footer_background_full.png'),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget _featureCard(String title, String subtitle, Color bgColor, Icon icon, String popupContent) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  Icon(icon.icon, color: icon.color),
                  SizedBox(width: 8),
                  Text(title),
                ],
              ),
              content: Text(popupContent),
              actions: [
                TextButton(
                  child: Text('Cerrar'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        constraints: BoxConstraints(minHeight: 240),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon.icon, color: icon.color, size: 40),
            SizedBox(height: 12),
            Text(
              title,
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String number, String label, Color color) {
    return Container(
      constraints: BoxConstraints(maxHeight: 48),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}