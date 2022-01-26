import 'package:flutter/material.dart';
import 'package:pokestore/useful/navigation/Nav.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final List<Pokemon> analises = PokeController.go.homeController.listPokemon;

    return WillPopScope(
      onWillPop: () async {
        Nav.previous(result: {"status": true, "msg": "Voltando do About"});
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("About view"),
        ),
        // body: Column(
        //   children: [
        //     Center(
        //       child: TextButton(
        //         child: Text("Contato"),
        //         onPressed: () => Nav.offAll(page: ContactView()),
        //       ),
        //     ),
        //     for (int i = 0; i < analises.length; i++) ...[
        //       Text(
        //         "${analises[i].name}",
        //         style: TextStyle(color: Colors.red),
        //       ),
        //     ]
        //   ],
        // ),
      ),
    );
  }
}
