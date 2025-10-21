import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/layout.dart';
import 'perfil/datos_personales_screen.dart';
import 'perfil/datos_economicos_screen.dart';
import 'perfil/datos_familia_screen.dart';

class PortalDashboardScreen extends StatefulWidget {
  @override
  _PortalDashboardScreenState createState() => _PortalDashboardScreenState();
}

class _PortalDashboardScreenState extends State<PortalDashboardScreen> {
  int _currentPage = 0;
  late PageController _pageController = PageController(viewportFraction: 0.85, initialPage: 0);
  late Timer _carouselTimer;

  final List<Map<String, dynamic>> _cards = [
    {
      'icon': Icons.emoji_events,
      'title': 'Tarjeta Vecino',
      'subtitle': 'Consulta beneficios y descuentos',
      'color': Colors.lightBlueAccent
    },
    {
      'icon': Icons.celebration,
      'title': 'Beneficios',
      'subtitle': 'Postula a programas sociales',
      'color': Colors.lightGreen
    },
    {
      'icon': Icons.auto_stories,
      'title': 'Talleres y Cursos',
      'subtitle': 'Capacítate en nuevas habilidades',
      'color': Colors.amber
    },
    {
      'icon': Icons.event_available,
      'title': 'Eventos',
      'subtitle': 'Participa en actividades comunales',
      'color': Colors.deepOrangeAccent
    },
    {
      'icon': Icons.local_mall,
      'title': 'Emprendimientos',
      'subtitle': 'Directorio de negocios locales',
      'color': Colors.pinkAccent
    },
    {
      'icon': Icons.domain,
      'title': 'Recintos',
      'subtitle': 'Arrienda espacios municipales',
      'color': Colors.cyanAccent
    },
  ];

  @override
  void initState() {
    super.initState();

    _carouselTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!mounted || !_pageController.hasClients) return;
      if (_pageController.positions.length > 1) return;

      final currentPage = _pageController.page?.round() ?? 0;
      int nextPage = currentPage + 1;

      if (nextPage >= _cards.length) {
        nextPage = 0;
      }

      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _carouselTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showFooter: true,
      body: Stack(
        children: [
          Container(color: Colors.white),
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¡Hola, María Carmen!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Bienvenida a tu Portal Vecino',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 120,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Saludo movido al encabezado superior
                  // Carrusel principal
                  Container(
                    height: 180,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _cards.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index % _cards.length;
                        });
                      },
                      itemBuilder: (context, index) {
                        final card = _cards[index % _cards.length];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: _buildCard(card['icon'], card['title'], card['subtitle'], card['color']),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  // Indicadores del carrusel
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_cards.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? Colors.blueAccent : Colors.grey.shade300,
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 24),
                  // Círculos de progreso con navegación
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DatosPersonalesScreen()),
                            );
                          },
                          child: _buildProgressCircle('Datos Personales', 0.5),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DatosEconomicosScreen()),
                            );
                          },
                          child: _buildProgressCircle('Económicos', 0.75),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DatosFamiliaScreen()),
                            );
                          },
                          child: _buildProgressCircle('Familia', 0.25),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  // Mis Actividades Recientes
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 4,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mis Actividades Recientes',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900,
                                ),
                              ),
                              SizedBox(height: 4),
                              SizedBox(height: 16),
                              _buildActivityItem(
                                title: 'Taller de Computación Básica',
                                subtitle: 'Martes y Jueves 15:00',
                                status: 'En curso',
                                color: Colors.blue.shade100,
                                labelColor: Colors.blue.shade700,
                              ),
                              SizedBox(height: 12),
                              _buildActivityItem(
                                title: 'Postulación Beca Estudios',
                                subtitle: 'Enviado el 10 Sep',
                                status: 'En revisión',
                                color: Colors.grey.shade200,
                                labelColor: Colors.grey.shade600,
                              ),
                              SizedBox(height: 12),
                              _buildActivityItem(
                                title: 'Curso de Primeros Auxilios',
                                subtitle: 'Agosto 2025',
                                status: 'Completado',
                                color: Colors.blue.shade200,
                                labelColor: Colors.white,
                                darkBackground: true,
                              ),
                              SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 4, bottom: 16),
                                  child: Text(
                                    'Ver más',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Próximos Eventos
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Próximos Eventos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(height: 12),
                        _buildEventItem(
                          title: 'Feria de Emprendedores',
                          date: '16 Sep • 09:00',
                          location: 'Plaza Principal',
                        ),
                        _buildEventItem(
                          title: 'Campaña de Vacunación',
                          date: '18 Sep • 08:00',
                          location: 'Centro de Salud',
                        ),
                        _buildEventItem(
                          title: 'Taller Reciclaje',
                          date: '20 Sep • 14:00',
                          location: 'Centro Comunitario',
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              'Ver más',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Emprendimientos Destacados
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Emprendimientos Destacados',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        Text(
                          'Con descuento Tarjeta Vecino',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 12),
                        _buildBusinessItem(
                          name: 'Panadería Don Luis',
                          category: 'Alimentación',
                          discount: '-10%',
                          rating: 4.8,
                        ),
                        _buildBusinessItem(
                          name: 'Taller Mecánico Silva',
                          category: 'Automotriz',
                          discount: '-15%',
                          rating: 4.5,
                        ),
                        _buildBusinessItem(
                          name: 'Peluquería Estilo',
                          category: 'Belleza',
                          discount: '-20%',
                          rating: 4.9,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              'Ver más',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Removed footer background image as requested
        ],
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String subtitle, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            spreadRadius: -4,
            offset: Offset(0, 6),
          ),
        ],
        // Eliminado el borde para evitar líneas visuales arriba y abajo de la tarjeta.
      ),
      child: Stack(
        children: [
          // Restaurada la imagen de fondo como se pidió.
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/cardesquina.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(icon, color: Colors.white, size: 32),
                ),
                SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProgressCircle(String label, double value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: value,
                strokeWidth: 6,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                backgroundColor: Colors.grey.shade200,
              ),
              Center(
                child: Text(
                  '${(value * 100).toInt()}%',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildActivityItem({
    required String title,
    required String subtitle,
    required String status,
    required Color color,
    required Color labelColor,
    bool darkBackground = false,
  }) {
    Color statusColor;
    switch (status) {
      case 'En curso':
        statusColor = Colors.green.shade100;
        break;
      case 'En revisión':
        statusColor = Colors.yellow.shade100;
        break;
      case 'Completado':
        statusColor = Colors.blue.shade200;
        break;
      default:
        statusColor = color;
    }
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                color: labelColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  Widget _buildEventItem({required String title, required String date, required String location}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 50,
            color: Colors.orange,
            margin: EdgeInsets.only(right: 12, top: 4),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(date, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(location, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessItem({required String name, required String category, required String discount, required double rating}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.blue.shade900,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  discount,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.green.shade800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    size: 14,
                    color: rating >= index + 1 ? Colors.amber : Colors.grey.shade400,
                  );
                }),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('8/10 votos', style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
              Text('${(rating / 5 * 100).toInt()}%', style: TextStyle(fontSize: 11, color: Colors.grey.shade700)),
            ],
          ),
        ],
      ),
    );
  }