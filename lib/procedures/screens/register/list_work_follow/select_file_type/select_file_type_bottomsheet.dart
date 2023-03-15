import 'package:flutter/material.dart';

class SelectFileTypeBottomsheet extends StatefulWidget {
  const SelectFileTypeBottomsheet({Key key}) : super(key: key);

  @override
  State<SelectFileTypeBottomsheet> createState() => _SelectFileTypeBottomsheetState();
}

class _SelectFileTypeBottomsheetState extends State<SelectFileTypeBottomsheet> {
  List<SelectFileModel> selectFileModels = [];

  @override
  void initState() {
    super.initState();
    selectFileModels.add(SelectFileModel(fileType: "PDF"));
    selectFileModels.add(SelectFileModel(fileType: "Excel"));
    selectFileModels.add(SelectFileModel(fileType: "Docx "));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListView.builder(
            itemCount: selectFileModels.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  String type = selectFileModels[index].fileType;
                  selectFileModels.forEach((element) {
                    element.isSelected = type == element.fileType;
                  });

                  setState(() {

                  });
                },
                child: _itemWidget(model: selectFileModels[index]),
              );
            }
          ),
          Container(
            width: double.infinity,
            child: ButtonTheme(
              height: 50,
              child: FlatButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                textColor: Colors.white,
                child: Text(
                  'Đăng nhập'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onPressed: () {

                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemWidget({SelectFileModel model}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(Icons.ac_unit),
          Expanded(child: Text("${model.fileType}")),
          Icon(Icons.check, color: model.isSelected ? Colors.blue : Colors.transparent,)
        ],
      ),
    );
  }
}


class SelectFileModel {
  String fileType;
  bool isSelected = false;

  SelectFileModel({this.fileType, this.isSelected = false});
}