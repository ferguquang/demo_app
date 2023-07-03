import 'package:flutter/material.dart';

class ImageFullScreen extends StatelessWidget {
  String url;

  ImageFullScreen({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        url,
        // fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
