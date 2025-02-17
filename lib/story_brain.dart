import 'story.dart';

class StoryBrain {
  int _storyIndex = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle: 'You are lost in a dark forest. Two paths lie ahead.',
      choice1: 'Take the left path',
      choice2: 'Take the right path',
    ),
    Story(
      storyTitle: 'You find a small house with lights on. What do you do?',
      choice1: 'Knock on the door',
      choice2: 'Walk past it',
    ),
    Story(
      storyTitle: 'A mysterious figure offers you a map. Will you take it?',
      choice1: 'Take the map',
      choice2: 'Refuse the offer',
    ),
    // Add more story points...
  ];

  String getStory() {
    return _storyData[_storyIndex].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyIndex].choice1;
  }

  String getChoice2() {
    return _storyData[_storyIndex].choice2;
  }

  void nextStory(int choiceNumber) {
    if (_storyIndex == 0 && choiceNumber == 1) {
      _storyIndex = 1;
    } else if (_storyIndex == 0 && choiceNumber == 2) {
      _storyIndex = 2;
    } else if (_storyIndex == 1 && choiceNumber == 1) {
      _storyIndex = 2;
    } else if (_storyIndex == 1 && choiceNumber == 2) {
      _storyIndex = 3;
    } else {
      restart();
    }
  }

  void restart() {
    _storyIndex = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyIndex < _storyData.length - 1;
  }
}
