import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class SkateShop extends StatefulWidget {
  @override
  _SkateShopState createState() =>  _SkateShopState();
}

class _SkateShopState extends State<SkateShop> {
  List<SkateBoard> data = null;

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for(SkateBoard board in data)
            SkateItemWidget(
              title: "ELIE ZER",
              imagePath: board.imagePath,
              price: "\$250",
              backgroundColor: board.colors.color,
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _initializeColors().then((list) {
      setState(() {
        data = list;
      });
    });
  }

  Future _initializeColors() async {
    var images = ["tabla1.png", "tabla2.png", "tabla3.png", "tabla4.png", "tabla5.png", "tabla6.png"];

    List<SkateBoard> list = [];

    for(String image in images) {
      String imagePath = "assets/$image";
      PaletteGenerator colors = await PaletteGenerator.fromImageProvider(AssetImage(imagePath));
      list.add(SkateBoard(imagePath, colors.dominantColor));
    }

    return list;
  }
}

class SkateBoard {
  final String imagePath;
  final PaletteColor colors;

  SkateBoard(this.imagePath, this.colors);
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
      height: 200,
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
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 10,
                    fontWeight: FontWeight.w700,
                  ),
                )
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Text(price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 10,
                    fontWeight: FontWeight.w700,
                  ),
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