// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'providers/app_state_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/pending_activation_screen.dart';
import 'screens/portal_dashboard_screen.dart';
import 'utils/styles.dart';
import 'screens/perfil/datos_personales_screen.dart';
import 'screens/perfil/datos_economicos_screen.dart';
import 'screens/perfil/datos_familia_screen.dart';
import 'screens/notificaciones/notificaciones_screen.dart';
import 'screens/beneficios/beneficios_screen.dart';
import 'screens/talleres/talleres_screen.dart';
import 'screens/eventos/eventos_screen.dart';
import 'screens/emprendimientos/emprendimientos_screen.dart';
import 'screens/tarjeta_vecino/tarjeta_vecino_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
      ],
      child: MaterialApp(
        title: 'Portal Vecino',
        theme: AppTheme.theme,
        routes: {
          '/dashboard': (context) => PortalDashboardScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/pending': (context) => PendingActivationScreen(),
          '/welcome': (context) => WelcomeScreen(),
          '/perfil/datos-personales': (context) => DatosPersonalesScreen(),
          '/perfil/datos-economicos': (context) => DatosEconomicosScreen(),
          '/perfil/datos-familia': (context) => DatosFamiliaScreen(),
          '/notificaciones': (context) => NotificacionesScreen(),
          '/beneficios': (context) => BeneficiosScreen(),
          '/talleres': (context) => TalleresScreen(),
          '/eventos': (context) => EventosScreen(),
          '/emprendimientos': (context) => EmprendimientosScreen(),
          '/tarjeta-vecino': (context) => TarjetaVecinoScreen(),
        },
        home: AppNavigator(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('es', 'CL'),
          Locale('en', 'US'),
        ],
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(
      builder: (context, appState, child) {
        switch (appState.currentState) {
          case AppState.welcome:
            return WelcomeScreen();
          case AppState.login:
            return LoginScreen();
          case AppState.register:
            return RegisterScreen();
          case AppState.pending:
            return PendingActivationScreen();
          case AppState.dashboard:
            return PortalDashboardScreen();
        }
      },
    );
  }
}