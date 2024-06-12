// import 'package:flutter/material.dart';

// class PaymentPage1 extends StatelessWidget {
//   final String selectedDate;
//   final String selectedTime;

//   PaymentPage({required this.selectedDate, required this.selectedTime});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         title: Text(
//           'Pembayaran Kontol',
//           style: TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: false,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   PaymentProfileCard(),
//                   SizedBox(height: 5),
//                   PaymentDetails(
//                       selectedDate: selectedDate, selectedTime: selectedTime),
//                   SizedBox(height: 5),
//                   PaymentMethod(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: PaymentButton(),
//     );
//   }
// }

// class PaymentProfileCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: AssetImage(
//                   'assets/doctor.png'), // replace with actual image path
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Dr. Sahlan Iskandar',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Spesialis APa',
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PaymentDetails extends StatelessWidget {
//   final String selectedDate;
//   final String selectedTime;

//   PaymentDetails({required this.selectedDate, required this.selectedTime});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Rincian',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text('Tipe: Konsultasi Langsung'),
//             Text('Jadwal: $selectedDate, $selectedTime WIB'),
//             Text('Biaya: Rp95.000'),
//             Text('Biaya Layanan: Rp1.000'),
//             Text('Total: Rp96.000'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PaymentMethod extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Metode Pembayaran',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             PaymentOption(),
//             PaymentOption(),
//             PaymentOption(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PaymentOption extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//           SizedBox(width: 8),
//           Radio(value: false, groupValue: null, onChanged: (value) {}),
//         ],
//       ),
//     );
//   }
// }

// class PaymentButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       decoration: BoxDecoration(
//         color: Colors.indigo,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Total Bayar\nRp100.000',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//               textAlign: TextAlign.left,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle payment
//               },
//               child: Text('BAYAR'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 textStyle: TextStyle(fontSize: 18),
//                 padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
