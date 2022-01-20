import 'package:flutter/material.dart';
import './components/body.dart';

class FilteersScreen extends StatelessWidget {
  const FilteersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
        ),
        body: const Body());
  }
}
