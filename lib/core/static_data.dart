//Fake model

class Contact {
  String name;
  String onlineStatus;
  String? image;

  Contact({required this.name, required this.onlineStatus, this.image});

}


List<Contact> mockListOfContacts = [
  Contact(
    name: 'Athalia Putri',
    onlineStatus: 'Last seen yesterday',
    image: 'assets/images/Frame 3293.png',
  ),
  Contact(
    name: 'Erlan Sadwa',
    onlineStatus: 'Online',
    image: 'assets/images/Frame 3293 (1).png',
  ),
  Contact(
    name: 'Midala Huela',
    onlineStatus: 'Last seen 3 hours ago',
    image: 'assets/images/Frame 3293 (2).png',
  ),
  Contact(
    name: 'Nafisi Gitaeri',
    onlineStatus: 'Online',
    image: 'assets/images/Frame 3293 (3).png',
  ),
  Contact(
    name: 'Salisa Akira',
    onlineStatus: 'Last seen 30 minutes ago',
    image: 'assets/images/Frame 3293 (4).png',
  ),
];
