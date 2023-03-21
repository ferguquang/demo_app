import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workflow_manager/storage/models/response/get_list_record_type_response.dart';

class ChildSearchItem extends StatelessWidget {
  RecordTypes model;

  ChildSearchItem({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          //ic-record-type
          SvgPicture.asset(
            'assets/svgs/ic-record-type.svg',
            height: 24, width: 24,
          ),
          const SizedBox(width: 8,),
          Text("${model.name}")
        ],
      ),
    );
  }
}
