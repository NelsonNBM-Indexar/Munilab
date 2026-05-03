# Prompt para Claude.ai (diseño / mockups) — Portal Vecino / MuniLab

Copia y pega en **Claude.ai** (modo que permita imágenes o artefactos de diseño) la sección **«INSTRUCCIONES PARA EL MODELO»** y, si hace falta contexto, el resto del documento como referencia.

---

## INSTRUCCIONES PARA EL MODELO

Eres un **diseñador de producto digital senior** especializado en apps móviles **iOS y Android** (marco tipo iPhone 15 Pro o similar, esquinas redondeadas, safe area).

**Tarea:** genera **mockups de alta fidelidad** (frames estáticos o serie coherente) para la app **MuniLab / Portal Vecino**: plataforma ciudadana chilena para vecinos (beneficios municipales, talleres, eventos, emprendimientos locales, Tarjeta Vecino digital y ficha socioeconómica).

**Requisitos de salida:**

1. **Estilo visual:** limpio, institucional pero moderno; **Material Design** como base; mucho blanco, acentos azules, tarjetas con sombra suave y bordes redondeados (12–20 px).
2. **Idioma:** toda la UI en **español (Chile)**; usa **exactamente** los textos que figuran en la sección «Contenido por pantalla» más abajo (no los resumas ni cambies el tono).
3. **Consistencia:** mismo logo ficticio “MuniLab” (tipografía sans moderna + ícono abstracto municipal opcional), mismo header con **foto/ilustración de ciudad horizonte azul** en la parte superior en pantallas de auth/onboarding, y **franja inferior decorativa** (footer) cuando indique el layout.
4. **Entregables sugeridos por el modelo:**  
   - Pantallas clave en **vista vertical** una debajo de otra o en grillas claras.  
   - Opcional: variante **menú lateral (drawer)** abierto sobre el dashboard.  
   - Opcional: estado **Tarjeta Vecino** frontal y reverso (como carnet físico digital).
5. **No inventes nuevas funciones** más allá de las descritas; si falta detalle UI, extrapola de forma conservadora acorde al sistema de diseño definido aquí.

Usa como **tokens y contenido autoritativos** las secciones **Design system** y **Contenido por pantalla** de este documento.

---

## Contexto breve del producto

- **Nombre:** MuniLab (subtítulo: “Plataforma Ciudadana” / “Portal Vecino”).
- **Usuario:** residente de una comuna chilena.
- **Objetivo:** acceder a beneficios, capacitaciones, agenda comunitaria, directorio de pymes vecinas con descuentos Tarjeta Vecino, y completar datos personales / económicos / hogar para programas sociales.

---

## Design system

### Paleta (hex)

| Rol | Hex | Uso |
|-----|-----|-----|
| Primary | `#3B82F6` | Botones primarios, acentos, íconos activos |
| Primary dark / institucional | `#1E3A8A` | Títulos fuertes, texto de marca |
| Drawer / navegación lateral | `#2044A8` | Fondo del menú, ítems destacados |
| Azul económico (sección antecedentes) | `#2C6E87` | Headers de modales, títulos de bloque económico |
| Azul económico claro | `#4BA1BF` | Botones secundarios en flujos económicos |
| Secondary / fondos suaves | `#DBEAFE` | Chips, fondos sutiles |
| Surface | `#F1F5F9` | Fondos de campos rellenos |
| Background | `#FFFFFF` | Fondo principal |
| Text secondary | `#64748B` | Subtítulos, meta |
| Info sticky (registro) | `#E3F0FB` | Banda informativa en formulario solicitud |

### Tipografía

- **Sans contemporáneo** tipo Roboto / Inter / sistema; títulos en **bold**, jerarquía clara (ej. 24–28 px títulos de pantalla, 14–16 px cuerpo, 12–13 px meta).

### Componentes recurrentes

- **Botón primario:** relleno `#3B82F6` o `#1565C0` donde la pantalla ya use ese azul más oscuro en formularios), texto blanco, radio ~8–10 px.
- **Botón secundario / outline:** borde azul, fondo blanco.
- **Campos de formulario:** relleno gris muy claro, sin borde duro o borde muy sutil, esquinas 12 px.
- **Tarjetas:** fondo blanco, `border-radius` 16–20 px, sombra ligera (`0 4–12 blur`, opacidad baja).
- **Carrusel del home:** tarjeta horizontal con imagen de textura/recurso en esquina, icono grande en badge de color por módulo (celeste, verde, ámbar, naranja, rosa, cian).

