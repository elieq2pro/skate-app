import 'package:flutter/material.dart';

class SkateShop extends StatefulWidget {
  @override
  _SkateShopState createState() =>  _SkateShopState();
}

class _SkateShopState extends State<SkateShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SkateItemWidget(
            title: "ELIE ZER",
            imagePath: "assets/tabla1.png",
            price: "\$ 250",
            backgroundColor: Colors.blueAccent,
          ),
          SkateItemWidget(
            title: "ELIE ZER",
            imagePath: "assets/tabla2.png",
            price: "\$ 250",
            backgroundColor: Colors.redAccent,
          ),
          SkateItemWidget(
            title: "ELIE ZER",
            imagePath: "assets/tabla3.png",
            price: "\$ 250",
            backgroundColor: Colors.yellowAccent,
          ),
          SkateItemWidget(
            title: "ELIE ZER",
            imagePath: "assets/tabla4.png",
            price: "\$250",
            backgroundColor: Colors.greenAccent,
          ),
          SkateItemWidget(
            title: "ELIE ZER",
            imagePath: "assets/tabla5.png",
            price: "\$ 250",
            backgroundColor: Colors.purpleAccent,
          ),
          SkateItemWidget(
            title: "ELIE ZER",
            imagePath: "assets/tabla6.png",
            price: "\$ 250",
            backgroundColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class SkateItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final String price;
  final Color backgroundColor;

  const SkateItemWidget({Key key, this.title, this.imagePath, this.price, this.backgroundColor}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: backgroundColor,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Stack(
          children: <Widget>[
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Text(title,
                  textAlign: TextAlign.center,
                )
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Text(price,
                  textAlign: TextAlign.center,
                )
            ),
            RotatedBox(
                quarterTurns: 3,
                child: Center(
                    child: Image.asset(imagePath)
                )
            ),
          ],
        ),
      ),
    );
  }
}