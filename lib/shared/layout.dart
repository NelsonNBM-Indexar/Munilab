import 'package:flutter/material.dart';

/// Encabezado de la app que muestra el logo y el título.
class AppHeader extends StatelessWidget {
  final PreferredSizeWidget? bottom;

  const AppHeader({
    Key? key,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo_munilab.png',
                height: 36,
              ),
              Builder(
                builder: (context) => GestureDetector(
                  onTap: () => Scaffold.of(context).openEndDrawer(),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: Text("MC", style: TextStyle(color: Colors.blue)),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('📦 MenuDrawer build ejecutado');
    return Drawer(
      child: Container(
        color: const Color(0xFF2044A8), // azul institucional sugerido
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/header_bg.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(255, 255, 255, 0.7), BlendMode.lighten),
                ),
              ),
              child: Image.asset('assets/images/logo_munilab.png'),
            ),

            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Inicio', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              onTap: () {
                debugPrint('➡️ Navegando a /dashboard');
                Navigator.pushNamed(context, '/dashboard');
              },
            ),

            ExpansionTile(
              title: Row(
                children: const [
                  Icon(Icons.person, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Mi Perfil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white,
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              childrenPadding: const EdgeInsets.only(left: 24),
              collapsedBackgroundColor: Colors.transparent,
              collapsedShape: Border(),
              backgroundColor: Colors.transparent,
              shape: Border(),
              children: [
                ListTile(
                  title: const Text('Datos Personales', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  onTap: () {
                    debugPrint('➡️ Navegando a /perfil/datos-personales');
                    Navigator.pushNamed(context, '/perfil/datos-personales');
                  },
                ),
                ListTile(
                  title: const Text('Datos Económicos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  onTap: () {
                    debugPrint('➡️ Navegando a /perfil/datos-economicos');
                    Navigator.pushNamed(context, '/perfil/datos-economicos');
                  },
                ),
                ListTile(
                  title: const Text('Datos Familia', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  onTap: () {
                    debugPrint('➡️ Navegando a /perfil/datos-familia');
                    Navigator.pushNamed(context, '/perfil/datos-familia');
                  },
                ),
              ],
            ),

            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.white),
              title: const Text('Notificaciones', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              onTap: () {
                debugPrint('➡️ Navegando a /notificaciones');
                Navigator.pushNamed(context, '/notificaciones');
              },
            ),

            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.card_giftcard, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Beneficios', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                debugPrint('➡️ Navegando a /beneficios');
                Navigator.pushNamed(context, '/beneficios');
              },
            ),

            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.school, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Talleres y Cursos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                debugPrint('➡️ Navegando a /talleres');
                Navigator.pushNamed(context, '/talleres');
              },
            ),

            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.event, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Eventos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                debugPrint('➡️ Navegando a /eventos');
                Navigator.pushNamed(context, '/eventos');
              },
            ),

            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.business_center, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Emprendimientos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                debugPrint('➡️ Navegando a /emprendimientos');
                Navigator.pushNamed(context, '/emprendimientos');
              },
            ),

            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.credit_card, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Tarjeta Vecino', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                debugPrint('➡️ Navegando a /tarjeta-vecino');
                Navigator.pushNamed(context, '/tarjeta-vecino');
              },
            ),

            ListTile(
              title: Row(
                children: const [
                  Icon(Icons.logout, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Cerrar Sesión', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirmar cierre de sesión"),
                      content: const Text("¿Estás seguro que quieres cerrar sesión?"),
                      actions: [
                        TextButton(
                          child: const Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text("Aceptar"),
                          onPressed: () {
                            debugPrint('🚪 Cerrando sesión y navegando a /welcome');
                            Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (route) => false);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final bool showFooter;

  const BaseScaffold({
    Key? key,
    required this.body,
    this.showFooter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppHeader(),
      ),
      endDrawer: const MenuDrawer(),
      body: body,
      bottomNavigationBar: showFooter
          ? Image.asset(
              'assets/images/footer1.png',
              fit: BoxFit.cover,
              height: 90,
            )
          : null,
    );
  }
}