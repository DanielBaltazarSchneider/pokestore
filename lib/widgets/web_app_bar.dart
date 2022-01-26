import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({Key? key, required this.appBarHeight, required this.totalItemsCard, required this.onCardClick}) : super(key: key);
  final double appBarHeight;
  final int totalItemsCard;
  final Function onCardClick;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: appBarHeight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/logo-pokestore.png",
                fit: BoxFit.cover,
                // width: Responsive.width * 0.1,
              ),
            ),
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.search),
          ),
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
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => null,
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
