import 'package:flutter/material.dart';

// Extend CustomAppBar from StatelessWidget and implement PreferredSizeWidget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(253, 231, 230, 230),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Action for search icon
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Action for settings icon
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Action for notifications icon
          },
        ),
        Container(
          height: 18, // Set a fixed height for the divider
          width: 1,
          color: Colors.grey, // Use a color for the divider
          margin: const EdgeInsets.symmetric(
              horizontal: 8), // Adjust spacing as needed
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar_dashboard.jpg'),
            radius: 20, // You can set the radius as needed
          ),
        ),
      ],
    );
  }

  // Provide the preferred size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
