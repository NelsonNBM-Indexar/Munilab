# Portal Vecino / MuniLab — Base de conocimiento para IA

Este documento describe la aplicación Flutter del repositorio `portal_vecino_app` para que un asistente (Claude u otro) entienda **qué es el producto**, **con qué está hecho**, **cómo fluye el negocio en la UI** y **qué hace cada pantalla**. Actualízalo cuando cambien rutas, flujos o integraciones backend.

---

## 1. Identidad del producto

| Concepto | Valor |
|----------|--------|
| **Nombre de paquete Dart** (`pubspec.yaml`) | `munilab` |
| **Marca en UI / descripción** | MuniLab — “Plataforma de servicios vecinales” / “Portal Vecino” |
| **`MaterialApp.title`** | `Portal Vecino` |
| **Locales soportados** | `es_CL`, `en_US` (delegaciones globales de Material) |
| **Dominio funcional** | Portal ciudadano municipal: beneficios sociales, talleres, eventos comunitarios, directorio de emprendimientos locales, Tarjeta Vecino digital y completar ficha socioeconómica (perfil). |

La app está orientada a **vecinos de comuna** (Chile: RUT, comunas tipo Las Condes, San Felipe en ejemplos de tarjeta, etc.). Gran parte del contenido es **mock / estático** para prototipo; login y registro no llaman API en el código actual.

---

## 2. Stack tecnológico

- **Framework:** Flutter (Dart SDK `>=3.8.0 <4.0.0`).
- **UI:** Material Design; tema central en `lib/utils/styles.dart` (`AppTheme`) y paleta en `lib/utils/colors.dart` (`AppColors`).
- **Estado global mínimo:** `provider` → `ChangeNotifierProvider` + `AppStateProvider` (`lib/providers/app_state_provider.dart`): solo navega entre fases macro (`welcome`, `login`, `register`, `pending`, `dashboard`). No persiste sesión ni usuario.
- **Navegación:** `MaterialApp.routes` nombradas + `Navigator.push` / `pushReplacement` en varios puntos; `home` usa `AppNavigator` según `AppStateProvider.currentState`.

**Dependencias declaradas (`pubspec.yaml`) y uso en código:**

| Paquete | Uso típico en este repo |
|---------|-------------------------|
| `provider` | Sí — `AppStateProvider` |
| `http`, `shared_preferences`, `connectivity_plus`, `permission_handler`, `image_picker`, `url_launcher` | Declarados; **no hay imports/uso actual en `lib/`** — candidatos para API, sesión local, red, permisos, adjuntos, enlaces externos |
| `flutter_svg`, `font_awesome_flutter` | Iconografía / assets |
| `smooth_page_indicator` | Indicadores en `HistorialEgresoScreen` (`datos_economicos_screen.dart`) |
| `diacritic` | Declarado; sin uso aparente en `lib/` |
| `flutter_localizations` | Configurado en `main.dart` |

**Assets relevantes:** `assets/images/` (headers, logos, footer, tarjeta vecino, eventos, talleres, emp), `assets/icons/`.

**Plataformas:** Proyecto Flutter estándar con carpetas `android/`, `ios/`, etc. El nombre visible de app en launcher puede configurarse con `flutter_launcher_icons` (dev).

---

## 3. Arquitectura de la app

### 3.1 Punto de entrada

- `lib/main.dart` registra `MultiProvider`, define `routes`, `theme`, localizaciones y `home: AppNavigator()`.

### 3.2 Estados macro (`AppState`)

`AppStateProvider` expone:

- `welcome` → `WelcomeScreen`
- `login` → `LoginScreen`
- `register` → `RegisterScreen`
- `pending` → `PendingActivationScreen`
- `dashboard` → `PortalDashboardScreen`

**Importante:** En la práctica, `WelcomeScreen` y login usan **`Navigator.push` a pantallas nuevas**, no siempre `context.read<AppStateProvider>().goTo(...)`, así que el `switch` del `AppNavigator` puede **no reflejar** la pila actual si el usuario navega por rutas imperativas. El dashboard sí se alcanza con `Navigator.pushReplacementNamed(context, '/dashboard')` desde login.

### 3.3 Layout autenticado / secciones internas

- `lib/shared/layout.dart`:
  - **`AppHeader`:** Logo MuniLab + avatar “MC” con badge numérico (mock de notificaciones) que abre el drawer.
  - **`MenuDrawer`:** Menú lateral azul institucional (`Color(0xFF2044A8)`): Inicio, Mi Perfil (submenú), Notificaciones, Beneficios, Talleres, Eventos, Emprendimientos, Tarjeta Vecino, Cerrar sesión (`pushNamedAndRemoveUntil('/welcome', ...)` — **requiere que la ruta `/welcome` exista**, lo cual sí está en `routes`).
  - **`BaseScaffold`:** Combina header, drawer, body y opcionalmente footer imagen (`footer1.png`).

