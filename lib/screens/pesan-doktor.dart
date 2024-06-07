import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/screens/pilih-jam.dart';

class PesanDoktorScreen extends StatelessWidget {
  final List<String> imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
    "doctor5.jpg",
    "doctor6.jpg",
  ];

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
        centerTitle: false, // Membuat teks tidak terpusat
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HospitalCard(),
            SizedBox(height: 20),
            DoctorList(imgs: imgs),
          ],
        ),
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
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
                      'Rumah Sakit Dr. Wahidin Sudirohusodo',
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
                    child: Text(
                      'Jl. Ciumbuleuit No.203, Ciumbuleuit, Kec. Cidadap, Kota Bandung, Jawa Barat 40142',
                    ),
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
                              color: Colors.black,
                              size: 12), // Menambahkan icon titik lokasi
                          SizedBox(width: 2), // Spasi antara icon dan teks
                          Text(
                            '1,2km',
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
  final List<String> imgs;

  DoctorList({required this.imgs});

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
        DoctorCard(
            name: 'Dr. Sahlan Iskandar',
            specialization: 'Spesialis Umum',
            image: imgs[0]),
        DoctorCard(
            name: 'Dr. Rini Widodo',
            specialization: 'Spesialis Anak',
            image: imgs[1]),
        DoctorCard(
            name: 'Dr. Ahmad Yani',
            specialization: 'Spesialis Bedah',
            image: imgs[2]),
        DoctorCard(
            name: 'Dr. Budi Santoso',
            specialization: 'Spesialis Jantung',
            image: imgs[3]),
        DoctorCard(
            name: 'Dr. Tuti Herawati',
            specialization: 'Spesialis Kulit',
            image: imgs[4]),
        DoctorCard(
            name: 'Dr. Agus Supriyadi',
            specialization: 'Spesialis Mata',
            image: imgs[5]),
      ],
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String image;

  DoctorCard({
    required this.name,
    required this.specialization,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(specialization),
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
                                        ConsultationBookingPage(),
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
                              // handle direct consultation action
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
    );
  }
}
