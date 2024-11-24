import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Phần nội dung chính
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo hoặc hình minh họa
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                          'assets/asas.png'), // Thay đường dẫn theo ý bạn
                    ),
                    const SizedBox(height: 20),

                    // Tiêu đề
                    const Text(
                      "Chào mừng bạn!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Đăng nhập để tiếp tục",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Nút đăng nhập với Google
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // async {
                  // print('Google Sign-In ');
                  // Map<String, dynamic>? user =
                  // await UserService().signInWithGoogle();
                  // if (user != null) {
                  // } else {}
                  // },
                },
                icon: Image.asset(
                  'assets/asas.png', // Thay đường dẫn theo ý bạn
                  height: 24,
                  width: 24,
                ),
                label: const Text(
                  'Đăng nhập với Google',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.black12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
