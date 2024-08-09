class Project {
  final String name;
  final String description;
  final String projectUrl;
  final String imageUrl;

  Project({
    required this.name,
    required this.description,
    required this.projectUrl,
    required this.imageUrl,
  });
}

List<Project> getProjects() {
  return <Project>[
    Project(
      name: 'VEngine',
      description: 'A game engine made in C++ with Vulkan.',
      imageUrl: 'https://raw.githubusercontent.com/bobis33/VEngine/main/assets/logo.png',
      projectUrl: 'https://github.com/bobis33/vengine',
    ),
    Project(
      name: 'Arcade',
      description: 'Arcade is a gaming platform: a program that lets the user choose a game to play and keeps a register of player scores. To be able to deal with the elements of your gaming plate-form at run-time, your graphics libraries and your games must be implemented as dynamic libraries, loaded at run-time. Each GUI available for the program must be used as a shared library that will be loaded and used dynamically by the main program.',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/Arcade',
    ),
    Project(
      name: 'RayTracer',
      description: 'Ray tracing is a technique used to generate realistic digital images by simulating the inverse path of light. Goal of this project is to create a program able to generate an image from a file describing the scene.',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/RayTracer',
    ),
    Project(
      name: 'MyFTP',
      description: 'The goal of this project is to create a FTP server RFC959 compliant. The network communication will be achieved through the use of TCP sockets.',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/MyFTP',
    ),
    Project(
      name: 'MyRPG',
      description: 'The goal of this project is to create a small video game in C with the CSFML library. The game must follow the rules of a RPG (Role Playing Game).',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/MyRPG',
    ),
    Project(
      name: 'MiniShell',
      description: 'The goal of this project is to create a simple shell(like TCSH or BASH).',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/MiniShell',
    ),
  ];
}
