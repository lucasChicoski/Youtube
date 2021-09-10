import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationApp extends StatefulWidget {
  @override
  _BottomNavigationAppState createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp> {
  BottomNavigationController bottomNavigationController =
      GetIt.I<BottomNavigationController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 1024) {
        return Observer(builder: (_) {
          return BottomNavigationBar(
          //  selectedItemColor: Colors.black, //Cor de texto
            fixedColor: Colors.red,
            currentIndex: bottomNavigationController.index,
            onTap: (index) {
              bottomNavigationController.index = index;
            },
            
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: "Iício",
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: "Em alta",
                icon: Icon(Icons.whatshot),
              ),
              BottomNavigationBarItem(
                label: "Inscrições",
                icon: Icon(Icons.subscriptions),
              ),
              BottomNavigationBarItem(
                label: "Biblioteca",
                icon: Icon(Icons.folder),
              ),
            ],
          );
        });
      } else {
        return Container(child: Text(""),);
      }
    });
  }
}
