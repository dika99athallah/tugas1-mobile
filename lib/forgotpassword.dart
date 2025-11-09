import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      decoration: const BoxDecoration(
        color: Color(0xFF272E49),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFF009090),
              borderRadius: BorderRadius.circular(2.5),
            ),
            margin: const EdgeInsets.only(bottom: 15),
          ),
          const Text(
            'Lupa password?',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color(0xFFE7E7E7),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Instruksi untuk melakukan reset password akan\ndikirim melalui email yang kamu gunakan untuk mendaftar.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 300,
            child: TextField(
              controller: emailController,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF333333),
                ),
                filled: true,
                fillColor: const Color(0xFFF1F3FF),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset('images/email2.png', width: 18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFF1F3FF), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF009090), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Link reset password telah dikirim ke email kamu!'),
                ),
              );
            },
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF009090),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFBFBFB),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
