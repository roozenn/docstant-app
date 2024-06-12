import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:healthcare/screens/pesan-doktor.dart';

class RumahSakit {
  final String nama;
  final String alamat;

  RumahSakit({required this.nama, required this.alamat});

  factory RumahSakit.fromJson(Map<String, dynamic> json) {
    return RumahSakit(
      nama: json['nama'],
      alamat: json['alamat'],
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RumahSakit> rumahSakitList = [];
  bool isLoading = true;

  Future<void> getRumahSakit() async {
    try {
      var response = await http.get(Uri.parse(
          'http://192.168.82.235:8000/rumah_sakit/')); // Ganti dengan IP address lokal Anda

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<RumahSakit> tempRumahSakit = [];
        for (var eachRS in jsonData) {
          tempRumahSakit.add(RumahSakit.fromJson(eachRS));
        }
        setState(() {
          rumahSakitList = tempRumahSakit;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load rumah sakit');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load rumah sakit');
    }
  }

  @override
  void initState() {
    super.initState();
    getRumahSakit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: Row(
          children: [
            Icon(Icons.medical_services, color: Colors.white),
            SizedBox(width: 5),
            Text(
              'docstant',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/map.jpg',
                        width: 300,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rumah Sakit di sekitar Anda:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...rumahSakitList.map((rs) {
                    final distance =
                        (Random().nextDouble() * 5).toStringAsFixed(1) + 'km';
                    return HospitalCard(
                      name: rs.nama,
                      distance: distance,
                      address: rs.alamat,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PesanDoktorScreen(
                              hospitalName: rs.nama,
                              hospitalAddress: rs.alamat,
                              hospitalDistance: distance,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String distance;
  final String address;
  final VoidCallback onTap;

  HospitalCard({
    required this.name,
    required this.distance,
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: onTap,
          leading: Icon(Icons.location_city, color: Colors.white, size: 40),
          title: Text(
            name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.white),
              Text(
                distance,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
