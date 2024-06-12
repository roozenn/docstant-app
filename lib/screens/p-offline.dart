import 'package:flutter/material.dart';
import 'package:healthcare/screens/bayar-obat.dart';

class PengobatanOffline extends StatefulWidget {
  @override
  State<PengobatanOffline> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<PengobatanOffline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: Text(
          'Pengobatan',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSectionWidget(
              title: 'Layanan Pengobatan',
              content:
                  'Tanggal: 01 Maret\nDokter: Dr. Sahlan Iskandar\nSpesialis: Umum\nPengobatan: Pemeriksaan Umum',
              width: double.infinity,
            ),
            SizedBox(height: 16),
            MainCard(
              sections: [
                SectionWidget(
                  title: '1. Nurse Stasion',
                  content:
                      'Tekanan Darah: 80 mmHg\nTinggi: 160 cm\nBerat Badan: 70 kg',
                  width: double.infinity,
                ),
                SizedBox(height: 16),
                SectionWidget(
                  title: '2. Diagnosis Dokter',
                  content:
                      'Diagnosis: Gejala Anda mungkin terkait dengan infeksi virus, termasuk kemungkinan infeksi COVID-19\n\n'
                      'Saran Umum:\n'
                      '- Jangan melakukan perjalanan atau kontak dekat dengan orang lain sampai hasil tes dikeluarkan.',
                  width: double.infinity,
                ),
                SizedBox(height: 16),
                SectionWidget(
                  title: '3. Obat',
                  content:
                      'Parasetamol: Obat ini dapat membantu menurunkan demam dan meredakan nyeri. \n\n'
                      'Antihistamin: Untuk meredakan gejala pilek seperti hidung tersumbat dan bersin.',
                  button: ElevatedButton(
                    onPressed: () {
                      // Add your button functionality here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicationPaymentPage(),
                        ),
                      );
                    },
                    child: Text('Bayar'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  width: double.infinity,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final String content;
  final Widget? button;
  final double? width;

  SectionWidget({
    required this.title,
    required this.content,
    this.button,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(content),
          if (button != null) ...[
            SizedBox(height: 8),
            button!,
          ]
        ],
      ),
    );
  }
}

class HeaderSectionWidget extends StatelessWidget {
  final String title;
  final String content;
  final double? width;

  HeaderSectionWidget({required this.title, required this.content, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 8),
          Text(content, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  final List<Widget> sections;

  MainCard({required this.sections});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sections,
      ),
    );
  }
}
