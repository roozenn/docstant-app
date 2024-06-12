import 'package:flutter/material.dart';
import 'package:healthcare/widgets/navbar-roots.dart';

class MedicationPaymentPage extends StatefulWidget {
  @override
  _MedicationPaymentPageState createState() => _MedicationPaymentPageState();
}

class _MedicationPaymentPageState extends State<MedicationPaymentPage> {
  String _selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Pembayaran Obat',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: PaymentDetails(),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: PaymentMethod(
                    selectedPaymentMethod: _selectedPaymentMethod,
                    onSelected: (value) {
                      setState(() {
                        _selectedPaymentMethod = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PaymentButton(
        selectedPaymentMethod: _selectedPaymentMethod,
      ),
    );
  }
}

class PaymentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rincian',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Tipe: Pembayaran Obat'),
            Text('Jadwal: Senin, 10 Januari 2024, 09:00 WIB'), // Dummy data
            Text('Biaya Obat: Rp150.000'),
            Text('Biaya Layanan: Rp5.000'),
            Text('Total: Rp155.000'),
          ],
        ),
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  final String selectedPaymentMethod;
  final ValueChanged<String> onSelected;

  PaymentMethod({
    required this.selectedPaymentMethod,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            PaymentOption(
              label: 'Credit Card',
              value: 'credit_card',
              groupValue: selectedPaymentMethod,
              onChanged: onSelected,
            ),
            PaymentOption(
              label: 'Bank Transfer',
              value: 'bank_transfer',
              groupValue: selectedPaymentMethod,
              onChanged: onSelected,
            ),
            PaymentOption(
              label: 'PayPal',
              value: 'paypal',
              groupValue: selectedPaymentMethod,
              onChanged: onSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

  PaymentOption({
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(label),
            ),
          ),
          SizedBox(width: 8),
          Radio<String>(
            value: value,
            groupValue: groupValue,
            onChanged: (value) => onChanged(value!),
          ),
        ],
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final String selectedPaymentMethod;

  PaymentButton({required this.selectedPaymentMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Bayar\nRp155.000',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.left,
            ),
            ElevatedButton(
              onPressed: selectedPaymentMethod.isNotEmpty
                  ? () {
                      // Handle payment with the selected payment method
                      print('Selected Payment Method: $selectedPaymentMethod');

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBarRoots(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    }
                  : null,
              child: Text('BAYAR'),
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedPaymentMethod.isNotEmpty
                    ? Colors.green
                    : Colors.grey,
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
