import 'package:alpha/resources/app_colors.dart';
import 'package:alpha/resources/reponsive_size.dart';
import 'package:alpha/ui/appbar/appbar.dart';
import 'package:alpha/ui/calander/calanderMenuSideBar.dart';
import 'package:alpha/ui/chat/chatScreen.dart';
import 'package:alpha/ui/chat/contact.dart';
import 'package:flutter/material.dart';

class Chatcontactlistscreen extends StatefulWidget {
  const Chatcontactlistscreen({super.key});

  @override
  State<Chatcontactlistscreen> createState() => _ChatcontactlistscreenState();
}

class _ChatcontactlistscreenState extends State<Chatcontactlistscreen> {
  var searchcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 221, 221, 221),
        drawer: NavBar(),
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.all(MySize.size10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: MySize.screenWidth,
              color: AppColors.lineColor,
              height: MySize.size2,
            ),
            Container(
              width: double.infinity,
              height: MySize.size60,
              decoration: BoxDecoration(//color: Colors.red
                  ),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  Expanded(
                    child: TextFormField(
                      controller: searchcon,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.black), // Hint color
                        border: InputBorder.none, // Remove default border
                      ),
                      style: TextStyle(color: Colors.black), // Set text color
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MySize.screenWidth,
              color: AppColors.lineColor,
              height: MySize.size2,
            ),
            Padding(
                padding: EdgeInsets.all(MySize.size10),
                child: Text(
                  'Pinnded Messages',
                  style: TextStyle(
                      fontSize: MySize.size14, fontWeight: FontWeight.w500),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: Contact.contacts.length,
                itemBuilder: (context, index) {
                  final contact = Contact.contacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(contact.avatarUrl),
                    ),
                    title: Text(contact.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(contact.lastMessage,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    trailing: contact.unseen != 0
                        ? CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Text(contact.unseen.toString()),
                          )
                        : CircleAvatar(
                            radius: 0,
                            //backgroundColor: Colors.red,
                            child: Text(''),
                          ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chatscreen(contact: contact),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.all(MySize.size10),
                child: Text(
                  'All Messages',
                  style: TextStyle(
                      fontSize: MySize.size14, fontWeight: FontWeight.w500),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: Contact.contact2.length,
                itemBuilder: (context, index) {
                  final contact = Contact.contact2[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(contact.avatarUrl),
                    ),
                    title: Text(contact.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(contact.lastMessage,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chatscreen(contact: contact),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ]),
        ));
  }
}
