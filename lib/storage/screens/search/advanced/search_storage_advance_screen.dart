import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workflow_manager/storage/screens/search/advanced/record_type_item.dart';

import 'search_storage_advance_repository.dart';

class SearchStorageAdvanceScreen extends StatefulWidget {
  const SearchStorageAdvanceScreen({Key key}) : super(key: key);

  @override
  State<SearchStorageAdvanceScreen> createState() => _SearchStorageAdvanceScreenState();
}

class _SearchStorageAdvanceScreenState extends State<SearchStorageAdvanceScreen> {
  SearchStorageAdvanceRepository _repository = SearchStorageAdvanceRepository();

  @override
  void initState() {
    // TODO: implement initState
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
                        Text("Tìm kiếm nâng cao"),
                        Icon(Icons.image_search_rounded)
                      ],
                    ),
                  ),
                  Icon(Icons.image, color: Colors.transparent,)
                ],
              ),
            ),
            body: ListView.builder(
              itemCount: repository.recordTypes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return RecordTypeItem(
                  model: repository.recordTypes[index],
                  index: index,
                );
              }
            ),
          );
        },
      ),
    );
  }
}
