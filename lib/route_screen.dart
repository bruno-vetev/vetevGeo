import 'dart:math';
import 'package:flutter/material.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final _origemController = TextEditingController();
  final _destinoController = TextEditingController();
  String? _resultado;

  static const Map<String, List<double>> _cidades = {
    'porto': [41.1579, -8.6291],
    'lisboa': [38.7223, -9.1393],
    'coimbra': [40.2033, -8.4103],
    'braga': [41.5454, -8.4265],
    'faro': [37.0194, -7.9304],
    'aveiro': [40.6443, -8.6455],
  };

  double _haversineKm(double lat1, double lon1, double lat2, double lon2) {
    const r = 6371.0;
    final dLat = _toRad(lat2 - lat1);
    final dLon = _toRad(lon2 - lon1);
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRad(lat1)) * cos(_toRad(lat2)) * sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return r * c;
  }

  double _toRad(double deg) => deg * (pi / 180);

  void _calcular() {
    final origem = _cidades[_origemController.text.trim().toLowerCase()];
    final destino = _cidades[_destinoController.text.trim().toLowerCase()];

    if (origem == null || destino == null) {
      setState(() {
        _resultado =
            'Cidade não reconhecida. Tenta: Porto, Lisboa, Coimbra, Braga, Faro, Aveiro.';
      });
      return;
    }

    final km = _haversineKm(origem[0], origem[1], destino[0], destino[1]);
    setState(() {
      _resultado = '${km.toStringAsFixed(1)} km (linha reta)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calcular Percurso')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _origemController,
              decoration: const InputDecoration(
                labelText: 'Origem',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _destinoController,
              decoration: const InputDecoration(
                labelText: 'Destino',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 24),
            if (_resultado != null)
              Text(
                _resultado!,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}