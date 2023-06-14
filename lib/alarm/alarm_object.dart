class Alarm {
  String time;
  String challenge;
  bool isActive;

  Alarm({required this.time, required this.challenge, this.isActive = true});

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'challenge': challenge,
      'isActive': isActive,
    };
  }

  factory Alarm.fromMap(Map<String, dynamic> map) {
    return Alarm(
      time: map['time'],
      challenge: map['challenge'],
      isActive: map['isActive'],
    );
  }
}
