import 'package:flutter/material.dart';
import 'package:healthcare/screens/pembayaran.dart';
import 'package:healthcare/screens/pesan-doktor.dart';

class ConsultationBookingPage extends StatefulWidget {
  final Doctor doctor;

  ConsultationBookingPage({required this.doctor});

  @override
  _ConsultationBookingPageState createState() =>
      _ConsultationBookingPageState();
}

class _ConsultationBookingPageState extends State<ConsultationBookingPage> {
  String selectedDate = 'Senin, 1 Maret 2024';
  String selectedTime = '17.30';

  final List<String> daysOfWeek = [
    'Minggu',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu'
  ];

  final List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  void _showDatePicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Tanggal'),
          content: SingleChildScrollView(
            child: Column(
              children: List<Widget>.generate(14, (int index) {
                DateTime date = DateTime(2024, 3, 4).add(Duration(days: index));
                String dayOfWeek = daysOfWeek[date.weekday % 7];
                String month = months[date.month - 1];
                String formattedDate =
                    '$dayOfWeek, ${date.day} $month ${date.year}';
                return ListTile(
                  title: Text(formattedDate),
                  onTap: () {
                    setState(() {
                      selectedDate = formattedDate;
                    });
                    Navigator.of(context).pop();
                  },
                );
              }),
            ),
          ),
          actions: <Widget>[
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Daftar Konsultasi',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: DoctorCard(doctor: widget.doctor), // Updated to DoctorCard
            ),
            SizedBox(height: 16),
            DateSelector(
              selectedDate: selectedDate,
              onDateSelected: (date) => setState(() => selectedDate = date),
              showDatePicker: _showDatePicker,
              daysOfWeek: daysOfWeek,
              months: months,
            ),
            SizedBox(height: 16),
            TimeSlotCard(
              selectedTime: selectedTime,
              onTimeSelected: (time) => setState(() => selectedTime = time),
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomBar(
          selectedDate: selectedDate,
          selectedTime: selectedTime,
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                  'images/doctor1.jpg'), // replace with actual image path
            ),
            SizedBox(height: 16),
            Text(
              doctor.nama,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '10 Tahun',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              doctor.spesialisasi,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class DateSelector extends StatelessWidget {
  final String selectedDate;
  final ValueChanged<String> onDateSelected;
  final VoidCallback showDatePicker;
  final List<String> daysOfWeek;
  final List<String> months;

  DateSelector({
    required this.selectedDate,
    required this.onDateSelected,
    required this.showDatePicker,
    required this.daysOfWeek,
    required this.months,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          DateChip(
            date: 'Jumat, 1 Maret 2024',
            isSelected: selectedDate == 'Jumat, 1 Maret 2024',
            onSelected: () => onDateSelected('Jumat, 1 Maret 2024'),
          ),
          SizedBox(width: 8),
          DateChip(
            date: 'Sabtu, 2 Maret 2024',
            isSelected: selectedDate == 'Sabtu, 2 Maret 2024',
            onSelected: () => onDateSelected('Sabtu, 2 Maret 2024'),
          ),
          SizedBox(width: 8),
          DateChip(
            date: 'Minggu, 3 Maret 2024',
            isSelected: selectedDate == 'Minggu, 3 Maret 2024',
            onSelected: () => onDateSelected('Minggu, 3 Maret 2024'),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.more_horiz, size: 30),
            onPressed: showDatePicker,
          ),
        ],
      ),
    );
  }
}

class DateChip extends StatelessWidget {
  final String date;
  final bool isSelected;
  final VoidCallback onSelected;

  DateChip(
      {required this.date, required this.isSelected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Chip(
        label: Text(date),
        backgroundColor: isSelected ? Colors.green : Colors.grey[300],
        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}

class TimeSlotCard extends StatelessWidget {
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  TimeSlotCard({required this.selectedTime, required this.onTimeSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          children: [
            TimeSlot(
              time: '16.00',
              isSelected: selectedTime == '16.00',
              onSelected: () => onTimeSelected('16.00'),
            ),
            TimeSlot(
              time: '16.30',
              isSelected: selectedTime == '16.30',
              onSelected: () => onTimeSelected('16.30'),
            ),
            TimeSlot(
              time: '17.00',
              isSelected: selectedTime == '17.00',
              onSelected: () => onTimeSelected('17.00'),
            ),
            TimeSlot(
              time: '17.30',
              isSelected: selectedTime == '17.30',
              onSelected: () => onTimeSelected('17.30'),
            ),
            TimeSlot(
              time: '18.00',
              isSelected: selectedTime == '18.00',
              onSelected: () => onTimeSelected('18.00'),
            ),
            TimeSlot(
              time: '18.30',
              isSelected: selectedTime == '18.30',
              onSelected: () => onTimeSelected('18.30'),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSlot extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onSelected;

  TimeSlot(
      {required this.time, required this.isSelected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.blue[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final String selectedDate;
  final String selectedTime;

  BottomBar({required this.selectedDate, required this.selectedTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jadwal',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '$selectedDate, $selectedTime',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    selectedDate: selectedDate,
                    selectedTime: selectedTime,
                  ),
                ),
              );
            },
            child: Text('PILIH'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: TextStyle(fontSize: 16),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
