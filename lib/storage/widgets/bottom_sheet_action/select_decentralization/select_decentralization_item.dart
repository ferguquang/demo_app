import 'package:flutter/material.dart';

import 'select_decentralization_repository.dart';

class SelectDecentralizationItem extends StatefulWidget {
  DecentralizationModel model;
  Function(DecentralizationModel) onClickListener;
  bool hasColorBackground;

  SelectDecentralizationItem({Key key, this.model, this.onClickListener, this.hasColorBackground = false}) : super(key: key);

  @override
  State<SelectDecentralizationItem> createState() => _SelectDecentralizationItemState();
}

class _SelectDecentralizationItemState extends State<SelectDecentralizationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: widget.hasColorBackground ? BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(5))
            ) : null,
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
          ),
          Divider(height: 1,)
        ],
      ),
    );
  }
}
