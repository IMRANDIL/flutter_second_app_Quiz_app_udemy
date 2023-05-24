class QuizQuestion {
  const QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffledList() {
    final shuffledList =
        List<String>.from(answers); // Create a copy of the answers list
    shuffledList.shuffle(); // Shuffle the copied list
    return shuffledList;
  }
}
