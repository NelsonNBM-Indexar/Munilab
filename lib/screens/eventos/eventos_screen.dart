import 'package:flutter/material.dart';
import 'package:munilab/shared/layout.dart';

class EventosScreen extends StatelessWidget {
  const EventosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      showFooter: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Eventos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2044A8),
                ),
              ),
              SizedBox(height: 16),
              EventCardList(),
            ],
          ),
        ),
      ),
    );
  }
}

class EventCardList extends StatelessWidget {
  const EventCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> events = [
      {
        'title': 'La Moneda Abierta',
        'date': '15 SEP',
        'time': '10:00 – 16:00',
        'image': 'assets/images/eventos/Artboard 1 copy 7.jpg',
        'distance': '0.5 km',
      },
      {
        'title': 'Festival Nocturno',
        'date': '16 SEP',
        'time': '20:00 – 02:00',
        'image': 'assets/images/eventos/Artboard 1 copy 2.jpg',
        'distance': '1.3 km',
      },
      {
        'title': 'Cueca en la Plaza',
        'date': '17 SEP',
        'time': '12:00 – 14:00',
        'image': 'assets/images/eventos/Artboard 1 copy 5.jpg',
        'distance': '2.2 km',
      },
      {
        'title': 'Cicletada Patriótica',
        'date': '18 SEP',
        'time': '09:00 – 11:00',
        'image': 'assets/images/eventos/Artboard 2.jpg',
        'distance': '3.5 km',
      },
      {
        'title': 'Expo Mascotas',
        'date': '19 SEP',
        'time': '11:00 – 17:00',
        'image': 'assets/images/eventos/Artboard 1 copy 8.jpg',
        'distance': '850 m',
      },
      {
        'title': 'Fiesta del Color',
        'date': '20 SEP',
        'time': '14:00 – 20:00',
        'image': 'assets/images/eventos/Artboard 1.png',
        'distance': '1.0 km',
      },
      {
        'title': 'Tarde de Picnic',
        'date': '21 SEP',
        'time': '13:00 – 18:00',
        'image': 'assets/images/eventos/Artboard 1 copy 3.jpg',
        'distance': '1.7 km',
      },
      {
        'title': 'Feria de Emprendedores',
        'date': '22 SEP',
        'time': '10:00 – 17:00',
        'image': 'assets/images/eventos/Artboard 1 copy.jpg',
        'distance': '500 m',
      },
      {
        'title': 'Fiesta Juvenil',
        'date': '23 SEP',
        'time': '17:00 – 23:00',
        'image': 'assets/images/eventos/Artboard 1 copy 6.jpg',
        'distance': '2.3 km',
      },
      {
        'title': 'Brindis Chileno',
        'date': '24 SEP',
        'time': '19:00 – 22:00',
        'image': 'assets/images/eventos/Artboard 1 copy 4.jpg',
        'distance': '1.9 km',
      },
    ];

    return Column(
      children: events.map((event) => EventCard(event: event)).toList(),
    );
  }
}

class EventCard extends StatefulWidget {
  final Map<String, String> event;
  const EventCard({super.key, required this.event});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  int _likes = 12;
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  event['image']!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    event['date']!,
                    style: const TextStyle(
                      color: Color(0xFF2044A8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event['time']!,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _liked = !_liked;
                          _likes += _liked ? 1 : -1;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 18,
                        color: _liked ? Colors.pinkAccent : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text('$_likes',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1ECFE),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 16, color: Color(0xFF2044A8)),
                          const SizedBox(width: 4),
                          Text(
                            event['distance']!,
                            style: const TextStyle(
                                color: Color(0xFF2044A8),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}