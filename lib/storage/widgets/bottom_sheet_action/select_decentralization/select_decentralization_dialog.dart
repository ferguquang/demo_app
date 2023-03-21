import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'select_decentralization_item.dart';
import 'select_decentralization_repository.dart';

class SelectDecentralizationDialog extends StatefulWidget {
  const SelectDecentralizationDialog({Key key}) : super(key: key);

  @override
  State<SelectDecentralizationDialog> createState() => _SelectDecentralizationDialogState();
}

class _SelectDecentralizationDialogState extends State<SelectDecentralizationDialog> {
  SelectDecentralizationRepository _repository = SelectDecentralizationRepository();

  @override
  void initState() {
    super.initState();

    _repository.getListDecentralization();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _repository,
      child: Consumer(
        builder: (context, SelectDecentralizationRepository repository, _) {
          return Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text("Chọn quyền"),
                ),
                SelectDecentralizationItem(
                  model: DecentralizationModel(
                    label: "Tất cả quyền",
                    isActive: repository.isAllDecentralization
                  ),
                  onClickListener: (item) {
                    repository.setAllDecentralization();
                  },
                ),
                ListView.builder(
                  itemCount: repository.listDecentralization.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return SelectDecentralizationItem(
                      model: repository.listDecentralization[index],
                      onClickListener: (item) {
                        repository.updateItem(item);
                      },
                    );
                  }
                ),
                Row(
                  children: [
                    Checkbox(
                      value: repository.isAdditional,
                      onChanged: (value) {
                        repository.updateIsAdditional(value);
                      }
                    ),
                    Expanded(child: Text("Bổ sung các quyền cho tất cả các thư mục bên trong"))
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: repository.isRemove,
                      onChanged: (value) {
                        repository.updateIsRemove(value);
                      }
                    ),
                    Expanded(child: Text(
                      "Gỡ bỏ các quyền đã thiết lập ở thư mục bên trong",
                      style: TextStyle(
                        color: Colors.red
                      ),
                    ))
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                        Radius.circular(5.0)
                    ),
                  ),
                  child: Center(
                      child: Text(
                        "Tiếp theo",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      )
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
