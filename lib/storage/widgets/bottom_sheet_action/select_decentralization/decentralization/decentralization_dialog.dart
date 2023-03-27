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

    for (int i = 0; i< widget.repository.stgFileShareResponse.data.stgDocShareDepts.length; i++) {
      int idDeptSelected = widget.repository.stgFileShareResponse.data.stgDocShareDepts[i].iDUserOrDeptOrTeam;
      for (int j = 0; j < widget.repository.deptList.length; j++) {
        int idDept = widget.repository.deptList[j].iD;
        if (idDept == idDeptSelected) {
          widget.repository.deptList[j].isSelected = true;
        }
      }
    }

    for (int i = 0; i< widget.repository.stgFileShareResponse.data.stgDocShareTeams.length; i++) {
      int idTeamSelected = widget.repository.stgFileShareResponse.data.stgDocShareTeams[i].iDUserOrDeptOrTeam;
      for (int j = 0; j < widget.repository.teamList.length; j++) {
        int idTeam = widget.repository.teamList[j].iD;
        if (idTeam == idTeamSelected) {
          widget.repository.teamList[j].isSelected = true;
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


              if (widget.repository.listDecentralization[0].isActive) {
                params["ViewIDPublic1"] = 1;
              }

              if (widget.repository.listDecentralization[1].isActive) {
                params["UpdateIDPublic1"] = 1;
              }

              if (widget.repository.listDecentralization[2].isActive) {
                params["DeleteIDPublic1"] = 1;
              }

              if (widget.repository.listDecentralization[3].isActive) {
                params["CreateIDPublic1"] = 1;
              }

              if (widget.repository.listDecentralization[4].isActive) {
                params["CopyIDPublic1"] = 1;
              }

              if (widget.repository.listDecentralization[5].isActive) {
                params["DownloadIDPublic1"] = 1;
              }

              if (widget.repository.listDecentralization[6].isActive) {
                params["MoveIDPublic1"] = 1;
              }

              if (widget.repository.listDecentralization[7].isActive) {
                params["ShareIDPublic1"] = 1;
              }

              // if (widget.repository.isAllUser) {
              //   params["IDPublic"] = 1;
              // }
              params["IDPublic"] = 1;

              List<String> idUsers = [], idDepts = [], idTeams = [];
              widget.repository.accountUsers.forEach((element) {
                if (element.isSelected) {
                  idUsers.add("${element.iD}");
                }
              });
              if (idUsers.isNotEmpty) {
                params["IDUser"] = idUsers.join(",");
              }
              idUsers.forEach((element) {
                if (widget.repository.listDecentralization[0].isActive) {
                  params["ViewIDUser$element"] = 1;
                }

                if (widget.repository.listDecentralization[1].isActive) {
                  params["UpdateIDUser$element"] = 1;
                }

                if (widget.repository.listDecentralization[2].isActive) {
                  params["DeleteIDUser$element"] = 1;
                }

                if (widget.repository.listDecentralization[3].isActive) {
                  params["CreateIDUser$element"] = 1;
                }

                if (widget.repository.listDecentralization[4].isActive) {
                  params["CopyIDUser$element"] = 1;
                }

                if (widget.repository.listDecentralization[5].isActive) {
                  params["DownloadIDUser$element"] = 1;
                }

                if (widget.repository.listDecentralization[6].isActive) {
                  params["MoveIDUser$element"] = 1;
                }

                if (widget.repository.listDecentralization[7].isActive) {
                  params["ShareIDUser$element"] = 1;
                }
                // params["ViewIDUser$element"] = 1;
              });

              widget.repository.deptList.forEach((element) {
                if (element.isSelected) {
                  idDepts.add("${element.iD}");
                }
              });
              if (idDepts.isNotEmpty) {
                params["IDDept"] = idDepts.join(",");
              }
              idDepts.forEach((element) {
                if (widget.repository.listDecentralization[0].isActive) {
                  params["ViewIDDept$element"] = 1;
                }

                if (widget.repository.listDecentralization[1].isActive) {
                  params["UpdateIDDept$element"] = 1;
                }

                if (widget.repository.listDecentralization[2].isActive) {
                  params["DeleteIDDept$element"] = 1;
                }

                if (widget.repository.listDecentralization[3].isActive) {
                  params["CreateIDDept$element"] = 1;
                }

                if (widget.repository.listDecentralization[4].isActive) {
                  params["CopyIDDept$element"] = 1;
                }

                if (widget.repository.listDecentralization[5].isActive) {
                  params["DownloadIDDept$element"] = 1;
                }

                if (widget.repository.listDecentralization[6].isActive) {
                  params["MoveIDDept$element"] = 1;
                }

                if (widget.repository.listDecentralization[7].isActive) {
                  params["ShareIDDept$element"] = 1;
                }
              });

              widget.repository.teamList.forEach((element) {
                if (element.isSelected) {
                  idTeams.add("${element.iD}");
                }
              });
              if (idTeams.isNotEmpty) {
                params["IDTeam"] = idTeams.join(",");
              }
              idTeams.forEach((element) {
                // params["ViewIDTeam$element"] = 1;
                if (widget.repository.listDecentralization[0].isActive) {
                  params["ViewIDTeam$element"] = 1;
                }

                if (widget.repository.listDecentralization[1].isActive) {
                  params["UpdateIDTeam$element"] = 1;
                }

                if (widget.repository.listDecentralization[2].isActive) {
                  params["DeleteIDTeam$element"] = 1;
                }

                if (widget.repository.listDecentralization[3].isActive) {
                  params["CreateIDTeam$element"] = 1;
                }

                if (widget.repository.listDecentralization[4].isActive) {
                  params["CopyIDTeam$element"] = 1;
                }

                if (widget.repository.listDecentralization[5].isActive) {
                  params["DownloadIDTeam$element"] = 1;
                }

                if (widget.repository.listDecentralization[6].isActive) {
                  params["MoveIDTeam$element"] = 1;
                }

                if (widget.repository.listDecentralization[7].isActive) {
                  params["ShareIDTeam$element"] = 1;
                }
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
