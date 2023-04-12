import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_examp2/Home_Screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
String? path;
class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        body: Column(
          children: [
            SizedBox(height: 50),
            Stack(
              alignment: Alignment(0, -1.3),
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "${ContactList[index].name}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${ContactList[index].num}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FloatingActionButton(
                              onPressed: () async {
                                await launchUrl(Uri.parse(
                                    'sms:${ContactList[index].num}'));
                              },
                              heroTag: '1',
                              child: Icon(Icons.message),
                            ),
                            FloatingActionButton(
                              onPressed: () async {
                                await launchUrl(Uri.parse(
                                    'tel:${ContactList[index].num}'));
                              },
                              heroTag: '1',
                              child: Icon(Icons.call),
                            ),
                            FloatingActionButton(
                              onPressed: () async {
                                await launchUrl(Uri.parse(
                                    'mailto: kaushikhadiya5@gmail'));
                              },
                              heroTag: '1',
                              child: Icon(Icons.mail_outline),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: ContactList[index].img == null
                        ? CircleAvatar(
                            backgroundImage:
                                AssetImage("Assets/image/person_icon.png"))
                        : CircleAvatar(
                                 backgroundImage: FileImage(File('${path}')))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

