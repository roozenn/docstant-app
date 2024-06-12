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
                        title: 'Reservasi ${reservation.date}',
                        reservation: reservation,
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
  final String title;
  final Reservation reservation;

  const ReservationCard({
    required this.title,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue[100],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Detail Reservasi'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        _buildDataRow(Icons.local_hospital, 'Tipe Pelayanan',
                            reservation.type),
                        _buildDivider(),
                        _buildDataRow(Icons.location_city, 'Rumah Sakit',
                            reservation.hospital),
                        _buildDivider(),
                        _buildDataRow(
                            Icons.person, 'Dokter', reservation.doctor),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Tutup'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Detail', style: TextStyle(color: Colors.white)),
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