### Avatar / header autenticado

- Cabecera con **logo** a la izquierda; derecha **avatar circular** con iniciales **“MC”** y **badge rojo** con número **“3”** (notificaciones pendientes mock).

---

## Drawer (menú lateral)

Fondo **`#2044A8`**, texto e íconos **blancos**.

**Ítems (orden):**

1. Inicio  
2. **Mi Perfil** (expandible)  
   - Datos Personales  
   - Datos Económicos  
   - Datos Familia  
3. Notificaciones  
4. Beneficios  
5. Talleres y Cursos  
6. Eventos  
7. Emprendimientos  
8. Tarjeta Vecino  
9. Cerrar Sesión  

(Diseña el grupo “Mi Perfil” como sublista o acordeón visual.)

---

## Contenido por pantalla (textos a respetar)

### 1. Bienvenida (`WelcomeScreen`)

- Fondo general blanco/off-white institucional.
- Badge pequeño: **«Plataforma Ciudadana»**
- Titular descriptivo: **«Accede a beneficios, talleres y servicios municipales de forma moderna y eficiente»**
- Botón primario: **«Comenzar ahora»**
- Botón outline: **«Saber más»**
- Botón secundario (blanco con borde azul): **«Solicita tu Tarjeta Vecino»**

### 2. Saber más (`KnowMoreScreen`)

- Título: **«¿Qué puedes hacer?»**
- Grid de 4 capacidades (cada una con ícono, título, subtítulo corto):

| Título | Subtítulo |
|--------|-----------|
| Tarjeta Vecino Digital | Accede a beneficios municipales exclusivos |
| Talleres y Cursos | Capacítate en nuevas habilidades |
| Pymes locales | Descubre y apoya negocios locales |
| Eventos y Actividades | Participa en la vida comunitaria |

- *(Diálogo al tocar Tarjeta — texto largo opcional para una viñeta secundaria:)* «La Tarjeta Vecino Digital te permite acceder a descuentos y beneficios exclusivos en servicios municipales y comercios asociados, todo desde tu celular.»
- Para Talleres: «Inscríbete en talleres, cursos y capacitaciones municipales para aprender nuevas habilidades y potenciar tu desarrollo personal y profesional.»
- Para Pymes: «Vitrina de emprendimientos locales de los vecinos, que se pueden acceder con descuento si tienes tarjeta vecino»
- Para Eventos: «Infórmate sobre eventos, ferias, actividades deportivas y culturales organizadas por la municipalidad para toda la comunidad.»

### 3. Login (`LoginScreen`)

- Labels: **«RUT o Email»** — placeholder: `12.345.678-9 o correo@ejemplo.com`
- **«Contraseña»** — placeholder: `Tu contraseña`
- Botón: **«Iniciar Sesión»**
- Link: **«¿Olvidaste tu contraseña?»**
- Botón retroceso: **«Volver al inicio»**

### 4. Registro / solicitud vecino (`RegisterScreen`)

- Título: **«Registro de Nuevo Vecino»**
- Subtítulo: **«Completa tu información para solicitar acceso al Portal Vecino»**
- Campos (labels): **RUT**, **Fecha de Nacimiento**, **Nombres**, **Apellidos**, **Email**, **Teléfono**, **Dirección**, **Comuna** (dropdown), **Motivo de solicitud** (multilínea).
- Comunas en dropdown (lista): Las Condes, Providencia, Ñuñoa, Vitacura, Santiago, La Reina, Otra.
- Botones: **«Volver al Inicio»** | **«Enviar Solicitud»**
- Banda informativa inferior (fondo azul muy claro, texto azul): **«Importante: La información ingresada será revisada por la administración. Recibirás un correo cuando tu solicitud sea aprobada.»**

### 5. Dashboard / Inicio (`PortalDashboardScreen`)

- Saludo: **«¡Hola, María Carmen!»**
- Subtítulo: **«Bienvenida a tu Portal Vecino»**
- **Carrusel de módulos** (cada ítem: título + subtítulo):

