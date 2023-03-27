import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workflow_manager/base/utils/common_function.dart';
import 'package:workflow_manager/storage/models/params/storage_index_request.dart';
import 'package:workflow_manager/storage/models/response/get_category_by_idcategory_type_response.dart';
import 'package:workflow_manager/storage/models/response/get_record_field_settings_by_id_type_response.dart';
import 'package:workflow_manager/storage/screens/list_storage/list_storage_screen.dart';
import 'package:workflow_manager/storage/screens/search/advanced/child/item/child_multi_type_item.dart';
import 'package:workflow_manager/storage/screens/search/detail/detail_search_storage_screen.dart';
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
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
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
                ),
                GestureDetector(
                  onTap: () {
                    List<String> idCategories = [];
                    for (int i = 0; i < repository.fieldSettings.length; i++) {
                      if (!repository.fieldSettings[i].isCatalog && repository.fieldSettings[i].datatype != "datetime" && repository.fieldSettings[i].datatype != "dcdatetime") {
                        repository.fieldSettings[i].value = repository.fieldSettings[i].textEditingController.text;
                      }

                      if (repository.fieldSettings[i].isCatalog) {
                        if (isNotNullOrEmpty(repository.fieldSettings[i].value)) {
                          idCategories.add(repository.fieldSettings[i].value);
                        }
                      }
                    }

                    StorageIndexRequest request = StorageIndexRequest();
                    request.idDoc = 0;
                    request.take = 99999;
                    request.skip = 0;
                    request.term = "";

                    request.searchAdvanceParams = SearchAdvanceParams(
                      searchAdvanceList: repository.fieldSettings,
                      isTypeSearchRecord: widget.isRecordType ? 1 : 0,
                      idDoctype: !widget.isRecordType ? "${widget.idType}" : "0",
                      idRecordType: widget.isRecordType ? "${widget.idType}" : "0",
                      idCategories: idCategories
                    );
                    pushPage(context, DetailSearchStorageScreen(
                      request, null, null, StorageTopTabType.Document, StorageBottomTabType.DataStorage,
                      isSearchAdvance: true,
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0)
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Tìm kiếm ${widget.isRecordType ? "hồ sơ" : "tài liệu"}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          )
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
