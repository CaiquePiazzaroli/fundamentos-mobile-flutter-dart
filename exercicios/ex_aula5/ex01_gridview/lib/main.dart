import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: MyGridView()));
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        GridViewItem(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          'Coruja',
        ),
        GridViewItem(
          'https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg',
          'Brown Squirrel',
        ),
        GridViewItem(
          'https://images.pexels.com/photos/792381/pexels-photo-792381.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          'Tiger',
        ),
        GridViewItem(
          'https://images.pexels.com/photos/325045/pexels-photo-325045.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          'Siamese Fighting Fish',
        ),
      ],
    );
  }
}

class GridViewItem extends StatelessWidget {
  late String linkImage;
  late String description;

  GridViewItem(this.linkImage, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Container(
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(linkImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 20,
              color: const Color.fromARGB(122, 0, 0, 0),
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20,
                ),
                child: Text(description, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