| Título | Subtítulo |
|--------|-----------|
| Tarjeta Vecino | Consulta beneficios y descuentos |
| Beneficios | Postula a programas sociales |
| Talleres y Cursos | Capacítate en nuevas habilidades |
| Eventos | Participa en actividades comunales |
| Emprendimientos | Directorio de negocios locales |
| Recintos | Arrienda espacios municipales |

- **Progreso perfil** (tres círculos con porcentaje): **Datos Personales** 50%, **Económicos** 75%, **Familia** 25%.
- Sección **«Mis Actividades Recientes»** (tarjetas con estado):
  - Taller de Computación Básica — Martes y Jueves 15:00 — **En curso**
  - Postulación Beca Estudios — Enviado el 10 Sep — **En revisión**
  - Curso de Primeros Auxilios — Agosto 2025 — **Completado**
  - Link: **«Ver más»**
- **«Próximos Eventos»** (ejemplos):
  - Feria de Emprendedores — 16 Sep • 09:00 — Plaza Principal
  - Campaña de Vacunación — 18 Sep • 08:00 — Centro de Salud
  - Taller Reciclaje — 20 Sep • 14:00 — Centro Comunitario
  - **«Ver más»**
- **«Emprendimientos Destacados»** — subtítulo: **«Con descuento Tarjeta Vecino»**
  - Panadería Don Luis — Alimentación — **-10%** — rating 4.8
  - Taller Mecánico Silva — Automotriz — **-15%** — 4.5
  - Peluquería Estilo — Belleza — **-20%** — 4.9
  - **«Ver más»**

### 6. Beneficios (`BeneficiosScreen`)

- Título: **«Beneficios»**
- Párrafo: **«Explora los beneficios disponibles para ti como vecino de la comuna.»**
- Cuatro categorías en grid 2×2 (título + subtítulo en tarjeta con gradiente):
  - **Salud** — Consultas y exámenes  
  - **Educación** — Cursos y becas  
  - **Deportes** — Talleres y canchas  
  - **Alimentos** — Apoyo nutricional  

### 7. Talleres (`TalleresScreen`)

- Título: **«Talleres y Cursos»**
- Lista/grid de talleres (títulos): Computación Básica, Cocina Saludable, Yoga para Adultos Mayores, Electricidad Domiciliaria, Artesanía en Greda, Primeros Auxilios, Cuidado de Mascotas, Huerto Urbano.

### 8. Eventos (`EventosScreen`)

- Título: **«Eventos»**
- Tarjetas con imagen, badge fecha, título, horario, distancia, corazón + contador likes (ej. 12):
  - La Moneda Abierta — 15 SEP — 10:00 – 16:00 — 0.5 km  
  - Festival Nocturno — 16 SEP — 20:00 – 02:00 — 1.3 km  
  - Cueca en la Plaza — 17 SEP — 12:00 – 14:00 — 2.2 km  
  - *(puedes mostrar 3–4 en mockup; el producto tiene más ítems similares)*

### 9. Emprendimientos (`EmprendimientosScreen`)

- Título: **«Emprendimientos»**
- Tarjetas tipo directorio (nombre, categoría, tiempo estimado, dirección corta, estrellas, favorito). Ejemplos:
  - Panaderia San Juan — Alimentos — 10 min — Av. Central 1234  
  - Restaurante El Buen Sabor — Comida Chilena — 12 min — Av. Sabores 456  
  - Peluqueria Glamour — Belleza — 8 min — Pasaje Estilo 89  
- Snackbar al favorito: **«Agregado a tus favoritos»**

### 10. Tarjeta Vecino (`TarjetaVecinoScreen`)

- Título: **«Tarjeta Vecino»**
- Subtítulo sección: **«Bienvenido a tu Tarjeta Vecino»**
- Párrafo: **«Con esta tarjeta podrás acceder a beneficios municipales, talleres, descuentos, y más. Preséntala en los puntos autorizados para identificarte como vecino.»**
- **Cara A (ejemplo):** rótulo «TARJETA VECINO», nombre **MARÍA CARMEN SOTO BRAVO**, RUT **12.345.678-9**, **Estado: ACTIVA**, **Válida hasta: 12/2026**, **Comuna: SAN FELIPE**, texto **«¡Accede a beneficios!»**
- **Cara B:** «TARJETA VECINO», dirección ejemplo **Av. Principal #1234**, **Comuna: SAN FELIPE**, **Región: Valparaíso**, nota **«Presentar para acceder a beneficios.»**
- Botones: **«Mostrar QR»** | **«Mostrar Código de Barra»** (puedes representar modales con placeholder de código y código de barras genéricos).

