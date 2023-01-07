import 'package:flutter/material.dart';

import '../../shared/ui_helpers.dart';

class RadioModel {
  bool isSelected;
  final IconData icon;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.icon, this.buttonText, this.text);
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  const RadioItem(this._item, {super.key});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
          top: UIHelper.HorizontalSpaceSmall,
          bottom: UIHelper.HorizontalSpaceSmall),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color:_item.isSelected?const Color.fromARGB(255, 135, 163, 213): const Color(0xffEEF1F4),
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                  height: 64.0,
                  width: 64.0,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    _item.icon,
                    color: Colors.white,
                  )),
            ),
            Expanded(
              child: Padding(
              padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_item.buttonText),
                    Text(_item.text),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
