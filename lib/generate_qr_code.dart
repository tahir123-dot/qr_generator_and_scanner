import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  TextEditingController urlController = TextEditingController();
  String qrData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generate QR Code')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (qrData.isNotEmpty)
                QrImageView(
                  data: qrData,
                  size: 200, // size barha diya
                ),

              const SizedBox(height: 18),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: 'Enter your data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Enter your data',
                  ),
                ),
              ),

              const SizedBox(height: 18),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    qrData = urlController.text;
                  });
                },
                child: const Text('Generate QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