---

## 4. Flujo de negocio (UX / producto)

### 4.1 Onboarding y autenticación (diseño intención)

1. **Bienvenida:** Mensaje “Plataforma Ciudadana”, beneficios municipales modernos.
2. **“Comenzar ahora”** → pantalla de **login** (email/RUT + contraseña).
3. **“Saber más”** → **KnowMoreScreen** con módulos explicativos y diálogos.
4. **“Solicita tu Tarjeta Vecino”** → **RegisterScreen** como **solicitud de acceso** (no alta con contraseña): datos personales, contacto, comuna, motivo; texto legal de revisión administrativa y correo cuando se aprueba.
5. Tras login (implementación actual): **va directo a `/dashboard`** sin validar credenciales.

### 4.2 Post-registro / activación

- **`PendingActivationScreen`:** Pantalla placeholder de estado “cuenta pendiente”; el botón actual apunta a sí misma en bucle — **hueco conocido para completar cuando exista backend**.

### 4.3 Área logueada (hub)

- **Dashboard:** Carrusel de módulos, “completitud” de perfil (círculos), actividades recientes, eventos destacados y emprendimientos destacados (**datos de ejemplo**).
- Desde drawer o rutas nombradas: beneficios, talleres, eventos, emprendimientos, tarjeta vecino, notificaciones, subsecciones de perfil.

### 4.4 Perfil ciudadano / ficha

- **Datos personales:** Formulario texto (campos etiquetados estilo institucional).
- **Datos económicos:** Totales deshabilitados + modales para administrar ingresos, egresos, deudas; subpantalla **Historial de egresos** con carrusel de tips y lista de cambios (mock).
- **Datos familia / vivienda:** `ExpansionTile` “Grupo Familiar” con dirección, tipo vivienda, servicios (agua, saneamiento), materiales construcción, etc.

### 4.5 Tarjeta Vecino

- Carnet digital con **flip** frontal/reverso (assets `vecino/`), texto de ejemplo (nombre, RUT, vigencia).
- Botones muestran diálogo con imagen QR / código de barras y **número aleatorio** (demo, no cryptográfico ni enlazado a backend).

---

## 5. Rutas nombradas (`MaterialApp.routes`)

| Ruta | Widget |
|------|--------|
| `/welcome` | `WelcomeScreen` |
| `/login` | `LoginScreen` |
| `/register` | `RegisterScreen` |
| `/pending` | `PendingActivationScreen` |
| `/dashboard` | `PortalDashboardScreen` |
| `/perfil/datos-personales` | `DatosPersonalesScreen` |
| `/perfil/datos-economicos` | `DatosEconomicosScreen` (`HistorialEgresoScreen` vía push interno) |
| `/perfil/datos-familia` | `DatosFamiliaScreen` |
| `/notificaciones` | `NotificacionesScreen` |
| `/beneficios` | `BeneficiosScreen` |
| `/talleres` | `TalleresScreen` |
| `/eventos` | `EventosScreen` |
| `/emprendimientos` | `EmprendimientosScreen` |
| `/tarjeta-vecino` | `TarjetaVecinoScreen` |

**Nota:** Algunos flujos usan **`MaterialPageRoute`** en lugar de nombres; al refactorizar backend conviene unificar.

---

## 6. Inventario de pantallas (descripción para IA)

### 6.1 `WelcomeScreen`

- Animaciones entrada (slide header, fade logo).
- CTAs: login, saber más, solicitar Tarjeta Vecino.
- Footer/header con imágenes de marca.

### 6.2 `KnowMoreScreen`

- Título “¿Qué puedes hacer?”
- Cuadrícula de tarjetas: Tarjeta digital, Talleres, Pymes/Eventos según ítems; tap abre **AlertDialog** con texto extendido.

### 6.3 `LoginScreen`

- Campos RUT/email y contraseña (sin validación ni API).
- “Iniciar sesión” → `pushReplacementNamed` → `/dashboard`.
- “¿Olvidaste tu contraseña?” sin acción implementada.

### 6.4 `RegisterScreen`

- Formulario: RUT, fecha nacimiento (picker `es_CL`), nombres, apellidos, email, teléfono, dirección, dropdown comunas (lista fija RM + “Otra”), motivo solicitud multilinea.
- “Enviar solicitud”: **TODO** (sin POST).
- Barra inferior sticky informativa (revisión administrativa).

