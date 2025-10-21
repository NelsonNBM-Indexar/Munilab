import 'package:flutter/material.dart';
import 'package:munilab/shared/layout.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DatosEconomicosScreen extends StatelessWidget {
  const DatosEconomicosScreen({super.key});

  void _mostrarModal(BuildContext context, String tipo) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: tipo == 'Egresos'
            ? Container(
                padding: const EdgeInsets.all(0),
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header Row
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: const BoxDecoration(
                        color: Color(0xFF2C6E87),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.settings, color: Colors.white),
                          const SizedBox(width: 8),
                          const Text(
                            'Administrar Egresos',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.close, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Row for columns
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Row(
                                children: [
                                  Icon(Icons.folder, color: Colors.teal, size: 20),
                                  SizedBox(width: 4),
                                  Text('Categoría', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.monetization_on, color: Colors.teal, size: 20),
                                  SizedBox(width: 4),
                                  Text('Monto', style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Data rows
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('ARRIENDO'),
                              Text('\$ 10.000'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('AGUA POTABLE'),
                              Text('\$ 20.000'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('INTERNET / TV CABLE'),
                              Text('\$ 14.000'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Agregar/Modificar Egreso button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      width: double.infinity,
                                      decoration: const BoxDecoration(color: Colors.white),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF2C6E87),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Row(
                                              children: const [
                                                Icon(Icons.edit, color: Colors.white),
                                                SizedBox(width: 8),
                                                Text(
                                                  'Actualizar Egresos',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Column(
                                            children: [
                                              DropdownButtonFormField<String>(
                                                decoration: const InputDecoration(labelText: 'Categoría'),
                                                items: [
                                                  'Arriendo',
                                                  'Agua Potable',
                                                  'Internet / TV Cable',
                                                  'Electricidad',
                                                  'Transporte',
                                                ]
                                                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                                                    .toList(),
                                                onChanged: (value) {},
                                              ),
                                              const SizedBox(height: 12),
                                              TextFormField(
                                                decoration: const InputDecoration(
                                                  labelText: 'Monto',
                                                  prefixIcon: Icon(Icons.attach_money),
                                                ),
                                                keyboardType: TextInputType.number,
                                              ),
                                              const SizedBox(height: 24),
                                              ElevatedButton.icon(
                                                onPressed: () => Navigator.of(context).pop(),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Color(0xFF4BA1BF),
                                                ),
                                                icon: const Icon(Icons.save),
                                                label: const Text('Guardar'),
                                              ),
                                              const SizedBox(height: 8),
                                              ElevatedButton.icon(
                                                onPressed: () => Navigator.of(context).pop(),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.grey,
                                                ),
                                                icon: const Icon(Icons.arrow_back),
                                                label: const Text('Volver'),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                              icon: const Icon(Icons.refresh),
                              label: const Text('Agregar/Modificar Egreso'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Historial Egreso button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => const HistorialEgresoScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              icon: const Icon(Icons.history),
                              label: const Text('Historial Egreso'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Volver button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[700]),
                              icon: const Icon(Icons.arrow_back),
                              label: const Text('Volver'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              )
            : tipo == 'Deudas'
                ? Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          decoration: const BoxDecoration(
                            color: Color(0xFF2C6E87),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.account_balance, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Administrar Deudas',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.close, color: Colors.white),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Carrusel de ejemplos de deudas
                        SizedBox(
                          height: 240,
                          child: PageView(
                            controller: PageController(viewportFraction: 0.9),
                            children: [
                              SizedBox(
                                height: 240,
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('📄 Tipo Deuda', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('PRÉSTAMO BANCARIO'),
                                          SizedBox(height: 8),
                                          Text('🏦 Acreedor', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('BANCO ESTADO'),
                                          SizedBox(height: 8),
                                          Text('🧾 Concepto', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('CRÉDITO HIPOTECARIO'),
                                          SizedBox(height: 8),
                                          Text('💲 Monto', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('\$ 80.000'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 240,
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('📄 Tipo Deuda', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('DEUDA EDUCACIONAL'),
                                          SizedBox(height: 8),
                                          Text('🏦 Acreedor', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('CORFO'),
                                          SizedBox(height: 8),
                                          Text('🧾 Concepto', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('CRED. UNIVERSITARIO'),
                                          SizedBox(height: 8),
                                          Text('💲 Monto', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('\$ 45.000'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 240,
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('📄 Tipo Deuda', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('PRÉSTAMO DE CONSUMO'),
                                          SizedBox(height: 8),
                                          Text('🏦 Acreedor', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('BANCO SANTANDER'),
                                          SizedBox(height: 8),
                                          Text('🧾 Concepto', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('COMPRA ELECTRODOMÉSTICOS'),
                                          SizedBox(height: 8),
                                          Text('💲 Monto', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('\$ 120.000'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 240,
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text('📄 Tipo Deuda', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('DEUDA COMERCIAL'),
                                          SizedBox(height: 8),
                                          Text('🏦 Acreedor', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('TIENDA RETAIL'),
                                          SizedBox(height: 8),
                                          Text('🧾 Concepto', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('COMPRA DE ROPA'),
                                          SizedBox(height: 8),
                                          Text('💲 Monto', style: TextStyle(fontWeight: FontWeight.bold)),
                                          Text('\$ 25.000'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add_circle, color: Colors.white),
                              label: const Text('Agregar/Modificar Deuda'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.history, color: Colors.white),
                              label: const Text('Historial Deuda'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF2C6E87),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton.icon(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              label: const Text('Volver'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[700],
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                :
                Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C6E87), // MuniLab dark blue
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.savings, color: Color(0xFFFFFFFF)),
                          const SizedBox(width: 8),
                          Text(
                            'Administrar Ingresos',
                            style: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.close, color: Color(0xFFFFFFFF)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('📌 Categoría', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('INGRESO CONTRATO INDEFINIDO / PLAZO FIJO'),
                          SizedBox(height: 12),
                          Text('💵 Monto', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('\$ 200.000'),
                          SizedBox(height: 12),
                          Text('👤 Integrante', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('JEFE DE HOGAR'),
                          SizedBox(height: 12),
                          Text('🕵️ Nombre', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('JUAN PEREZ'),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  width: double.infinity,
                                  decoration: BoxDecoration(color: Colors.white),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF2C6E87), // MuniLab dark blue
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.edit, color: Colors.white),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Actualizar Ingreso',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(labelText: 'Categoría'),
                                        items: [
                                          'Ingreso contrato indefinido',
                                          'Honorarios',
                                          'Pensión de invalidez',
                                          'Pensión de alimentos',
                                          'Otros ingresos'
                                        ]
                                            .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                                            .toList(),
                                        onChanged: (value) {},
                                      ),
                                      const SizedBox(height: 12),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Monto',
                                          prefixIcon: Icon(Icons.attach_money),
                                          prefixText: '\$ ',
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                      const SizedBox(height: 12),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'Nombre',
                                          prefixIcon: Icon(Icons.person),
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      ElevatedButton.icon(
                                        onPressed: () => Navigator.of(context).pop(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF4BA1BF),
                                        ),
                                        icon: const Icon(Icons.save),
                                        label: const Text('Guardar'),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton.icon(
                                        onPressed: () => Navigator.of(context).pop(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey[700],
                                        ),
                                        icon: const Icon(Icons.arrow_back),
                                        label: const Text('Volver'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4BA1BF),
                          ),
                          icon: const Icon(Icons.edit),
                          label: const Text('Agregar/modificar Ingreso'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                          ),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Volver'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showFooter: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '💰 ANTECEDENTES ECONÓMICOS',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C6E87),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Total Ingresos Familia:'),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      prefixText: '\$ ',
                      hintText: '0',
                      filled: true,
                      fillColor: Color(0xFFEDEFF1),
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Total Egresos Familia:'),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      prefixText: '\$ ',
                      hintText: '0',
                      filled: true,
                      fillColor: Color(0xFFEDEFF1),
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Total Deudas:'),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      prefixText: '\$ ',
                      hintText: '0',
                      filled: true,
                      fillColor: Color(0xFFEDEFF1),
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => _mostrarModal(context, 'Ingresos'),
                icon: Icon(Icons.show_chart),
                label: Text('Administrar Ingresos'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4BA1BF),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () => _mostrarModal(context, 'Egresos'),
                icon: Icon(Icons.credit_card),
                label: Text('Administrar Egresos'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4BA1BF),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () => _mostrarModal(context, 'Deudas'),
                icon: Icon(Icons.description),
                label: Text('Administrar Deudas'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4BA1BF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HistorialEgresoScreen extends StatefulWidget {
  const HistorialEgresoScreen({super.key});

  @override
  State<HistorialEgresoScreen> createState() => _HistorialEgresoScreenState();
}

class _HistorialEgresoScreenState extends State<HistorialEgresoScreen> {
  final PageController _controller = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      showFooter: true,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Color(0xFF2C6E87)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 8),
                const Text(
                  '📘 Historial de Egresos',
                  style: TextStyle(
                    color: Color(0xFF2C6E87), // Azul MuniLab
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: PageView(
              controller: _controller,
              children: [
                Card(
                  color: Color(0xFFE3F2FD),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('💡 Consejo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Revisa tus egresos mensualmente para mantener un buen control financiero.'),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color(0xFFF1F8E9),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('📊 Sugerencia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Puedes reducir gastos agrupando servicios como internet y TV.'),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color(0xFFFFF3E0),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('💬 Dato útil', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Considera establecer un presupuesto máximo para cada categoría.'),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Color(0xFFFCE4EC),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('📝 Recordatorio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 8),
                        Text('Guarda comprobantes de pago para cada egreso importante.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Nuevo SmoothPageIndicator justo debajo del PageView
          const SizedBox(height: 16),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Color(0xFF2C6E87),
                dotColor: Colors.grey.shade300,
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: [
                      ListTile(
                        leading: Icon(Icons.edit, color: Colors.blue),
                        title: Text('Actualización de Arriendo'),
                        subtitle: Text('Monto anterior: \$10.000\nMonto nuevo: \$15.000\nFecha: 15/09/2025'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.edit, color: Colors.blue),
                        title: Text('Actualización de Agua Potable'),
                        subtitle: Text('Monto anterior: \$20.000\nMonto nuevo: \$22.000\nFecha: 14/09/2025'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.delete, color: Colors.red),
                        title: Text('Eliminación de Internet/TV Cable'),
                        subtitle: Text('Monto: \$14.000\nFecha: 13/09/2025'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: const Text('Volver'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}