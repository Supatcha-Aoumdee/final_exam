import 'package:flutter/material.dart';
import 'package:final_exam_650710165/component/profile_card.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});
 
   @override
   _MyAppState createState() => _MyAppState();
 }
 
 class _MyAppState extends State<MyApp> {
 
   ThemeMode _themeMode = ThemeMode.light;
 
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'ThemeMode Demo',
       theme: ThemeData.light().copyWith(
         scaffoldBackgroundColor: Colors.white, 
         textTheme: const TextTheme(
             bodyMedium: TextStyle(color: Colors.black)), 
         appBarTheme: const AppBarTheme(backgroundColor: Colors.deepPurple),
       ),
       darkTheme: ThemeData.dark().copyWith(
         scaffoldBackgroundColor: Colors.blueGrey[900], 
         textTheme: const TextTheme(
             bodyMedium: TextStyle(color: Colors.white)),
         appBarTheme: AppBarTheme(backgroundColor: Colors.grey[800]),
       ),
       themeMode: _themeMode,
 
       home: MyWidget(
         onThemeToggle: () {
           setState(() {
 
             _themeMode = _themeMode == ThemeMode.light
                 ? ThemeMode.dark
                 : ThemeMode.light;
           });
         },
         themeMode: _themeMode,
       ),
     );
     
   }
 }

 class MyWidget extends StatelessWidget {
   final VoidCallback onThemeToggle;
   final ThemeMode themeMode;
 
   const MyWidget({super.key, required this.onThemeToggle, required this.themeMode});
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Profile Widget'),
         centerTitle: true,
         actions: [
           IconButton(
             icon: Icon(
               themeMode == ThemeMode.dark ? Icons.wb_sunny : Icons.nightlight_round,
             ),
             onPressed: onThemeToggle, 
           ),
         ],
       ),
       body: const Center(
         child: ProfileCard(
           name: 'Supatcha Aoumdee',
           position: 'Student',
           email: 'Aoumdee_s@Silpakorn.edu',
           phoneNumber: '0971279799',
           imageUrl: 'assets/profile.jpg',
           isAsset: true,
         ),
       ),
     );
   }
 }
 

