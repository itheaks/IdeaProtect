import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xyz/course1.dart';
import 'package:xyz/home1.dart';
import 'package:xyz/profile.dart';
import 'package:xyz/quiz.dart';
import 'chatbotpage.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  final User user;

  HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Home1Screen(),
    Course1Screen(),
    ChatBotPage(),
    QuizScreen(),
    ProfileScreen(),
  ];

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/home1.png"),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/course1.png"),
            label: "Course",
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.pink,
              ),
              child: Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
            label: "Chatbot",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/quiz.png"),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/profile.png"),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
