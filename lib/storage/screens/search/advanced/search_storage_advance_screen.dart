import 'package:flutter/material.dart';

class SearchStorageAdvanceScreen extends StatefulWidget {
  const SearchStorageAdvanceScreen({Key key}) : super(key: key);

  @override
  State<SearchStorageAdvanceScreen> createState() => _SearchStorageAdvanceScreenState();
}

class _SearchStorageAdvanceScreenState extends State<SearchStorageAdvanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tìm kiếm nâng cao"),
                  Icon(Icons.image_search_rounded)
                ],
              ),
            ),
            Icon(Icons.image, color: Colors.transparent,)
          ],
        ),
      ),
      body: Column(
        children: [
          _item(label: "Loại hồ sơ"),
          _item(label: "Loại hồ sơ"),
        ],
      ),
    );
  }

  Widget _item({String label}) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.image_search_rounded),
          Text("$label"),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
