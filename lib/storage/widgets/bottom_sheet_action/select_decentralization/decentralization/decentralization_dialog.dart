import 'package:flutter/material.dart';
import 'package:workflow_manager/base/models/base_response.dart';
import 'package:workflow_manager/base/network/api_caller.dart';
import 'package:workflow_manager/base/network/app_url.dart';
import 'package:workflow_manager/base/ui/toast_view.dart';
import 'package:workflow_manager/storage/models/response/done_shared_response.dart';
import 'package:workflow_manager/storage/models/response/list_user_response.dart';
import 'package:workflow_manager/storage/widgets/bottom_sheet_action/select_decentralization/select_decentralization_item.dart';
import 'package:workflow_manager/storage/widgets/bottom_sheet_action/select_decentralization/select_decentralization_repository.dart';

import 'user_tab_item.dart';

class DecentralizationDialog extends StatefulWidget {
  SelectDecentralizationRepository repository;
  Function() onCallBack;

  DecentralizationDialog({Key key, this.repository, this.onCallBack}) : super(key: key);

  @override
  State<DecentralizationDialog> createState() => _DecentralizationDialogState();
}

class _DecentralizationDialogState extends State<DecentralizationDialog> with AutomaticKeepAliveClientMixin {
  final List<Tab> tabs = <Tab>[
    Tab(
      child: Text(
        'Người dùng',
      ),
    ),
    Tab(
      text: 'Phòng ban',
    ),
    Tab(
      text: 'Nhóm',
    )
  ];

  @override
  void initState() {
    super.initState();

    setSelectedData();
  }

  void setSelectedData() {
    for (int i = 0; i < widget.repository.stgFileShareResponse.data.stgDocShareUsers.length; i++) {
      int idUserSelected = widget.repository.stgFileShareResponse.data.stgDocShareUsers[i].iDUserOrDeptOrTeam;
      for (int j = 0; j < widget.repository.accountUsers.length; j++) {
        int idUser = widget.repository.accountUsers[j].iD;
        if (idUserSelected == idUser) {
          widget.repository.accountUsers[j].isSelected = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }
                ),
                Text("Chọn đối tượng", style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
          SelectDecentralizationItem(
            model: DecentralizationModel(
                label: "Tất cả mọi người",
                isActive: widget.repository.isAllUser,
            ),
            hasColorBackground: true,
            onClickListener: (item) {
              setState(() {
                widget.repository.isAllUser = !widget.repository.isAllUser;
              });
            },
          ),
          SizedBox(
            height: 500,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: TabBar(
                  isScrollable: false,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: this.tabs,
                  onTap: _onItemTapped,
                ),
                body: TabBarView(
                  // controller: _tabController,
                  children: [
                    UserTabItem(
                      listUser: widget.repository.accountUsers,
                    ),
                    UserTabItem(
                      listUser: widget.repository.deptList,
                    ),
                    UserTabItem(
                      listUser: widget.repository.teamList,
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Map<String, dynamic> params = Map();
              params["ID"] = widget.repository.stgFileShareResponse.data.stgdoc.iD;
              params["IDPublic"] = widget.repository.isAllUser ? 1 : 0;
              params["ViewIDPublic1"] = widget.repository.listDecentralization[0].isActive ? 1 : 0;
              params["UpdateIDPublic1"] = widget.repository.listDecentralization[1].isActive ? 1 : 0;
              params["DeleteIDPublic1"] = widget.repository.listDecentralization[2].isActive ? 1 : 0;
              params["CreateIDPublic1"] = widget.repository.listDecentralization[3].isActive ? 1 : 0;
              params["CopyIDPublic1"] = widget.repository.listDecentralization[4].isActive ? 1 : 0;
              params["DownloadIDPublic1"] = widget.repository.listDecentralization[5].isActive ? 1 : 0;
              params["MoveIDPublic1"] = widget.repository.listDecentralization[6].isActive ? 1 : 0;
              params["ShareIDPublic1"] = widget.repository.listDecentralization[7].isActive ? 1 : 0;

              List<String> idUsers = [], idDepts = [], idTeams = [];
              widget.repository.accountUsers.forEach((element) {
                idUsers.add("${element.iD}");
              });
              params["IDUser"] = idUsers.join(",");
              idUsers.forEach((element) {
                params["ViewIDUser$element"] = 1;
              });

              widget.repository.deptList.forEach((element) {
                idDepts.add("${element.iD}");
              });
              params["IDDept"] = idDepts.join(",");
              idDepts.forEach((element) {
                params["ViewIDDept$element"] = 1;
              });

              widget.repository.teamList.forEach((element) {
                idTeams.add("${element.iD}");
              });
              params["IDTeam"] = idTeams.join(",");
              idTeams.forEach((element) {
                params["ViewIDTeam$element"] = 1;
              });

              params["IsAppliedAll"] = widget.repository.isAdditional ? 1 : 0;
              params["IsResetAll"] = widget.repository.isRemove ? 1 : 0;

              var json = await ApiCaller.instance.postFormData2(AppUrl.stgFileShared, params);

              DoneSharedResponse response = DoneSharedResponse.fromJson(json);
              if (response.status == 1) {
                if (response.data.success) {
                  widget.onCallBack();
                  ToastMessage.show(response.messages.first, ToastStyle.success);
                  Navigator.of(context).pop(true);
                } else {
                  ToastMessage.show(response.messages.first, ToastStyle.error);
                }
              } else {
                ToastMessage.show(response.messages.first, ToastStyle.error);
              }
            },
            child: Container(
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
                    "Phân quyền",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }
}
