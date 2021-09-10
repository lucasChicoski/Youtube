import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../controllers/bottom_navigation_controller.dart';
import 'custom_search_delegate.dart';

class AppBarApp extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      GetIt.I<BottomNavigationController>();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.videocam,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () async {
           bottomNavigationController.research  = (await showSearch(
                context: context, delegate: CustomSearchDelegate()))!;
           
          },
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle,
            color: Colors.grey,
          ),
        ),
      ],
      leading: Padding(
          padding: EdgeInsets.fromLTRB(14, 0, 0, 0),
          child: Image.asset('assets/images/youtube.png')),
      backgroundColor: Colors.white,
      title: Text(
        'YouTube',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
