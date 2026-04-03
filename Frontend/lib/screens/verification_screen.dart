import 'package:flutter/material.dart';
import 'error_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _codeController = TextEditingController();

  void _verifyCode() {
    String code = _codeController.text.trim();

    if (code.isEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ErrorScreen(errorMessage: 'Please enter the verification code.'),
        ),
      );
      return;
    }

    if (code != '123456') { // Dummy code check
       Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ErrorScreen(errorMessage: 'Invalid verification code.'),
        ),
      );
      return;
    }

    // Success logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Verification Successful! Welcome.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDE8F9),
      appBar: AppBar(
        title: const Text('2FA Verification'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(25),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.security, size: 64, color: Colors.blueAccent),
              const SizedBox(height: 24),
              Text(
                'Enter Verification Code',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'A 6-digit code has been sent to your registered device.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(
                  labelText: '6-Digit Code',
                  hintText: '123456',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, letterSpacing: 8),
                maxLength: 6,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Verify', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Logic to resend code
                },
                child: const Text('Resend Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
