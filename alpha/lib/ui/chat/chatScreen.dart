import 'dart:io';

import 'package:alpha/resources/reponsive_size.dart';
import 'package:alpha/ui/appbar/appbar.dart';
import 'package:alpha/ui/chat/contact.dart';
import 'package:alpha/ui/chat/message.dart';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // Added for permissions

class Chatscreen extends StatefulWidget {
  final Contact contact;

  const Chatscreen({super.key, required this.contact});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  final List<Message> messages = [
    Message(content: "Hello!", isUserMessage: true),
    Message(content: "Hi! How can I help you today?", isUserMessage: false),
    Message(
        content: "I need some information about the design project.",
        isUserMessage: true),
    Message(
        content: "Sure, we can discuss it. What would you like to know?",
        isUserMessage: false),
    Message(content: "Can you send the latest updates?", isUserMessage: true),
    Message(content: "Of course. Sending it now.", isUserMessage: false),
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String content,
      {bool isUserMessage = true, String? imagePath, String? filePath}) {
    if (content.isNotEmpty || imagePath != null || filePath != null) {
      setState(() {
        messages.insert(
          0,
          Message(
            content: content,
            isUserMessage: isUserMessage,
            imagepath: imagePath,
            filepath: filePath,
          ),
        );
        _controller.clear();
      });
    }
  }

  Future<void> _requestPermissions() async {
    await Permission.photos.request();
    await Permission.storage.request();
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions(); // Request permissions when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      drawer: AppBar(),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          // Chat header
          Container(
            width: double.infinity,
            color: Color.fromARGB(255, 221, 221, 221),
            height: MySize.size80,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(
                        context); // Navigate back to the previous screen
                  },
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                      widget.contact.avatarUrl), // Optional avatar image
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Design Team',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('6 Members, 3 Online',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
          ),
          // Chat messages list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Row(
                  mainAxisAlignment: message.isUserMessage
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!message.isUserMessage)
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundImage: AssetImage(widget.contact.avatarUrl),
                        ),
                      ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      decoration: BoxDecoration(
                        color: message.isUserMessage
                            ? Colors.blueAccent
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: message.isUserMessage
                              ? Radius.circular(8)
                              : Radius.zero,
                          bottomRight: message.isUserMessage
                              ? Radius.zero
                              : Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (message.imagepath != null)
                            Image.file(File(message.imagepath!),
                                width: 200), // Display image
                          if (message.filepath != null) // Display file
                            Text("File: ${message.filepath!.split('/').last}",
                                style: TextStyle(color: Colors.blue)),
                          if (message
                              .content.isNotEmpty) // Display text message
                            Text(
                              message.content,
                              style: TextStyle(
                                  color: message.isUserMessage
                                      ? Colors.white
                                      : Colors.black),
                            ),
                        ],
                      ),
                    ),
                    if (message.isUserMessage)
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.blueAccent,
                          backgroundImage:
                              AssetImage('assets/images/avatar_dashboard.jpg'),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          // Message input area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.emoji_emotions_outlined),
                  color: Colors.orange,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return EmojiPicker(
                          onEmojiSelected: (Category? category, Emoji emoji) {
                            setState(() {
                              _controller.text +=
                                  emoji.emoji; // Append emoji to the text field
                            });
                          },
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  color: Colors.green,
                  onPressed: () async {
                    // Open file picker to attach documents
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      String fileName = result.files.single.name;
                      // Send the file path
                      _sendMessage("Attached file: $fileName",
                          isUserMessage: true,
                          filePath: result.files.single.path);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.image),
                  color: Colors.purple,
                  onPressed: () async {
                    // Pick an image from gallery
                    final pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      // Send the image path (you can customize the message)
                      _sendMessage("",
                          isUserMessage: true, imagePath: pickedFile.path);
                    }
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blueAccent,
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
