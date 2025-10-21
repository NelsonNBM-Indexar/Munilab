import 'package:flutter/material.dart';
import 'package:munilab/shared/layout.dart';

class BeneficiosScreen extends StatelessWidget {
  const BeneficiosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BaseScaffold(
        showFooter: true,
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    'Beneficios',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003366),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Explora los beneficios disponibles para ti como vecino de la comuna.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _buildBenefitCard(
                        title: 'Salud',
                        subtitle: 'Consultas y exámenes',
                        color: Colors.lightBlueAccent,
                        icon: Icons.local_hospital,
                      ),
                      _buildBenefitCard(
                        title: 'Educación',
                        subtitle: 'Cursos y becas',
                        color: Colors.amberAccent,
                        icon: Icons.school,
                      ),
                      _buildBenefitCard(
                        title: 'Deportes',
                        subtitle: 'Talleres y canchas',
                        color: Colors.lightGreen,
                        icon: Icons.sports_soccer,
                      ),
                      _buildBenefitCard(
                        title: 'Alimentos',
                        subtitle: 'Apoyo nutricional',
                        color: Colors.pinkAccent,
                        icon: Icons.fastfood,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildBenefitCard({
  required String title,
  required String subtitle,
  required Color color,
  required IconData icon,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: [color.withOpacity(0.9), color.withOpacity(0.7)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            )),
        SizedBox(height: 4),
        Text(subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            )),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: Icon(icon, size: 36, color: Colors.white),
        )
      ],
    ),
  );
}