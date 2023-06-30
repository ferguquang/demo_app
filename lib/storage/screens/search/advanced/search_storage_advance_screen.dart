import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:workflow_manager/base/utils/common_function.dart';
import 'package:workflow_manager/storage/models/response/get_list_record_type_response.dart';
import 'package:workflow_manager/storage/screens/search/advanced/child/child_search_item.dart';
import 'package:workflow_manager/storage/screens/search/advanced/record_type_item.dart';

import 'child/child_multi_type_screen.dart';
import 'search_storage_advance_repository.dart';

class SearchStorageAdvanceScreen extends StatefulWidget {
  bool isVisibleSearchRecord = true;
  
  SearchStorageAdvanceScreen({Key key, this.isVisibleSearchRecord}) : super(key: key);

  @override
  State<SearchStorageAdvanceScreen> createState() => _SearchStorageAdvanceScreenState();
}

class _SearchStorageAdvanceScreenState extends State<SearchStorageAdvanceScreen> {
  SearchStorageAdvanceRepository _repository = SearchStorageAdvanceRepository();

  @override
  void initState() {
    super.initState();
    _repository.getRecordTypes();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _repository,
      child: Consumer(
        builder: (context, SearchStorageAdvanceRepository repository, _) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Tìm kiếm nâng cao  "),
                        SvgPicture.asset(
                          'assets/svgs/search_advance.svg',
                          color: Colors.white,
                          height: 24, width: 24,
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.image, color: Colors.transparent,)
                ],
              ),
            ),
            body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Visibility(
                    visible: widget.isVisibleSearchRecord,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            repository.setExpandRecordType();
                          },
                          child: RecordTypeItem(
                            model: RecordTypes(name: "Loại hồ sơ"),
                            index: 1,
                            isExpand: repository.isExpandRecordType,
                          ),
                        ),
                        Visibility(
                            visible: repository.isExpandRecordType,
                            child: ListView.builder(
                                itemCount: repository.recordTypes.length,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      pushPage(context, ChildMultiTypeSearchScreen(
                                        idType: "${repository.recordTypes[index].iD}",
                                        isRecordType: true,
                                      ));
                                    },
                                    child: ChildSearchItem(
                                      model: repository.recordTypes[index],
                                      // index: index,
                                    ),
                                  );
                                }
                            )
                        )
                      ],
                    )
                  ),
                  GestureDetector(
                    onTap: () {
                      repository.setExpandDocType();
                    },
                    child: RecordTypeItem(
                      model: RecordTypes(name: "Loại tài liệu"),
                      index: 2,
                      isExpand: repository.isExpandDocType,
                    ),
                  ),
                  Visibility(
                      visible: repository.isExpandDocType,
                      child: ListView.builder(
                          itemCount: repository.docTypes.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                pushPage(context, ChildMultiTypeSearchScreen(
                                  idType: "${repository.docTypes[index].iD}",
                                  isRecordType: false,
                                ));
                              },
                              child: ChildSearchItem(
                                model: repository.docTypes[index],
                                // index: index,
                              ),
                            );
                          }
                      )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
