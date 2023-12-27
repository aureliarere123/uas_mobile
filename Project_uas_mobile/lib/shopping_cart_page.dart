import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff6f8fd),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            FontAwesomeIcons.angleLeft,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Shopping Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Align(
            child: Badge(
              alignment: Alignment.topRight,
              smallSize: 10.0,
              child: Icon(
                FontAwesomeIcons.solidBell,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Icon(
            FontAwesomeIcons.basketShopping,
            color: Colors.black,
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: ListView(
        children: [
          subtotalWidget(deviceWidth),
          productListWidget(deviceWidth),
          footerTextWidget(deviceWidth),
        ],
      ),
    );
  }

  Widget subtotalWidget(deviceWidth) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        deviceWidth / 20,
        deviceWidth / 10,
        deviceWidth / 20,
        deviceWidth / 30,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Cart subtotal (5 items): ",
                style: TextStyle(
                  fontSize: deviceWidth / 23,
                ),
              ),
              Text(
                "\$725",
                style: TextStyle(
                    fontSize: deviceWidth / 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: deviceWidth / 15,
          ),
          SizedBox(
            width: deviceWidth,
            height: deviceWidth / 8,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xff5874e4),
              ),
              onPressed: () {},
              child: Text(
                'Proceed to checkout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: deviceWidth / 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget productCard(deviceWidth, thumbnail, title, status, price) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        deviceWidth / 20,
        0,
        deviceWidth / 20,
        deviceWidth / 20,
      ),
      child: Container(
        padding: EdgeInsets.all(deviceWidth / 40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(deviceWidth / 55))),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  thumbnail,
                  width: deviceWidth / 4,
                  height: deviceWidth / 5,
                  fit: BoxFit.fitHeight,
                  scale: 4,
                ),
                SizedBox(
                  width: deviceWidth / 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: deviceWidth / 2.46,
                      child: Text(
                        title,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: deviceWidth / 23.9,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    SizedBox(
                      height: deviceWidth / 50,
                    ),
                    SizedBox(
                      width: deviceWidth / 2.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            status,
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: deviceWidth / 27,
                            ),
                          ),
                          Text(
                            price,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: deviceWidth / 27,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: deviceWidth / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff0b2c4c),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Text(
                        '01',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth / 10,
                      ),
                      Icon(
                        FontAwesomeIcons.angleDown,
                        size: deviceWidth / 30,
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff0b2c4c),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'DELETE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff0b2c4c),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'SAVE FOR LATER',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget productListWidget(deviceWidth) {
    return Column(
      children: [
        productCard(
          deviceWidth,
          'assets/beauty.jpg',
          "Discover What's New In Beauty And Rec ...",
          "In Stock",
          "\$ 180",
        ),
        productCard(
          deviceWidth,
          'assets/neworleans.jpg',
          "Carry the charm of New Orleans with you ...",
          "In Stock",
          "\$ 230",
        ),
        productCard(
          deviceWidth,
          'assets/lipstick.jpg',
          "Blue Nile is the world's leading diamond je ...",
          "In Stock",
          "\$ 90",
        ),
        productCard(
          deviceWidth,
          'assets/watch.jpg',
          "The perfect diamond engagement ring ...",
          "In Stock",
          "\$ 300",
        ),
      ],
    );
  }

  Widget footerTextWidget(deviceWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth / 20),
      child: Text(
        "Customers who shopped for items in your",
        textAlign: TextAlign.center,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: deviceWidth / 22),
      ),
    );
  }
}
