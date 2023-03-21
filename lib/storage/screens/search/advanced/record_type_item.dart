import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workflow_manager/storage/models/response/get_list_record_type_response.dart';

class RecordTypeItem extends StatelessWidget {
  RecordTypes model;
  int index;
  bool isExpand;

  RecordTypeItem({Key key, this.model, this.index, this.isExpand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: (index % 2 == 1) ? Colors.orange : Colors.lightBlueAccent,
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),
      ),
      child: Row(
        children: [
          (index % 2 == 1) ?
          SvgPicture.asset(
            'assets/svgs/ic-index2.svg',
            height: 24, width: 24,
          ) :
          SvgPicture.asset(
            'assets/svgs/ic-index1.svg',
            height: 24, width: 24,
          ),
          Expanded(
            child: Center(
              child: Text(
                "${model.name}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
            )
          ),
          Icon(
            isExpand ? Icons.keyboard_arrow_down : Icons.chevron_right,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
