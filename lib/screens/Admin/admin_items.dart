import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../widgets.dart';

class AdminItems extends StatefulWidget {
  AdminItems({required this.category});
  String category;

  @override
  State<AdminItems> createState() => _AdminItemsState();
}

class _AdminItemsState extends State<AdminItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
      SizedBox(height: getheight(context, 60)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.keyboard_arrow_left)),
            Spacer(),
            Text(widget.category,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Spacer(),
          ],
        ),
      ),
      SizedBox(
        height: getheight(context, 40),
      ),
      Expanded(
          child: SingleChildScrollView(
        child: StreamBuilder<Object>(
            stream: FirebaseFirestore.instance
                .collection("Canteens")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection("Menu")
                .doc(widget.category)
                .collection("Items")
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<_Item> _itemlist = [];
                for (var i in snapshot.data.docs) {
                  print(i.id);
                  _itemlist.add(_Item(
                    category: widget.category,
                    toggle: i.data()["Status"],
                    ontap: () {},
                    docid: i.id,
                    image: i.data()["Photo"],
                    name: i.data()["Name"],
                  ));
                }
                return Column(children: _itemlist);
              } else {
                return Column(
                  children: [Text("No Items")],
                );
              }
            }),
      )),
      SizedBox(
        height: getheight(context, 60),
      )
    ])));
  }
}

class _Item extends StatefulWidget {
  _Item(
      {required this.toggle,
      required this.ontap,
      required this.name,
      required this.docid,
      required this.category,
      required this.image});
  late Function ontap;

  String name, image, docid, category;
  bool toggle;

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  late String food_name, price;
  String dropdownValue = 'BreakFast';
  var items = [
    'BreakFast',
    'Lunch',
    'Dinner',
    "Snacks",
    'Bakery',
    'Bevrages',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getheight(context, 102),
          width: getwidth(context, 315),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.001),
                spreadRadius: 3,
                blurRadius: 8,
                offset: Offset(0, 7), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getheight(context, 10)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  // backgroundImage: NetworkImage(image),
                  backgroundImage: NetworkImage(widget.image),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            radius: 20,
                                            child: Icon(Icons.close),
                                            backgroundColor: orange_color,
                                          ),
                                        ),
                                      ),
                                      Form(
                                        // key: _formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text("Edit"),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                  validator: (value) {
                                                    if (value
                                                            .toString()
                                                            .length <
                                                        1) {
                                                      return "Enter valid Name!";
                                                    }
                                                  },
                                                  onChanged: ((value) {
                                                    food_name = value;
                                                  }),
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  decoration: InputDecoration(
                                                      hintText: "Food Name",
                                                      hintStyle: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)))),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextField(
                                                  onChanged: (value) {
                                                    price = value;
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  decoration: InputDecoration(
                                                      hintText: "Enter price",
                                                      hintStyle: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)))),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: DropdownButton<String>(
                                                hint: Text("Select Category",
                                                    style: TextStyle(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        fontSize: 16)),
                                                isExpanded: true,
                                                value: dropdownValue,
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                elevation: 16,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                underline: Container(
                                                  height: 0.3,
                                                  color: Colors.black,
                                                ),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownValue = newValue!;
                                                  });
                                                },
                                                items:
                                                    items.map((String items) {
                                                  return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items));
                                                }).toList(),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: () {
                                                //   if (_formKey.currentState!
                                                //       .validate()) {
                                                //     FirebaseFirestore.instance
                                                //         .collection("Users")
                                                //         .doc(BlocProvider.of<
                                                //                     CanteenCubit>(
                                                //                 context)
                                                //             .state
                                                //             .currentuser
                                                //             .uid)
                                                //         .set({
                                                //       "Fullname": name,
                                                //       "phone": phone
                                                //     }, SetOptions(merge: true));
                                                //     BlocProvider.of<CanteenCubit>(
                                                //             context)
                                                //         .get_user_data(
                                                //             FirebaseAuth.instance
                                                //                 .currentUser!.uid,
                                                //             context);
                                                //     Navigator.pop(context);
                                                //     Fluttertoast.showToast(
                                                //         msg: "Details Updated!");
                                                //   }
                                              },
                                              child: Container(
                                                height: getheight(context, 50),
                                                width: getwidth(context, 100),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: orange_color),
                                                child: Center(
                                                  child: Text(
                                                    "Done",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Text("Edit",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: orange_color)),
                      )
                    ]),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                      top: getheight(context, 30),
                      right: getwidth(context, 15)),
                  child: FlutterSwitch(
                      height: getheight(context, 25),
                      width: getwidth(context, 45),
                      toggleColor: Colors.white,
                      inactiveColor: Colors.grey,
                      activeColor: Colors.greenAccent,
                      value: widget.toggle,
                      onToggle: (value) {
                        setState(() {
                          widget.toggle = !widget.toggle;
                          FirebaseFirestore.instance
                              .collection("Canteens")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection("Menu")
                              .doc(widget.category)
                              .collection("Items")
                              .doc(widget.docid)
                              .set({"Status": widget.toggle},
                                  SetOptions(merge: true));
                          print(widget.toggle);
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getheight(context, 20),
        )
      ],
    );
  }
}
