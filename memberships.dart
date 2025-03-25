import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrainingProgramsScreen(),
    );
  }
}

class TrainingProgramsScreen extends StatefulWidget {
  const TrainingProgramsScreen({super.key});

  @override
  _TrainingProgramsScreenState createState() => _TrainingProgramsScreenState();
}

class _TrainingProgramsScreenState extends State<TrainingProgramsScreen> {
  String selectedTraining = "";

  Widget buildTrainingCard({
    required String title,
    required String price,
    required String sessions,
    required String time,
    required Color color,
    required IconData icon,
    required String buttonText,
  }) {
    bool isSelected = selectedTraining == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTraining = title;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: isSelected ? Colors.white : color),
                SizedBox(width: 8),
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isSelected ? Colors.white : Colors.black)),
              ],
            ),
            SizedBox(height: 4),
            Text(price, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isSelected ? Colors.white : color)),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: isSelected ? Colors.white : Colors.grey),
                SizedBox(width: 4),
                Text("Sessions: $sessions", style: TextStyle(color: isSelected ? Colors.white : Colors.grey)),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: isSelected ? Colors.white : Colors.grey),
                SizedBox(width: 4),
                Text("Time: $time", style: TextStyle(color: isSelected ? Colors.white : Colors.grey)),
              ],
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? Colors.white : color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  setState(() {
                    selectedTraining = title;
                  });
                },
                child: Text(buttonText, style: TextStyle(color: isSelected ? color : Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training Programs", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTrainingCard(
              title: "Basic Training",
              price: "Rs. 3000 /month",
              sessions: "Mon, Wed, Fri",
              time: "9:00 AM - 11:00 AM",
              color: Colors.blue,
              icon: Icons.school,
              buttonText: "Select Basic",
            ),
            buildTrainingCard(
              title: "Intermediate Training",
              price: "Rs. 4000 /month",
              sessions: "Mon-Fri",
              time: "2:00 PM - 4:00 PM",
              color: Colors.green,
              icon: Icons.emoji_events, // Cup icon
              buttonText: "Select Intermediate",
            ),
            buildTrainingCard(
              title: "Advanced Training",
              price: "Rs. 6000 /month",
              sessions: "Mon-Sat",
              time: "4:00 PM - 6:00 PM",
              color: Colors.purple,
              icon: Icons.workspace_premium, // Crown icon
              buttonText: "Select Advanced",
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTraining = "Private Training";
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: selectedTraining == "Private Training" ? Colors.orange : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: selectedTraining == "Private Training" ? Colors.white : Colors.orange),
                        SizedBox(width: 8),
                        Text("Private Training", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: selectedTraining == "Private Training" ? Colors.white : Colors.black)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text("Depends on Coach", style: TextStyle(fontSize: 16, color: selectedTraining == "Private Training" ? Colors.white : Colors.orange)),
                    SizedBox(height: 4),
                    Text("\u2022 Flexible Schedule", style: TextStyle(color: selectedTraining == "Private Training" ? Colors.white : Colors.black)),
                    Text("\u2022 Customized Duration", style: TextStyle(color: selectedTraining == "Private Training" ? Colors.white : Colors.black)),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedTraining == "Private Training" ? Colors.white : Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedTraining = "Private Training";
                          });
                        },
                        child: Text("Book Private Session", style: TextStyle(color: selectedTraining == "Private Training" ? Colors.orange : Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}