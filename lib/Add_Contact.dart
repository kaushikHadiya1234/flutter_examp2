import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_examp2/ContactModal.dart';
import 'package:flutter_examp2/Home_Screen.dart';
import 'package:image_picker/image_picker.dart';
String? path;
class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  var txtkey= GlobalKey<FormState>();
  TextEditingController txtname = TextEditingController();
  TextEditingController txtnum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key:txtkey,
        child: Scaffold(
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            title: Text(
              "new Contact",
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if(txtkey.currentState!.validate())
                    {
                      String name1 =txtname.text;
                      String num1 =txtnum.text;

                      ContactModal c1 = ContactModal(name: name1,num: num1,img: path);

                      ContactList.add(c1);
                      path=null;
                      Navigator.pop(context);
                    }

                },
                icon: Icon(
                  Icons.done,
                  size: 25,
                ),
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 120,
                    width: 120,
                    decoration:
                        BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                    child: Stack(
                      children: [
                        path!=null?Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,color: Colors.red
                          ),
                          child: CircleAvatar(
                            backgroundImage: FileImage(File('$path')),
                          ),
                        ):Align(alignment: Alignment.center,child: Icon(Icons.person,size: 70,)),

                        Align(
                          alignment: Alignment(0.9, 0.9),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Take Photo',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.blue),
                                        ),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  ImagePicker imagepicker =
                                                      ImagePicker();
                                                  XFile? xfile =
                                                      await imagepicker.pickImage(
                                                          source: ImageSource.camera);
                                                  setState(() {
                                                    path = xfile!.path;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.camera_alt_outlined,
                                                  color: Colors.white,
                                                  size: 25,
                                                )),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  ImagePicker imagepicker =
                                                      ImagePicker();
                                                  XFile? xfile =
                                                      await imagepicker.pickImage(
                                                          source: ImageSource.gallery);
                                                  setState(() {
                                                    path = xfile!.path;
                                                    Navigator.pop(context);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.photo,
                                                  color: Colors.white,
                                                  size: 25,
                                                )),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.blue,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                              {
                                return "Please Enter the Name";
                              }
                          },
                          controller: txtname,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            label: Text(
                              'Name',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 25,
                      color: Colors.blue,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return "Please Enter the Number";
                            }
                          },
                          controller: txtnum,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            label: Text(
                              'Phone',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