### 11. Notificaciones (`NotificacionesScreen`)

- Título con ícono: **«Notificaciones»**
- Filtros tipo pestañas/toggles: **Todas** | **Leídas** | **No leídas**
- Ejemplos de ítems (título + extracto + tiempo):
  - Recordatorio de salud — Tu cita médica es hoy a las 18:30… — Hace 23 min — no leída  
  - Tip semanal de bienestar — … — Hace 2 hrs — no leída  
  - Registra tu peso — … — Ayer — leída  
  - Nueva postulación disponible — … — Hace 1 semana — leída  
  - Datos económicos desactualizados — … — Hace 3 días — no leída  

### 12. Datos personales (`DatosPersonalesScreen`)

- Título: **«Datos Personales»**
- Campos (* obligatorios en labels como en app): T. Identificador *, Nombres *, Ap. Materno *, Sexo *, Identificador *, Ap. Paterno *, Fecha Na. *, Nacionalidad *, Teléfono *, Email *
- Botones: **«Volver»** | **«Guardar»**

### 13. Datos económicos (`DatosEconomicosScreen`)

- Título de bloque: **«💰 ANTECEDENTES ECONÓMICOS»** (mantener emoji si el artefacto lo permite; si no, solo texto sin emoji).
- Campos solo lectura: **Total Ingresos Familia:**, **Total Egresos Familia:**, **Total Deudas:** (valores muestra `$ 0`).
- Botones: **«Administrar Ingresos»**, **«Administrar Egresos»**, **«Administrar Deudas»**
- Modales (títulos de cabecera): **«Administrar Ingresos»**, **«Administrar Egresos»**, **«Administrar Deudas»**; sub-diálogos **«Actualizar Ingreso»**, **«Actualizar Egresos»**; listado egresos ejemplo: ARRIENDO $10.000, AGUA POTABLE $20.000, INTERNET / TV CABLE $14.000; botones **«Agregar/Modificar Egreso»**, **«Historial Egreso»**
- Pantalla **Historial de Egresos:** título **«📘 Historial de Egresos»**; tips en carrusel (Consejo, Sugerencia, Dato útil, Recordatorio); lista de cambios con fechas 15/09/2025, etc.

### 14. Datos familia / vivienda (`DatosFamiliaScreen`)

- Acordeón / sección: **«Grupo Familiar»**
- Campos: Calle, N° Calle, Complemento, Tipo Vivienda (ej. Vivienda Unifamiliar Aislada, Departamento), Tenencia de la V. (Adquiriente, Arrendatario), Origen Agua, Distribución Agua, Sistema Sanitario, Material Vivienda, Material Techo, Material Piso (opciones como en ficha CASEN-style).
- Botón: **«Guardar Vivienda»**

### 15. Activación pendiente (placeholder)

- Marca: **«MuniLab»**
- *(UI abierta para “cuenta en revisión”; mensaje institucional tú puedes sugerir en tono municipal breve si hace falta un copy)*  

---

## Flujos a ilustrar (opcional pero útil)

1. **Onboarding:** Bienvenida → Login.  
2. **Descubrimiento:** Bienvenida → Saber más (grid).  
3. **Alta:** Bienvenida → Solicitud Tarjeta Vecino (formulario + banda legal).  
4. **Usuario activo:** Dashboard con drawer semi-abierto o cerrado + dos deep links visuales a Tarjeta Vecino y Eventos.

---

## Notas para el modelo de diseño

- Prioriza **legibilidad** y **densidad cómoda** (app gubernamental, usuarios heterogéneos).
- Incluye **estados hover/tap solo si** el formato lo pide; en móvil basta pantalla única por vista.
- No uses jerga en inglés en la UI final (salvo “RUT”, término local estándar).

---

*Este prompt acompaña al proyecto **Munilab** (marca **MuniLab**); sincronízalo si cambian textos en la app.*
