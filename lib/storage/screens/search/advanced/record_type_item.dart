import 'package:flutter/material.dart';
import 'package:workflow_manager/storage/models/response/get_list_record_type_response.dart';

class RecordTypeItem extends StatelessWidget {
  RecordTypes model;
  int index;

  RecordTypeItem({Key key, this.model, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.image_search_rounded),
          Text("${model.name}"),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
