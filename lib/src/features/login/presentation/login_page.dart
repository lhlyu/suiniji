import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.transparent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  textAlign: TextAlign.center,
                  cursorHeight: 16,
                  decoration: InputDecoration(
                    hintText: '手机号码',
                    contentPadding: EdgeInsets.zero,
                    counterText: "",
                    border: InputBorder.none,
                  ),
                  scrollPadding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Checkbox(
                      value: false,
                      shape: const CircleBorder(),
                      onChanged: (bool? value) {},
                    ),
                  ),
                  const Text(
                    '是否同意用户协议',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        color: Colors.transparent,
        child: const Text(
          '随你记',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
