class UserProfile {
  String id;
  String name;
  String domain;
  String event1;
  String event2;
  String bagOfWords;
  String recommendedEvents;
  int loginId;
  String password;
  String reviews;

  UserProfile({
    required this.id,
    required this.name,
    required this.domain,
    required this.event1,
    required this.event2,
    required this.bagOfWords,
    required this.recommendedEvents,
    required this.loginId,
    required this.password,
    required this.reviews,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'],
      name: json['Name'],
      domain: json['Domain'],
      event1: json['Event1'],
      event2: json['Event2'],
      bagOfWords: json['Bag_of_words'],
      recommendedEvents: json['Recommended_Events'],
      loginId: json['Login_ID'],
      password: json['Password'],
      reviews: json['Reviews'],
    );
  }
}
