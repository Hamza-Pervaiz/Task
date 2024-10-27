import 'package:alpha/resources/reponsive_size.dart';
import 'package:alpha/ui/Dashboard/dashboard.dart';
import 'package:alpha/ui/calander/calanderScreen.dart';
import 'package:alpha/ui/chat/chatContactListScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.only(top: MySize.size15),
        children: [
          Padding(
            padding: EdgeInsets.all(MySize.size15),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/icon.png',
                    width: MySize.size34,
                    height: MySize.size34,
                  ),
                ),
                Text(
                  'alpha',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, fontSize: MySize.size18),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.menu),
            title: Text('Overview'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          ListTile(
            leading: Icon(Icons.card_travel_sharp),
            title: Text('Ecommerce'),
            onTap: () => null,
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons
                  .calendarDay, // Use the Instagram icon from Font Awesome
              //     color: Colors.pink,
            ),
            title: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Calanderscreen()));
                },
                child: Text('Calander')),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Mail'),
            trailing: CircleAvatar(
              radius: MySize.size15,
              backgroundColor: Colors.red,
              child: Text(
                '8',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Task'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Chatcontactlistscreen(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Project'),
            leading: FaIcon(FontAwesomeIcons.rProject),
            onTap: () => null,
          ),
          ListTile(
            title: Text('File Manager'),
            leading: Icon(Icons.file_copy_rounded),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Notes'),
            leading: Icon(Icons.notes),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
