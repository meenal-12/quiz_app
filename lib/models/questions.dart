class QuizQuestion{
  const QuizQuestion(this.text,this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers(){
    final shufflledlist = List.of(answers);
    shufflledlist.shuffle();
    return shufflledlist;

  }
}