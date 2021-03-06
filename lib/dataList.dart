import 'package:flutter/material.dart';
import 'package:kk_advice/dataCard.dart';
import 'package:kk_advice/dataValues.dart';
import 'package:kk_advice/itemData.dart';

class DataListWidget extends StatelessWidget {
  DataListWidget({
    Key key,
    @required this.itemDataList,
    @required this.textStyle,
  }) : super(key: key);

  final List<ItemData> itemDataList;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    List<ItemData> temp = [];
    List<Widget> widgets = [];
    String title = '';
    var dataCardWidget;
    if (itemDataList != null && itemDataList.length > 0) {
      var last = itemDataList.last;
      var count =1;
      itemDataList.forEach((element) {
        if (title == '') {
          title = element.title;
        }
        if (title == element.title) {
          element.refIcon = DataValues.buildCountIcon(count++, element);
                    temp.add(element);
                  }
                  if ((title != element.title) || element == last) {
                    dataCardWidget = DataCardWidget(itemList: temp, textStyle: textStyle,);
                    widgets.add(dataCardWidget);
                    temp = [];
                    title = element.title;
                    temp.add(element);
                  }
                });
              }
              return Column(
                children: widgets,
              );
            }
}
