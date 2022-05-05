import 'package:canteen/screens/items.dart';
import 'package:canteen/widgets.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool payment_success = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getheight(context, 66),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getwidth(context, 50), right: getwidth(context, 129)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    ),
                  ),
                  Text(
                    "Order details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 34),
            ),
            Padding(
              padding: EdgeInsets.only(left: getwidth(context, 34)),
              child: Text(
                "Order Deatils",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: getheight(context, 26),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  payment_success
                      ? Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: getheight(context, 274),
                              width: getwidth(context, 272),
                              decoration: BoxDecoration(
                                  color: Color(0xff1A9F0B),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.check,
                                size: 100,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: getheight(context, 20),
                            ),
                            Text(
                              "Scanned",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w100,
                                  color: Color(0xff000000)),
                            )
                          ],
                        )
                      : Container(
                          height: getheight(context, 274),
                          width: getwidth(context, 272),
                          color: Colors.black,
                        ),
                  SizedBox(height: getheight(context, 28)),
                  RichText(
                    text: TextSpan(
                        text: "Date-",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000)),
                        children: [
                          TextSpan(
                              text: "05/07/2022",
                              style: TextStyle(fontWeight: FontWeight.w300))
                        ]),
                  ),
                  SizedBox(
                    height: getheight(context, 15),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Time-",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: "5:38 PM",
                              style: TextStyle(fontWeight: FontWeight.w300))
                        ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getheight(context, 28),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getwidth(
                  context,
                  34,
                ),
              ),
              child: const Text(
                "Items Ordered",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF94A0D)),
              ),
            ),
            SizedBox(
              height: getheight(context, 26),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: getwidth(context, 34)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Items(),
                      Items(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

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
            padding: EdgeInsets.symmetric(horizontal: getheight(context, 17)),
            child: Row(
              children: [
                Container(
                  height: getheight(context, 65),
                  width: getheight(context, 65),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.2))),
                  child: Image(image: AssetImage('images/food.png')),
                ),
                SizedBox(
                  width: 7,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Veggie tomato mix",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      SizedBox(height: 10),
                      Text("#1999",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xFFFA4A0C)))
                    ]),
                Spacer(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getheight(context, 14),
        )
      ],
    );
  }
}
