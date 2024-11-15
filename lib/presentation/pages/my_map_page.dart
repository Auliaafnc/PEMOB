import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/home_controller.dart';
import 'base_page.dart';

class MyMapPage extends StatelessWidget {
  final HomeController homeController;

  const MyMapPage(this.homeController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Koordinat Marker Pertama
    final LatLng marker1 = LatLng(-6.267519, 106.524880);

    // Koordinat Marker Kedua
    final LatLng marker2 = LatLng(-6.271292, 106.525190);

    // Titik tengah peta
    final LatLng center = LatLng(
      (marker1.latitude + marker2.latitude) / 2,
      (marker1.longitude + marker2.longitude) / 2,
    );

    // Data untuk marker
    final List<Map<String, dynamic>> markers = [
      {
        'point': marker1,
        'name': 'Aulia',
        'photo': 'assets/images/aul.jpg',
      },
      {
        'point': marker2,
        'name': 'Anala',
        'photo': 'assets/images/anala.jpg',
      },
    ];

    return BasePage(
      controller: homeController,
      selectedIndex: 1, // Contoh: jika halaman ini diakses dari navigasi ke-1
      bodyContent: FlutterMap(
        options: MapOptions(
          center: center,
          zoom: 16.0,
        ),
        children: [
          // Layer Tile OpenStreetMap
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.app',
          ),
          // Layer Marker
          MarkerLayer(
            markers: markers.map((marker) {
              return Marker(
                width: 100.0,
                height: 120.0,
                point: marker['point'],
                builder: (ctx) => Column(
                  children: [
                    // Foto pada marker yang dapat di-klik
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman informasi ketika foto di-klik
                        _navigateToInfoPage(context, marker['name'], marker['photo']);
                      },
                      child: ClipOval(
                        child: Image.asset(
                          marker['photo'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Nama marker
                    Text(
                      marker['name'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    // Ikon marker
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          // Layer Polyline
          PolylineLayer(
            polylines: [
              Polyline(
                points: [marker1, marker2],
                color: Colors.purple,
                strokeWidth: 4.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menavigasi ke halaman informasi
  void _navigateToInfoPage(BuildContext context, String name, String photo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationPage(name: name, photo: photo),
      ),
    );
  }
}

class InformationPage extends StatelessWidget {
  final String name;
  final String photo;

  const InformationPage({required this.name, required this.photo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name - Informasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              photo,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              'Nama: $name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Informasi lebih lanjut akan ditampilkan disini.',
              style: TextStyle(fontSize: 16),
            ),
            // Tambahkan informasi lainnya sesuai kebutuhan Anda
          ],
        ),
      ),
    );
  }
}
