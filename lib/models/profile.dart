import 'package:flutter_translate/flutter_translate.dart';


class Profile {
  final String introduction;
  final String description;
  final String imageUrl;
  final String cvUrl;
  final List<String> skills;

  Profile({
    required this.introduction,
    required this.description,
    required this.imageUrl,
    required this.cvUrl,
    required this.skills,
  });
}

Profile getProfile() {
  return Profile(
      introduction: translate('profile.introduction'),
      description: translate('profile.description'),
      imageUrl: 'assets/images/profile.png',
      cvUrl: 'assets/assets/pdf/cv.pdf',
      skills: ["Git", "C", "C++", "Python", "HTML", "JavaScript", "Dart", "Node.js", "CSS", "Angular", "React", "Flutter", "Docker", "MySQL", "MongoDB"],
  );
}
