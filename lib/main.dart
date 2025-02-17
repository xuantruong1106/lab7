import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'story_brain.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DestinyApp(),
    ),
  );
}

class DestinyApp extends StatefulWidget {
  const DestinyApp({super.key});

  @override
  _DestinyAppState createState() => _DestinyAppState();
}

class _DestinyAppState extends State<DestinyApp> {
  StoryBrain storyBrain = StoryBrain();

  void nextStory(int choice) {
    setState(() {
      storyBrain.nextStory(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade900, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Destiny',
                  style: GoogleFonts.lobster(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // Story Text
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    storyBrain.getStory(),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),

                // Choice 1 Button
                ElevatedButton(
                  onPressed: () => nextStory(1),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15.0),

                // Choice 2 Button (only visible when applicable)
                Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () => nextStory(2),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      storyBrain.getChoice2(),
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
