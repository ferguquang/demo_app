import 'package:flutter/material.dart';
import 'package:workflow_manager/storage/models/response/list_user_response.dart';

class UserTabItem extends StatefulWidget {
  int type;
  List<Categories> listUser;

  UserTabItem({Key key, this.type, this.listUser}) : super(key: key);

  @override
  State<UserTabItem> createState() => _UserTabItemState();
}

class _UserTabItemState extends State<UserTabItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listUser.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            widget.listUser[index].isSelected = !widget.listUser[index].isSelected;
            setState(() {

            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            decoration: BoxDecoration(
              color: widget.listUser[index].isSelected ? Colors.lightBlue[50] : Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: widget.listUser[index].isSelected ? Colors.blueAccent : Colors.transparent)
            ),
            child: Row(
              children: [
                Expanded(child: Text("${widget.listUser[index].name}")),
                Icon(Icons.check, color: widget.listUser[index].isSelected ? Colors.blueAccent : Colors.transparent,)
              ],
            ),
          ),
        );
      }
    );
  }
}
