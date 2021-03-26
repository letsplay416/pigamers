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
        color: kContentColorLightTheme,
        border: Border.all(color: kContentColorDarkTheme.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: kPrimaryColor.withOpacity(0.23),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            "lib/src/assets/svg/search.svg",
            color: kContentColorDarkTheme,
          ),
          SizedBox(
            width: kDefaultPadding * 0.7,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Search",
                prefixStyle: TextStyle(color: kContentColorLightTheme),
                hintStyle: TextStyle(
                  color: kPrimaryColor.withOpacity(0.7),
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
