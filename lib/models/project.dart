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
      description: 'Arcade is a gaming platform. Games and graphical libraries are handled by dynamic libraries. The user can choose a graphical library and a game to play. Made in C++.',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/Arcade',
    ),
    Project(
      name: 'RayTracer',
      description: 'Ray tracing is a technique used to generate realistic digital images by simulating the inverse path of light. Goal of this project is to create a program able to generate an image from a file describing the scene. Made in C++.',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/RayTracer',
    ),
    Project(
      name: 'MyFTP',
      description: 'The goal of this project is to create a FTP server RFC959 compliant. The network communication will be achieved through the use of TCP sockets. Made in C.',
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
      description: 'The goal of this project is to create a simple shell(like TCSH or BASH). Made in C.',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/MiniShell',
    ),
    Project(
      name: 'Zappy',
      description: 'The goal of this project is to create a network game. The game is a simulation of a world in which teams of players can move and communicate in real time. Players are AI controlled. Made in C/C++/Python.',
      imageUrl: '',
      projectUrl: 'https://github.com/bobis33/Zappy',
    ),
  ];
}

