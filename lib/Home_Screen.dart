import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_examp2/ContactModal.dart';
import 'package:url_launcher/url_launcher.dart';

List<ContactModal> ContactList = [
  ContactModal(name:"Darshan",num: "9916579256"),
  ContactModal(name:"prince",num: "9916579300"),
  ContactModal(name:"vivek",num: "9916579123"),
  ContactModal(name:"Darshan",num: "9916579963"),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        leading: Icon(Icons.arrow_back_outlined,color: Colors.grey[400],),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.more_vert,color: Colors.grey[400],),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Container(alignment: Alignment.centerLeft,child: Text("MY CONTACT",style: TextStyle(color: Colors.grey[400],fontSize: 20),)),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Type Name of Number",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  suffixIcon: Icon(Icons.search_rounded,color: Colors.grey[400],),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Container(alignment: Alignment.centerLeft,child: Text("A",style: TextStyle(color: Colors.blue,fontSize: 25),)),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Container(
                    height: 80,decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey))
                ),child: ContactTile(ContactList[index],index));
              },
              itemCount: ContactList.length,
              ),
            ),
          Divider(height: 1,)
          ,Container(
              height: 50,
              color: Colors.white,
              alignment: Alignment(0,1),
              child:FloatingActionButton(onPressed: () {
                Navigator.pushNamed(context, 'Add').then((value) {
                  setState(() {

                  });
                });
              },child: Icon(Icons.add),),
            )
          ],
        ),
      ),
    );
  }
  Widget ContactTile(ContactModal c,int index)
  {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'view',arguments: index);
      },
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: c.img==null?CircleAvatar(
            backgroundImage: AssetImage("Assets/image/person_icon.png",)
          ):CircleAvatar(
            backgroundImage: FileImage(File("${c.img}")),
          )
        ),
        title: Text("${c.name}",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
        subtitle: Text("${c.num}",style: TextStyle(fontSize: 18,color: Colors.grey[400]),),
        trailing: Container(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: () async {
                await launchUrl(Uri.parse('tel:${ContactList[index].num}'));
              },child: Icon(Icons.call,color: Colors.grey[400],)),
              InkWell(onTap: () async {
                await launchUrl(Uri.parse('sms:${ContactList[index].num}'));
              },child: Icon(Icons.message,color: Colors.grey[400],)),

            ],
          ),
        ),
      ),
    );
  }
}
//Image.asset("Assets/image/person_icon.png",fit: BoxFit.fill,):Image.file(File("${c.img}"),fit: BoxFit.fill,)