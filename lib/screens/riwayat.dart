import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RiwayatScreen extends StatefulWidget {
  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  List<Reservation> reservations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchReservations();
  }

  Future<void> fetchReservations() async {
    final response =
        await http.get(Uri.parse('http://192.168.82.235:8000/reservations'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Reservation> fetchedReservations =
          data.map((json) => Reservation.fromJson(json)).toList();
      setState(() {
        reservations = fetchedReservations;
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load reservations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: reservations.map((reservation) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ReservationCard(
                        date: reservation.date,
                        type: reservation.type,
                        hospital: reservation.hospital,
                        doctor: reservation.doctor,
                        buttonText: 'Detail',
                        buttonColor: Colors.grey,
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final String date;
  final String type;
  final String hospital;
  final String doctor;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;

  const ReservationCard({
    required this.date,
    required this.type,
    required this.hospital,
    required this.doctor,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[100],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reservasi $date',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildDataRow(Icons.local_hospital, 'Tipe Pelayanan', type),
                    _buildDivider(),
                    _buildDataRow(Icons.location_city, 'Rumah Sakit', hospital),
                    _buildDivider(),
                    _buildDataRow(Icons.person, 'Dokter', doctor),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: onPressed,
                child: Text(buttonText, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black54),
        SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey[300], height: 16);
  }
}

class Reservation {
  final String date;
  final String type;
  final String hospital;
  final String doctor;

  Reservation({
    required this.date,
    required this.type,
    required this.hospital,
    required this.doctor,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      date: json['date'],
      type: json['type'],
      hospital: json['hospital'],
      doctor: json['doctor'],
    );
  }
}
