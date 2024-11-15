import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import 'base_page.dart';

class TrackingInfoPage extends StatefulWidget {
  final HomeController controller;

  TrackingInfoPage(this.controller);

  @override
  _TrackingInfoPageState createState() => _TrackingInfoPageState();
}

class _TrackingInfoPageState extends State<TrackingInfoPage> {
  // Mocked data for two tracked persons
  final String _person1Name = "Aulia";
  final String _person1Location = "Jl. Merdeka No. 10, Jakarta";
  final String _person1HealthStatus = "Isolasi Mandiri - Gejala Ringan";
  final String _person1LastUpdated = "15 November 2024, 12:45 WIB";

  final String _person2Name = "Anala";
  final String _person2Location = "Jl. Sudirman No. 5, Jakarta";
  final String _person2HealthStatus = "Sehat - Tidak Ada Gejala";
  final String _person2LastUpdated = "15 November 2024, 14:00 WIB";

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Container(
        color: Colors.brown[50],
        child: SingleChildScrollView(  // Ensures scrollability beyond screen
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              // Button for contact information aligned to the left
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.brown,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    _showPersonInfo(context, _person1Name, _person1Location, _person1HealthStatus, _person1LastUpdated);
                  },
                  child: Text('Informasi'),
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 8),
              _buildPersonInfoBox(
                personName: _person1Name,
                location: _person1Location,
                healthStatus: _person1HealthStatus,
                lastUpdated: _person1LastUpdated,
              ),
              const SizedBox(height: 20),
              // Button for contact information aligned to the left
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.brown,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    _showPersonInfo(context, _person2Name, _person2Location, _person2HealthStatus, _person2LastUpdated);
                  },
                  child: Text('Informasi'),
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(height: 8),
              _buildPersonInfoBox(
                personName: _person2Name,
                location: _person2Location,
                healthStatus: _person2HealthStatus,
                lastUpdated: _person2LastUpdated,
              ),
              const SizedBox(height: 40), // Add more space before the button

              // Centered Action Button for viewing details
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showDetailInfo(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Colors.brown,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text('Lihat Detail Lokasi'),
                ),
              ),
            ],
          ),
        ),
      ),
      selectedIndex: 2,
      controller: widget.controller,
    );
  }

  Widget _buildPersonInfoBox({
    required String personName,
    required String location,
    required String healthStatus,
    required String lastUpdated,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[100],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 2, offset: Offset(0, 2))],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Nama', personName),
          const SizedBox(height: 8),
          // Displaying the name directly below the label 'Nama Orang'
          Text(
            personName,
            style: TextStyle(fontSize: 14, color: Colors.brown[600]),
          ),
          const SizedBox(height: 8),
          _buildInfoRow('Lokasi Terakhir', location),
          const SizedBox(height: 8),
          _buildInfoRow('Status Kesehatan', healthStatus),
          const SizedBox(height: 8),
          _buildInfoRow('Terakhir Diperbarui', lastUpdated),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 3, // Beri lebih banyak ruang untuk title
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
        ),
        const SizedBox(width: 8), // Spasi antar title dan content
        Expanded(
          flex: 5, // Beri lebih banyak ruang untuk content
          child: Text(
            content,
            style: TextStyle(fontSize: 14, color: Colors.brown[400]),
            overflow: TextOverflow.visible, // Menampilkan teks secara penuh
          ),
        ),
      ],
    );
  }

  // Function to show more detailed information
  void _showDetailInfo(BuildContext context) {
    String details = 'Lokasi lebih detail dan tindakan terkait isolasi mandiri.';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detail Lokasi'),
          content: Text(details),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  // Function to show person-specific information
  void _showPersonInfo(BuildContext context, String name, String location, String healthStatus, String lastUpdated) {
    String info = 'Nama: $name\nLokasi Terakhir: $location\nStatus Kesehatan: $healthStatus\nTerakhir Diperbarui: $lastUpdated\n\nPenjelasan: Informasi ini berkaitan dengan status kesehatan dan lokasi orang yang sedang menjalani isolasi mandiri atau dalam kondisi sehat.';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informasi $name'),
          content: Text(info),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
