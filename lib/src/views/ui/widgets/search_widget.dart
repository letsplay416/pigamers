import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pigamers/src/views/utils/constants.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor.withOpacity(0.2),
        border:
            Border.all(color: Theme.of(context).accentColor.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 1,
            color: Theme.of(context).primaryColor.withOpacity(0.23),
          ),
          BoxShadow(
            offset: Offset(0, 0),
            // blurRadius: 10,
            color: Theme.of(context).backgroundColor,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "lib/src/assets/svg/search.svg",
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: kDefaultPadding * 0.7,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Search",
                prefixStyle:
                    TextStyle(color: Theme.of(context).backgroundColor),
                hintStyle: TextStyle(
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
