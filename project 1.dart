import 'dart:io';

// Question structure
class Question {
  String questionText;
  List<String> options;
  String correctAnswer;

  Question(this.questionText, this.options, this.correctAnswer);
}

// Ask a single question and return whether the answer was correct
bool askQuestion(Question q) {
  print('\n${q.questionText}');
  for (int i = 0; i < q.options.length; i++) {
    print('${String.fromCharCode(65 + i)}. ${q.options[i]}');
  }

  stdout.write("Your answer (A/B/C/D): ");
  String? userInput = stdin.readLineSync()?.toUpperCase();

  int selectedIndex = userInput != null ? userInput.codeUnitAt(0) - 65 : -1;

  if (selectedIndex >= 0 &&
      selectedIndex < q.options.length &&
      q.options[selectedIndex] == q.correctAnswer) {
    print("✅ Correct!");
    return true;
  } else {
    print("❌ Incorrect. The correct answer was: ${q.correctAnswer}");
    return false;
  }
}

void main() {
  print("🎉 Welcome to the Dart CLI Quiz App!");

  List<Question> quizQuestions = [
    Question("What is the capital of India?", ["Delhi", "Mumbai", "Chennai", "Kolkata"], "Delhi"),
    Question("Which language is used for Flutter development?", ["Java", "Kotlin", "Dart", "Swift"], "Dart"),
    Question("What is the square root of 64?", ["6", "8", "10", "12"], "8"),
    Question("Which ocean is the largest?", ["Atlantic", "Indian", "Pacific", "Arctic"], "Pacific"),
    Question("What is H2O commonly known as?", ["Salt", "Oxygen", "Hydrogen", "Water"], "Water"),
  ];

  int score = 0;

  for (var q in quizQuestions) {
    if (askQuestion(q)) {
      score++;
    }
  }

  print("\n🎯 Quiz Completed!");
  print("Your final score: $score out of ${quizQuestions.length}");

  if (score == quizQuestions.length) {
    print("🏆 Excellent work!");
  } else if (score >= 3) {
    print("👍 Good job!");
  } else {
    print("📚 Keep practicing!");
  }
}