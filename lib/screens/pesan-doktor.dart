import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:healthcare/screens/pilih-jam.dart';

class PesanDoktorScreen extends StatefulWidget {
  final String hospitalName;
  final String hospitalAddress;
  final String hospitalDistance;

  PesanDoktorScreen({
    required this.hospitalName,
    required this.hospitalAddress,
    required this.hospitalDistance,
  });

  @override
  _PesanDoktorScreenState createState() => _PesanDoktorScreenState();
}

class _PesanDoktorScreenState extends State<PesanDoktorScreen> {
  List<Doctor> doctors = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  Future<void> fetchDoctors() async {
    final response =
        await http.get(Uri.parse('http://192.168.82.235:8000/dokter'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Doctor> fetchedDoctors =
          data.map((json) => Doctor.fromJson(json)).toList();

      // Randomly select 5 doctors
      fetchedDoctors.shuffle();
      setState(() {
        doctors = fetchedDoctors.take(5).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Pilih Dokter Anda',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HospitalCard(
              name: widget.hospitalName,
              address: widget.hospitalAddress,
              distance: widget.hospitalDistance,
            ),
            SizedBox(height: 20),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : DoctorList(doctors: doctors),
          ],
        ),
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String address;
  final String distance;

  HospitalCard({
    required this.name,
    required this.address,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Colors.lightBlue[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'images/hospital.jpg',
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(address),
                  ),
                  SizedBox(width: 8),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          'images/map.jpg',
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Colors.black, size: 12),
                          SizedBox(width: 2),
                          Text(
                            distance,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;

  DoctorList({required this.doctors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Dokter tersedia:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.filter_alt, color: Colors.white),
                label: Text('Filter', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[100]),
                onPressed: () {
                  // handle filter action
                },
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.search, color: Colors.white),
                label: Text('Cari', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[100]),
                onPressed: () {
                  // handle search action
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ...doctors
            .map((doctor) => DoctorCard(doctor: doctor, image: 'doctor1.jpg'))
            .toList(),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final String image;

  DoctorCard({
    required this.doctor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConsultationBookingPage(doctor: doctor),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          color: Colors.lightBlue[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/$image'),
                  radius: 30,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.nama,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(doctor.spesialisasi),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.yellow,
                                padding: EdgeInsets.symmetric(vertical: 8),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ConsultationBookingPage(
                                              doctor: doctor),
                                    ));
                              },
                              child: Text(
                                'Konsultasi Online',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.purple,
                                padding: EdgeInsets.symmetric(vertical: 8),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ConsultationBookingPage(
                                              doctor: doctor),
                                    ));
                              },
                              child: Text(
                                'Konsultasi Langsung',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Doctor {
  final int id;
  final String nama;
  final String spesialisasi;

  Doctor({required this.id, required this.nama, required this.spesialisasi});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      nama: json['nama'],
      spesialisasi: json['spesialisasi'],
    );
  }
}
