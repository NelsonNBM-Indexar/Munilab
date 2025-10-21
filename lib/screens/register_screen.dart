import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _rutController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _motivoController = TextEditingController();
  String? _selectedComuna;
  DateTime? _selectedBirthDate;

  final List<String> _comunas = [
    'Las Condes',
    'Providencia',
    'Ñuñoa',
    'Vitacura',
    'Santiago',
    'La Reina',
    'Otra',
  ];

  @override
  void dispose() {
    _rutController.dispose();
    _birthDateController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _motivoController.dispose();
    super.dispose();
  }

  Future<void> _pickBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedBirthDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('es', 'CL'),
    );
    if (picked != null) {
      setState(() {
        _selectedBirthDate = picked;
        _birthDateController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 220,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/header_bg.png',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: FaIcon(
                        FontAwesomeIcons.circleUser,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
              child: Column(
                children: [
                  Text(
                    'Registro de Nuevo Vecino',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Completa tu información para solicitar acceso al Portal Vecino',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 28),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _StyledTextField(
                          controller: _rutController,
                          labelText: 'RUT',
                          keyboardType: TextInputType.text,
                          suffixIcon: Icon(FontAwesomeIcons.idCard, color: Colors.grey[700], size: 20),
                        ),
                        SizedBox(height: 14),
                        GestureDetector(
                          onTap: _pickBirthDate,
                          child: AbsorbPointer(
                            child: _StyledTextField(
                              controller: _birthDateController,
                              labelText: 'Fecha de Nacimiento',
                              keyboardType: TextInputType.datetime,
                              suffixIcon: Icon(FontAwesomeIcons.calendarDays, color: Colors.grey[700], size: 20),
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        _StyledTextField(
                          controller: _firstNameController,
                          labelText: 'Nombres',
                          keyboardType: TextInputType.text,
                          suffixIcon: Icon(FontAwesomeIcons.person, color: Colors.grey[700], size: 20),
                        ),
                        SizedBox(height: 14),
                        _StyledTextField(
                          controller: _lastNameController,
                          labelText: 'Apellidos',
                          keyboardType: TextInputType.text,
                          suffixIcon: Icon(FontAwesomeIcons.personCirclePlus, color: Colors.grey[700], size: 20),
                        ),
                        SizedBox(height: 14),
                        _StyledTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: Icon(FontAwesomeIcons.envelope, color: Colors.grey[700], size: 20),
                        ),
                        SizedBox(height: 14),
                        _StyledTextField(
                          controller: _phoneController,
                          labelText: 'Teléfono',
                          keyboardType: TextInputType.phone,
                          suffixIcon: Icon(FontAwesomeIcons.phoneVolume, color: Colors.grey[700], size: 20),
                        ),
                        SizedBox(height: 14),
                        _StyledTextField(
                          controller: _addressController,
                          labelText: 'Dirección',
                          keyboardType: TextInputType.streetAddress,
                          suffixIcon: Icon(FontAwesomeIcons.addressBook, color: Colors.grey[700], size: 20),
                        ),
                        SizedBox(height: 14),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F8FA),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Comuna',
                              labelStyle: TextStyle(color: Colors.grey[700]),
                            ),
                            value: _selectedComuna,
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: _comunas
                                .map((comuna) => DropdownMenuItem(
                                      value: comuna,
                                      child: Text(comuna),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedComuna = val;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 14),
                        _StyledTextField(
                          controller: _motivoController,
                          labelText: 'Motivo de solicitud',
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          suffixIcon: Icon(FontAwesomeIcons.personCircleQuestion, color: Colors.grey[700], size: 20),
                        ),
                        SizedBox(height: 28),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.arrow_back, color: Color(0xFF1565C0)),
                                label: Text(
                                  'Volver al Inicio',
                                  style: TextStyle(color: Color(0xFF1565C0)),
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  side: BorderSide(color: Color(0xFF1565C0)),
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: handle submit
                                },
                                child: Text(
                                  'Enviar Solicitud',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF1565C0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 36),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyInfoCard(),
          ),
          // Footer SliverToBoxAdapter removed and moved to bottomNavigationBar
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 140,
        child: Image.asset(
          'assets/images/footer_background_full.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final int? maxLines;
  final Widget? suffixIcon;

  const _StyledTextField({
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    this.maxLines,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      style: TextStyle(
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey[800], height: 1.2),
        filled: true,
        fillColor: Color(0xFFF6F8FA).withOpacity(0.95),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 4.0, right: 8.0),
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.grey[700],
                    size: 20,
                  ),
                  child: suffixIcon!,
                ),
              )
            : null,
      ),
    );
  }
}

class _StickyInfoCard extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xFFE3F0FB),
      padding: EdgeInsets.all(14),
      child: SizedBox(
        height: 88,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, color: Color(0xFF1565C0)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Importante: La información ingresada será revisada por la administración. '
                'Recibirás un correo cuando tu solicitud sea aprobada.',
                style: TextStyle(
                  color: Color(0xFF1565C0),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 88;

  @override
  double get minExtent => 88;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}
