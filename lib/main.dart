import 'package:final_exam_650710165/answer1.dart';
import 'package:final_exam_650710165/answer2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyWidget());
    // return MaterialApp(home: Answer2());
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('โปรไฟล์ผู้ใช้'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Answer1(
            name: 'ชื่อผู้ใช้: John Doe',
            email: 'อีเมล: johndoe@example.com',
            imageUrl:
                'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png',
            isAsset: false,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.settings, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('การตั้งค่า', style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.lock, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('เปลี่ยนรหัสผ่าน', style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.question_mark, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('ความเป็นส่วนตัว', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("แก้ไขโปรไฟล์")),
              );
            },
            child: const Text('แก้ไขโปรไฟล์'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("ออกจากระบบ")),
              );
            },
            child: const Text('ออกจากระบบ'),
          ),
        ],
      ),
    );
  }
}
