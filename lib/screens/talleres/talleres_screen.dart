

import 'package:flutter/material.dart';
import '../../shared/layout.dart';

class TalleresScreen extends StatelessWidget {
  const TalleresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> talleres = [
      {
        'titulo': 'Computación Básica',
        'color': Colors.lightBlue,
        'icono': Icons.computer,
        'imagen': 'assets/images/taller/01_-01.png'
      },
      {
        'titulo': 'Cocina Saludable',
        'color': Colors.green,
        'icono': Icons.restaurant_menu,
        'imagen': 'assets/images/taller/01_-02.png'
      },
      {
        'titulo': 'Yoga para Adultos Mayores',
        'color': Colors.purple,
        'icono': Icons.self_improvement,
        'imagen': 'assets/images/taller/01_-03.png'
      },
      {
        'titulo': 'Electricidad Domiciliaria',
        'color': Colors.orange,
        'icono': Icons.electrical_services,
        'imagen': 'assets/images/taller/01_-04.png'
      },
      {
        'titulo': 'Artesanía en Greda',
        'color': Colors.brown,
        'icono': Icons.handyman,
        'imagen': 'assets/images/taller/_a-05.png'
      },
      {
        'titulo': 'Primeros Auxilios',
        'color': Colors.redAccent,
        'icono': Icons.health_and_safety,
        'imagen': 'assets/images/taller/_a-06.png'
      },
      {
        'titulo': 'Cuidado de Mascotas',
        'color': Colors.teal,
        'icono': Icons.pets,
        'imagen': 'assets/images/taller/_a-07.png'
      },
      {
        'titulo': 'Huerto Urbano',
        'color': Colors.lightGreen,
        'icono': Icons.local_florist,
        'imagen': 'assets/images/taller/_a-08.png'
      },
    ];

    return BaseScaffold(
      showFooter: true,
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Talleres y Cursos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: talleres.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final taller = talleres[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: taller['color'],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(taller['imagen']),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Acción al hacer tap en la tarjeta
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(taller['icono'], color: Colors.white, size: 40),
                              const SizedBox(height: 12),
                              Text(
                                taller['titulo'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}