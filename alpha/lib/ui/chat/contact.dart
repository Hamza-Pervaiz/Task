class Contact {
  final String name;
  final String lastMessage;
  final String avatarUrl;
  final int unseen;

  Contact(
      {required this.name,
      required this.lastMessage,
      required this.avatarUrl,
      required this.unseen});
  static final List<Contact> contacts = [
    Contact(
        name: "Alice",
        lastMessage: "See you soon!",
        avatarUrl: "assets/images/avatar1.jpg",
        unseen: 3),
    Contact(
        name: "Bob",
        lastMessage: "Got the documents.",
        avatarUrl: "assets/images/avatar2.png",
        unseen: 0),
    Contact(
        name: "Charlie",
        lastMessage: "Thanks!",
        avatarUrl: "assets/images/avatar3.jpg",
        unseen: 6),
    Contact(
        name: "David",
        lastMessage: "Let's meet at 5.",
        avatarUrl: "assets/images/avatar4.jpg",
        unseen: 0),
  ];
  static final List<Contact> contact2 = [
    Contact(
        name: "Alice",
        lastMessage: "See you soon!",
        avatarUrl: "assets/images/avatar1.jpg",
        unseen: 3),
    Contact(
        name: "Bob",
        lastMessage: "Got the documents.",
        avatarUrl: "assets/images/avatar2.png",
        unseen: 0),
    Contact(
        name: "Charlie",
        lastMessage: "Thanks!",
        avatarUrl: "assets/images/avatar3.jpg",
        unseen: 6),
    Contact(
        name: "David",
        lastMessage: "Let's meet at 5.",
        avatarUrl: "assets/images/avatar4.jpg",
        unseen: 0),
    Contact(
        name: "Alice",
        lastMessage: "See you soon!",
        avatarUrl: "assets/images/avatar1.jpg",
        unseen: 3),
    Contact(
        name: "Bob",
        lastMessage: "Got the documents.",
        avatarUrl: "assets/images/avatar2.png",
        unseen: 0),
    Contact(
        name: "Charlie",
        lastMessage: "Thanks!",
        avatarUrl: "assets/images/avatar3.jpg",
        unseen: 6),
    Contact(
        name: "David",
        lastMessage: "Let's meet at 5.",
        avatarUrl: "assets/images/avatar4.jpg",
        unseen: 0),
  ];
}
