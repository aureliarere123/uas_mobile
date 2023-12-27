import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uas_mobile/shopping_cart_page.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff6f8fd),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          FontAwesomeIcons.angleLeft,
          color: Colors.black,
        ),
        title: const Text(
          'Music',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          const Align(
            child: Badge(
              alignment: Alignment.topRight,
              smallSize: 10.0,
              child: Icon(
                FontAwesomeIcons.solidBell,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ShoppingCartPage();
              }));
            },
            child: const Icon(
              FontAwesomeIcons.basketShopping,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: ListView(
        children: [
          musicCarouselWidget(deviceWidth),
          titleTextWidget(deviceWidth),
          productGridViewWidget(deviceWidth),
        ],
      ),
    );
  }

  Widget musicCarouselCard(deviceWidth) {
    return SizedBox(
      width: deviceWidth / 1.1,
      height: deviceWidth / 1.1,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(deviceWidth / 50)),
            child: Image.asset(
              'assets/album.jpg',
              scale: .83,
            ),
          ),
          SizedBox(
            height: deviceWidth / 20,
          ),
          Text(
            "\$125",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: deviceWidth / 20),
          )
        ],
      ),
    );
  }

  Widget musicCarouselWidget(deviceWidth) {
    return Padding(
      padding: EdgeInsets.only(
        top: deviceWidth / 20,
      ),
      child: CarouselSlider(
        items: [
          musicCarouselCard(deviceWidth),
          musicCarouselCard(deviceWidth),
        ],
        options: CarouselOptions(
          viewportFraction: .949,
          padEnds: true,
          enableInfiniteScroll: false,
          height: deviceWidth * 1.1,
          disableCenter: true,
        ),
      ),
    );
  }

  Widget titleTextWidget(deviceWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Music Album',
          style: TextStyle(fontSize: deviceWidth / 11),
        ),
        SizedBox(
          height: deviceWidth / 20,
        ),
        Text(
          'Rock music is a genre of popular music.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: deviceWidth / 23,
            color: Colors.grey,
          ),
        ),
        Text(
          'It developed during and after ther 1960s in the United Kingdom.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: deviceWidth / 23,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget productCard(deviceWidth, image, title, price) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(deviceWidth / 20),
              bottomLeft: Radius.circular(deviceWidth / 20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: deviceWidth / 3,
            height: deviceWidth / 3.4,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(deviceWidth / 50),
                topRight: Radius.circular(deviceWidth / 50),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(deviceWidth / 30),
            child: SizedBox(
              width: deviceWidth / 2,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: deviceWidth / 24,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(deviceWidth / 30, 0, deviceWidth / 30, 0),
            child: Text(
              price,
              style: TextStyle(
                fontSize: deviceWidth / 27,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget productGridViewWidget(deviceWidth) {
    return Padding(
      padding: EdgeInsets.all(deviceWidth / 20),
      child: GridView.count(
        childAspectRatio: .75,
        crossAxisCount: 2,
        primary: true,
        shrinkWrap: true,
        crossAxisSpacing: deviceWidth / 20,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          productCard(deviceWidth, 'assets/party.jpg',
              "Queen's Concert | Buy Ticket", "\$ 125"),
          productCard(deviceWidth, 'assets/party2.jpg',
              "Blue Jazz Concert | Buy Ticket", "\$ 199"),
        ],
      ),
    );
  }
}