### 6.5 `PendingActivationScreen`

- Placeholder MuniLab; flujo incompleto (ver §4.2).

### 6.6 `PortalDashboardScreen`

- Saludo ficticio (“María Carmen”).
- Carrusel auto-avanza cada 3s con tarjetas: Tarjeta Vecino, Beneficios, Talleres, Eventos, Emprendimientos, Recintos (este último **sin ruta dedicada en menú actual**).
- Tres indicadores circulares de progreso con tap a datos personales / económicos / familia (push directo).
- Listas mock: actividades recientes, próximos eventos, emprendimientos destacados.
- **`BaseScaffold` con footer.**

### 6.7 `BeneficiosScreen`

- Grid 2×2 categorías (Salud, Educación, Deportes, Alimentos) con gradientes — **solo UI**.

### 6.8 `TalleresScreen`

- Grid de talleres con imagen overlay + ícono + título; `onTap` vacío.

### 6.9 `EventosScreen`

- Lista vertical de tarjetas con foto, fecha, horario, distancia; “me gusta” local con contador ficticio.

### 6.10 `EmprendimientosScreen`

- Grid tarjetas: imagen desde `assets/images/emp/` según heurística nombre; datos tiempo/categoría/dirección mock; botón favorito con `ValueNotifier` local (SnackBar).

### 6.11 `TarjetaVecinoScreen`

- Explicación + tarjeta animada cara A/B + diálogos QR / código de barras demo.

### 6.12 `NotificacionesScreen`

- Toggle “Todas / Leídas / No leídas”; lista mock con estilo diferenciado por leída.

### 6.13 `DatosPersonalesScreen`

- Campos formulario; Guardar sin persistencia (**TODO**).

### 6.14 `DatosEconomicosScreen` (+ `HistorialEgresoScreen` en mismo archivo)

- Resumen monetario deshabilitado; tres botones abren **diálogos** complejos (ingresos/egresos/deudas) con formularios anidados; historial navega a pantalla completa con `SmoothPageIndicator` y lista ficticia.

### 6.15 `DatosFamiliaScreen`

- Un solo bloque ExpansionTile con muchos dropdowns/text fields vivienda; Guardar sin lógica.

---

## 7. Convenciones de diseño útiles para cambios de UI

- Azules recurrentes: `AppColors.primary` (`0xFF3B82F6`), drawer/header `0xFF2044A8`, texto oscuro institucional `0xFF003366` / `0xFF2C6E87` en secciones económicas.
- Encabezados de app usan fotos `header_bg.png` y pies `footer_background_full.png` / `footer1.png` según pantalla.

---

## 8. Limitaciones actuales (para no asumir en una IA)

- **Sin integración REST** visible en `lib/`; paquete `http` sin uso.
- **Sin persistencia local** (`shared_preferences` sin uso).
- Login/registro/guardados de perfil **no aplican negocio real**.
- `AppNavigator` vs `Navigator.push` mezclados — revisar cuando se implemente estado de sesión global.
- `EmprendimientosScreen`: lista en la clase exterior no coincide con grid interno (`EmprendimientoCardList`) — el grid es la fuente de verdad UI.
- **Tests:** `test/widget_test.dart` importa `package:portal_vecino_app/main.dart`, pero el paquete se llama **`munilab`** (`pubspec.yaml`). Corregir el import a `package:munilab/main.dart` (y las expectativas al título real de la app) para que los tests compilen.

---

## 9. Archivos clave (mapa rápido)

| Archivo | Rol |
|---------|-----|
| `lib/main.dart` | `MyApp`, rutas, `AppNavigator` |
| `lib/providers/app_state_provider.dart` | Estado macro app |
| `lib/shared/layout.dart` | Shell header + drawer |
| `lib/screens/*` | Pantallas por feature |
| `lib/utils/colors.dart`, `lib/utils/styles.dart` | Tema y color |

---

## 10. Cómo usar este documento con Claude

Cuando pidas cambios:

1. Indica si el alcance es **solo UI**, **integración API** (definir base URL y auth), o **flujo navegación/sesión**.
2. Mantén naming: imports `package:munilab/...` en archivos que ya lo usan; otros usan relativos (`../`).
3. Para nuevas pantallas: registrar ruta en `main.dart`, ítem en `MenuDrawer` si aplica, y documentar aquí la ruta y el propósito.

*Última descripción sincronizada con el código del repositorio `portal_vecino_app`.*
