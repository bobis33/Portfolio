class Profile {
  final String introduction;
  final String description;
  final String imageUrl;
  final String cvUrl;

  Profile({
    required this.introduction,
    required this.description,
    required this.imageUrl,
    required this.cvUrl
  });
}

Profile getProfile() {
  return Profile(
      introduction: 'Hello, I\'m Elliot Masina / Bobis33',
      description: 'I am currently in my third year at Efrei engineering school, working in an apprenticeship. '
          'I specialize in software development and have a passion for low-level programming languages like C and C++. '
          'I love creating intuitive and dynamic applications, transforming complex ideas into simple, user-friendly solutions.\n\n'
          'When I\'m not coding, I enjoy [mention hobbies or interests]. '
          'My work is driven by deep curiosity and a desire to push the boundaries of what is possible in the digital world.',
      imageUrl: 'assets/images/profile.png',
      cvUrl: 'assets/assets/pdf/cv.pdf',
    );
}

