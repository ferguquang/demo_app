import 'package:flutter/material.dart';
import 'package:workflow_manager/base/ui/date_time_picker_widget.dart';
import 'package:workflow_manager/base/utils/app_constant.dart';
import 'package:workflow_manager/base/utils/common_function.dart';
import 'package:workflow_manager/storage/models/response/get_record_field_settings_by_id_type_response.dart';

enum SearchAdvanceType {
  text,
  number,
  datetime,
  catalog
}

class ChildMultiTypeSearchItem extends StatefulWidget {
  RecordFieldSettings model;

  ChildMultiTypeSearchItem({Key key, this.model}) : super(key: key);

  @override
  State<ChildMultiTypeSearchItem> createState() => _ChildMultiTypeSearchItemState();
}

class _ChildMultiTypeSearchItemState extends State<ChildMultiTypeSearchItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.model.isCatalog) {
      return Text("catalog");
    }
    switch (widget.model.datatype) {
      case "dctext":
      case "text":
      case "fcdecimal":
      case "decimal":
      case "dcnumber":
      case "number":
      case "dccustom":
      case "custom":
        return _textField();
      case "dcdatetime":
      case "datetime": {
        return _dateTimeField();
      }
      case "dcselect":
      case "select":
        return Text("select");
    }

    return SizedBox();
  }

  Widget _dateTimeField() {
    return GestureDetector(
      onTap: () {
        DateTimePickerWidget(
          format: Constant.ddMMyyyy,
          context: context,
          onDateTimeSelected: (valueDate) {
            setState(() {
              widget.model.value = valueDate;
            });
          }
        ).showOnlyDatePicker();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Text("${widget.model.title}"),
            Expanded(
              child: Text(
                "${isNotNullOrEmpty(widget.model.value) ? widget.model.value : ""}",
                textAlign: TextAlign.right,
              )
            ),
            const SizedBox(width: 8,),
            Icon(Icons.date_range, color: Colors.grey,)
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return TextField(
      keyboardType: _getTextInputType(),
      controller: widget.model.textEditingController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        hintText: widget.model.title,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300], width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  TextInputType _getTextInputType() {
    if (widget.model.datatype == "number" || widget.model.datatype == "dcnumber" || widget.model.datatype == "fcdecimal" || widget.model.datatype == "decimal") {
      return TextInputType.number;
    }

    return null;
  }
}
