import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({Key? key, required this.appBarHeight, required this.totalItemsCard, required this.onCardClick}) : super(key: key);
  final double appBarHeight;
  final int totalItemsCard;
  final Function onCardClick;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        height: appBarHeight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/logo-pokestore.png",
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () => onCardClick(),
              icon: Icon(Icons.shopping_cart_sharp),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: totalItemsCard < 100 ? 20 : 25,
                width: totalItemsCard < 100 ? 20 : 25,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    "$totalItemsCard",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () => null,
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
