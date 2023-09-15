import 'package:flutter/material.dart';
import 'package:xyz/Quiz/quiz1.dart';
import 'Chapter/Chapter1.dart';

class QuizScreen extends StatelessWidget {
  final List<String> boxTexts = [
    'Patents', 'Copyrights', 'Trademarks', 'Industrial', 'Geographical',
    'Trade Secrets', 'Traditional', 'SICLD', 'Plants', 'Biodiversity',
  ];

  final List<Widget> screenList = [
    Quiz1Screen(), // Create an instance of Quiz1 screen
    Quiz1Screen(),
    Quiz1Screen(),
    Quiz1Screen(),
    Quiz1Screen(),
    Quiz1Screen(),
    Quiz1Screen(),
    Quiz1Screen(),
    Quiz1Screen(),
    Quiz1Screen(),
    // Add more screens here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Quiz Section',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Apply your knowledge!!',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: boxTexts.length,
              itemBuilder: (context, index) {
                Color borderColor;
                double borderWidth;
                String label;

                // Determine border color, width, and label based on index
                if (index < 2) {
                  // First 2 boxes with light green
                  borderColor = Colors.lightGreen;
                  borderWidth = 5.0;
                  label = 'Basic';
                } else if (index < 6) {
                  // Next 4 boxes with dark green
                  borderColor = Colors.green;
                  borderWidth = 10.0;
                  label = 'Intermediate';
                } else {
                  // Last 4 boxes with darkest green
                  borderColor = Color(0xFF006400);
                  borderWidth = 15.0;
                  label = 'Advanced';
                }

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => screenList[index],
                      ), // Navigate to the selected screen
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: borderColor,
                        width: borderWidth,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Quiz', // Add the welcome text here
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '$label', // Add the welcome text here
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          boxTexts[index],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
