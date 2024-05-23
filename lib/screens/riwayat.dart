import 'package:flutter/material.dart';

class RiwayatScreen extends StatefulWidget {
  @override
  State<RiwayatScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<RiwayatScreen> {
  // int _buttonIndex = 0;

  // final _scheduleWidgets = [
  //   UpcomingSchedule(),
  //   Container(),
  //   Container(),
  // ];

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReservationCard(
                date: 'Jumat, 01 Maret, 11:00 WIB',
                type: 'Langsung',
                hospital: 'Rumah Sakit Angkatan Udara RSAU dr. M. Salamun',
                doctor: 'Dr. Sahlan Iskandar',
                buttonText: 'Detail',
                buttonColor: Colors.grey,
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
              SizedBox(height: 16),
              ReservationCard(
                date: 'Senin, 23 Februari, 8:00 WIB',
                type: 'Online',
                hospital: 'Rumah Sakit Angkatan Udara RSAU dr. M. Salamun',
                doctor: 'Dr. Sahlan Iskandar',
                buttonText: 'Detail',
                buttonColor: Colors.grey,
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
              SizedBox(height: 16),
              ReservationCard(
                date: 'Rabu, 15 April, 10:00 WIB',
                type: 'Langsung',
                hospital: 'Rumah Sakit Cipto Mangunkusumo',
                doctor: 'Dr. Anisa Putri',
                buttonText: 'Detail',
                buttonColor: Colors.grey,
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
              SizedBox(height: 16),
              ReservationCard(
                date: 'Kamis, 05 Mei, 9:00 WIB',
                type: 'Online',
                hospital: 'Rumah Sakit Hasan Sadikin',
                doctor: 'Dr. Budi Santoso',
                buttonText: 'Detail',
                buttonColor: Colors.grey,
                onPressed: () {
                  // Add your onPressed code here!
                },
              ),
            ],
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
