import 'package:flutter/material.dart';

import 'select_decentralization_repository.dart';

class SelectDecentralizationItem extends StatefulWidget {
  DecentralizationModel model;
  Function(DecentralizationModel) onClickListener;

  SelectDecentralizationItem({Key key, this.model, this.onClickListener}) : super(key: key);

  @override
  State<SelectDecentralizationItem> createState() => _SelectDecentralizationItemState();
}

class _SelectDecentralizationItemState extends State<SelectDecentralizationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text("${widget.model.label}")),
          GestureDetector(
            onTap: () {
              widget.model.isActive = !widget.model.isActive;
              widget.onClickListener(widget.model);
            },
            child: Icon(
              !widget.model.isActive
                  ? Icons.toggle_off
                  : Icons.toggle_on_outlined,
              color: !widget.model.isActive
                  ? Colors.grey
                  : Colors.blue,
              size: 32,
            ),
          )
        ],
      ),
    );
  }
}
