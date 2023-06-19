

//Idea to use GlobalData from OpenAI GPT4
class GlobalData {
  static final GlobalData _singleton = GlobalData._internal();

  factory GlobalData() {
    return _singleton;
  }

  GlobalData._internal();
  
  final Map<int, String> alarmChallenges = {};
  bool showAnimation = false;
  
  void setShowAnimation(bool value) {
    _singleton.showAnimation = value;
  }
}
