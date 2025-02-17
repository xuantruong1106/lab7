import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DestinyApp(),
    )
  );
}

class DestinyApp extends StatefulWidget {
  const DestinyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  storyBrain.getStory(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () => nextStory(1),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(storyBrain.getChoice1(), style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 10.0),
                Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () => nextStory(2),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text(storyBrain.getChoice2(), style: TextStyle(fontSize: 18)),
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
