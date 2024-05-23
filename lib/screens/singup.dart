import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/screens/login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;

  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  Future<void> _submitForm() async {
    if (_signUpKey.currentState!.validate()) {
      ScaffoldMessenger.of(_signUpKey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully')),
      );
    }
  }

  // String? _validateEmail(value) {
  //   if (value!.isEmpty) {
  //     return '* Masukan Email';
  //   }
  //   RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //   if (!emailRegExp.hasMatch(value)) {
  //     return '* Masukan Email yang Benar';
  //   }
  //   return null;
  // }

  // String? _validatePhoneNumber(value) {
  //   if (value!.isEmpty) {
  //     return '* Masukan Nomor Telepon';
  //   }
  //   if (value.length != 12) {
  //     return '* Masukan 12 digit Nomor Telepon';
  //   }
  //   return null;
  // }

  // String? _validatePassword(value) {
  //   if (value!.isEmpty) {
  //     return '* Masukan Password';
  //   }

  //   return null;
  // }

  // String? _validateUsername(value) {
  //   if (value!.isEmpty) {
  //     return '* Masukan Username';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(95, 189, 255, 1),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Form(
          key: _signUpKey,
          child: Column(
            children: [
              // Judul Halaman Pendaftaran
              Text(
                'Pendaftaran',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 50.0),
              ),
              // Judul Akun
              Text(
                'Akun',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 50.0),
              ),
              SizedBox(height: 50.0),
              // Input Email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Email",
                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                // validator: _validateEmail
              ),
              SizedBox(height: 20.0),
              // Input Password
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                // validator: _validatePassword
              ),
              SizedBox(height: 20.0),
              // Input Nama
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Nama",
                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                // validator: _validateUsername
              ),
              SizedBox(height: 20.0),
              // Input Nomor Telepon
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Nomor Telepon",
                  fillColor: Color.fromRGBO(255, 255, 255, 1),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                // validator: _validatePhoneNumber
              ),
              SizedBox(height: 20.0),
              // Tombol Daftar
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    "Daftar",
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 229, 94, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              // Tautan ke Halaman Masuk
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginScreen()));
                    },
                    child: Text(
                      "Sudah punya Akun? Masuk",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
