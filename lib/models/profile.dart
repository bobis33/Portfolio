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
      introduction: 'Hello, I\'m Elliot Masina / Bobis33',
      description: 'My name is Elliot Masina, I\'m 24 years old, and I\'m currently in my third year at EFREI.'
          ' I\'ve always been passionate about computer science, with a particular interest in development, especially in low-level languages like C and C++.'
          ' My journey has also led me to delve into the field of cybersecurity, where I regularly participate in CTF (Capture The Flag) competitions to hone my skills.\n\n'
          'In addition, I have a strong passion for graphics programming, whether it\'s for game development or 3D modeling.'
          ' I\'ve had the opportunity to create a graphics engine in C++ using Vulkan, an experience that allowed me to push my technical boundaries.'
          'Currently, I\'m working on a real-time strategy (RTS) game project with Unreal Engine in C++, a challenge I approach with both enthusiasm and precision.',
      imageUrl: 'assets/images/profile.png',
      cvUrl: 'assets/assets/pdf/cv.pdf',
      skills: ["C", "C++", "Vulkan", "Unreal Engine", "Cybersecurity", "CTF", "3D Modeling"],
  );
}

