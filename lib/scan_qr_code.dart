import 'package:flutter/material.dart';
import 'mobile_scanner_screen.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrResult = 'Scanned Data will appear here';

  Future<void> scanQR() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MobileScannerScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        qrResult = result.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(qrResult, style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: scanQR,
              child: const Text('Scan Code'),
            ),
          ],
        ),
      ),
    );
  }
}