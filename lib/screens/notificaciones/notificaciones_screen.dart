import 'package:flutter/material.dart';
import 'package:munilab/shared/layout.dart'; 

class NotificacionesScreen extends StatefulWidget {
  const NotificacionesScreen({super.key});

  @override
  State<NotificacionesScreen> createState() => _NotificacionesScreenState();
}

class _NotificacionesScreenState extends State<NotificacionesScreen> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> _notificaciones = [
    {
      'titulo': 'Recordatorio de salud',
      'mensaje': 'Tu cita médica es hoy a las 18:30. Recuerda llevar tus documentos.',
      'fecha': 'Hace 23 min',
      'leida': false,
    },
    {
      'titulo': 'Tip semanal de bienestar',
      'mensaje': 'Preparamos tu consejo semanal para mejorar tu bienestar.',
      'fecha': 'Hace 2 hrs',
      'leida': false,
    },
    {
      'titulo': 'Registra tu peso',
      'mensaje': 'Ayúdanos a personalizar tus recomendaciones de salud.',
      'fecha': 'Ayer',
      'leida': true,
    },
    {
      'titulo': 'Nueva postulación disponible',
      'mensaje': 'Se habilitó un nuevo beneficio social. Revísalo aquí.',
      'fecha': 'Hace 1 semana',
      'leida': true,
    },
    {
      'titulo': 'Datos económicos desactualizados',
      'mensaje': 'Actualiza tu información para seguir recibiendo beneficios.',
      'fecha': 'Hace 3 días',
      'leida': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showFooter: true,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.notifications, color: Colors.blue, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Notificaciones',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(12),
                  borderColor: Colors.blue.shade700,
                  selectedBorderColor: Colors.blue.shade700,
                  fillColor: Colors.blue.shade700,
                  selectedColor: Colors.white,
                  color: Colors.blue.shade700,
                  isSelected: List.generate(3, (index) => index == selectedIndex),
                  onPressed: (int index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  constraints: const BoxConstraints(minHeight: 40, minWidth: 100),
                  children: const [
                    Text('Todas', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Leídas', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('No leídas', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: _notificaciones
                      .where((notificacion) {
                        if (selectedIndex == 0) return true; // Todas
                        if (selectedIndex == 1) return notificacion['leida']; // Leídas
                        return !notificacion['leida']; // No leídas
                      })
                      .map((notificacion) => NotificacionCard(
                            titulo: notificacion['titulo']!,
                            mensaje: notificacion['mensaje']!,
                            fecha: notificacion['fecha']!,
                            leida: notificacion['leida']!,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificacionCard extends StatelessWidget {
  final String titulo;
  final String mensaje;
  final String fecha;
  final bool leida;

  const NotificacionCard({
    super.key,
    required this.titulo,
    required this.mensaje,
    required this.fecha,
    required this.leida,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: leida ? Colors.white : Colors.blue.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade400, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue.shade900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        fecha,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                  children: [
                    TextSpan(text: '$mensaje '),
                    TextSpan(
                      text: 'Ver más',
                      style: const TextStyle(color: Colors.blue),
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