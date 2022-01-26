import 'package:flutter/material.dart';
import 'package:pokestore/useful/navigation/Nav.dart';
import 'package:pokestore/views/home/home_view.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Nav.offAll(page: HomeView());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contato view"),
        ),
      ),
    );
  }
}
