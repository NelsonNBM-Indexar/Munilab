import 'dart:developer';
import 'package:flutter/material.dart';
import '../../shared/layout.dart';

class EmprendimientosScreen extends StatelessWidget {
  final List<Map<String, String>> emprendimientos = [
    {'nombre': 'Panadería Don Luis', 'categoria': 'Alimentos'},
    {'nombre': 'Taller Mecánico Silva', 'categoria': 'Automotriz'},
    {'nombre': 'Restaurante Sabor Casero', 'categoria': 'Comida Chilena'},
    {'nombre': 'Peluquería Estilo Libre', 'categoria': 'Belleza'},
    {'nombre': 'Librería El Saber', 'categoria': 'Papelería'},
    {'nombre': 'Cafetería Aroma Dulce', 'categoria': 'Café'},
    {'nombre': 'Floristería Naturaleza Viva', 'categoria': 'Decoración'},
    {'nombre': 'Zapatería El Paso', 'categoria': 'Calzado'},
    {'nombre': 'Tienda Ropa Viva', 'categoria': 'Vestuario'},
    {'nombre': 'Verdulería Los Frescos', 'categoria': 'Frutas y Verduras'},
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showFooter: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Emprendimientos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2044A8),
                ),
              ),
              SizedBox(height: 16),
              EmprendimientoCardList(),
            ],
          ),
        ),
      ),
    );
  }
}

class EmprendimientoCardList extends StatelessWidget {
  final Map<String, String> imagenesPorNombre = {
    'panaderia': 'PANADERIA.png',
    'taller_mecanico': 'TALLER_MECANICO.png',
    'restaurante': 'RESTAURANTE.png',
    'peluqueria': 'PELUQUERIA.png',
    'libreria': 'LIBRERIA.png',
    'cafeteria': 'CAFETERIA.png',
    'floristeria': 'FLORISTERIA.png',
    'zapateria': 'ZAPATERIA.png',
    'ropa': 'ROPA.png',
    'verduleria': 'VERDULERIA.png',
  };
  final List<Map<String, String>> emprendimientos = [
    {
      'nombre': 'Panaderia San Juan',
      'categoria': 'Alimentos',
      'tiempo': '10 min',
      'direccion': 'Av. Central 1234',
    },
    {
      'nombre': 'Restaurante El Buen Sabor',
      'categoria': 'Comida Chilena',
      'tiempo': '12 min',
      'direccion': 'Av. Sabores 456',
    },
    {
      'nombre': 'Peluqueria Glamour',
      'categoria': 'Belleza',
      'tiempo': '8 min',
      'direccion': 'Pasaje Estilo 89',
    },
    {
      'nombre': 'Libreria Letras Vivas',
      'categoria': 'Papelería',
      'tiempo': '7 min',
      'direccion': 'Av. Letras 2020',
    },
    {
      'nombre': 'Cafeteria Central',
      'categoria': 'Café',
      'tiempo': '6 min',
      'direccion': 'Calle Dulzura 100',
    },
    {
      'nombre': 'Floristeria Bella Flor',
      'categoria': 'Decoración',
      'tiempo': '11 min',
      'direccion': 'Jardín 54',
    },
    {
      'nombre': 'Zapateria Paso Firme',
      'categoria': 'Calzado',
      'tiempo': '14 min',
      'direccion': 'Av. Pies 200',
    },
    {
      'nombre': 'Boutique Ropa Chic',
      'categoria': 'Vestuario',
      'tiempo': '9 min',
      'direccion': 'Moda 77',
    },
    {
      'nombre': 'Verduleria La Huerta',
      'categoria': 'Frutas y Verduras',
      'tiempo': '5 min',
      'direccion': 'Huerta 11',
    },
  ];

  final ValueNotifier<Set<String>> favoritos = ValueNotifier<Set<String>>({});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 0.68,
      children: emprendimientos.map((e) {
        String nombre = e['nombre']?.toLowerCase() ?? '';
        String? nombreClave = imagenesPorNombre.keys.firstWhere(
          (clave) => nombre.contains(clave),
          orElse: () => '',
        );
        String? rutaImagen = nombreClave.isNotEmpty
            ? 'assets/images/emp/${imagenesPorNombre[nombreClave]}'
            : null;

        debugPrint('Renderizando tarjeta: ${e['nombre']} con imagen: $rutaImagen');

        final esFavorito = favoritos.value.contains(e['nombre']);

        return ValueListenableBuilder<Set<String>>(
          valueListenable: favoritos,
          builder: (context, favs, _) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    child: rutaImagen != null
                        ? Image.asset(
                            rutaImagen,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            height: 100,
                            color: Colors.grey.shade200,
                            child: Icon(Icons.store, size: 40, color: Colors.purple),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e['nombre'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                        SizedBox(height: 2),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 12, color: Color(0xFF2044A8)),
                            SizedBox(width: 4),
                            Text(e['tiempo'] ?? '', style: TextStyle(fontSize: 11)),
                          ],
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.shopping_bag, size: 12, color: Color(0xFF2044A8)),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                e['categoria'] ?? '',
                                style: TextStyle(fontSize: 11),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 12, color: Color(0xFF2044A8)),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                e['direccion'] ?? '',
                                style: TextStyle(fontSize: 11),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, size: 18, color: Colors.amber);
                          }),
                        ),
                        IconButton(
                          icon: Icon(
                            esFavorito ? Icons.favorite : Icons.favorite_border,
                            color: esFavorito ? Colors.red : null,
                            size: 20,
                          ),
                          onPressed: () {
                            final nombre = e['nombre'];
                            if (nombre != null) {
                              if (favs.contains(nombre)) {
                                favoritos.value = {...favs}..remove(nombre);
                              } else {
                                favoritos.value = {...favs}..add(nombre);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Agregado a tus favoritos'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}