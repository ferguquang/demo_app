import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workflow_manager/base/utils/common_function.dart';
import 'package:workflow_manager/storage/models/params/storage_index_request.dart';
import 'package:workflow_manager/storage/models/response/get_record_field_settings_by_id_type_response.dart';
import 'package:workflow_manager/storage/screens/list_storage/list_storage_screen.dart';
import 'package:workflow_manager/storage/screens/search/advanced/child/item/child_multi_type_item.dart';
import 'package:workflow_manager/storage/screens/tabs/main_tab_storage_screen.dart';

import 'child_multi_type_search_repository.dart';

class ChildMultiTypeSearchScreen extends StatefulWidget {
  String idType;
  bool isRecordType = false;

  ChildMultiTypeSearchScreen({Key key, this.idType, this.isRecordType}) : super(key: key);

  @override
  State<ChildMultiTypeSearchScreen> createState() => _ChildMultiTypeSearchScreenState();
}

class _ChildMultiTypeSearchScreenState extends State<ChildMultiTypeSearchScreen> {
  ChildMultiTypeSearchRepository _repository = ChildMultiTypeSearchRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repository.isRecordType = widget.isRecordType;
    _repository.getData(idType: widget.idType);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _repository,
      child: Consumer(
        builder: (context, ChildMultiTypeSearchRepository repository, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Tìm kiếm nâng cao"),
            ),
            body: ListView.builder(
                itemCount: repository.fieldSettings.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ChildMultiTypeSearchItem(
                      model: repository.fieldSettings[index],
                    ),
                  );
                }
            ),
            // body: Column(
            //   children: [
            //     Expanded(
            //       child: ListView.builder(
            //         itemCount: repository.fieldSettings.length,
            //         shrinkWrap: true,
            //         itemBuilder: (context, index) {
            //           return Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            //             child: ChildMultiTypeSearchItem(
            //               model: repository.fieldSettings[index],
            //             ),
            //           );
            //         }
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         for (int i = 0; i < repository.fieldSettings.length; i++) {
            //           if (repository.fieldSettings[i].isCatalog) {
            //
            //           } if (repository.fieldSettings[i].datatype == "datetime" || repository.fieldSettings[i].datatype == "dcdatetime") {
            //
            //           } else {
            //             repository.fieldSettings[i].value = repository.fieldSettings[i].textEditingController.text;
            //           }
            //         }
            //
            //         print("object");
            //         pushPage(
            //           context,
            //           ListStorageScreen(
            //             typeStorage: StorageTopTabType.Document,
            //             type: StorageBottomTabType.DataStorage,
            //             searchAdvanceParams: SearchAdvanceParams(
            //               searchAdvanceList: repository.fieldSettings,
            //               isTypeSearchRecord: repository.fieldSettings.first.iDType,
            //               idDoctype: repository.fieldSettings.first.iDType == 0 ? "${widget.idType}" : 0,
            //               idRecordType: repository.fieldSettings.first.iDType == 1 ? "${widget.idType}" : 0,
            //             ),
            //           ));
            //       },
            //       child: Container(
            //         padding: EdgeInsets.all(8),
            //         margin: EdgeInsets.all(16),
            //         decoration: BoxDecoration(
            //           color: Colors.lightBlueAccent,
            //           borderRadius: BorderRadius.all(
            //             Radius.circular(5.0)
            //           ),
            //         ),
            //         child: Row(
            //           children: [
            //             Expanded(
            //               child: Center(
            //                 child: Text(
            //                   "Tìm kiếm hồ sơ",
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.bold
            //                   ),
            //                 )
            //               )
            //             ),
            //             Icon(
            //               Icons.search,
            //               color: Colors.white,
            //             )
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
