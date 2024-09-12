import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:traval_app/colors.dart';
import 'package:traval_app/widgets/app_text.dart';
import 'package:traval_app/widgets/home_page.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double width;

  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            //that condition for show or text in button
            isResponsive == true
            //app text rap with container for show text in container
                ? Container(
                  margin: EdgeInsets.only(left: 20),
                    child: AppText(
                    text: "Book trip now",
                    color: Colors.white,
                  ))
                : Container(),
            Image.asset("images/button-one.png")
          ],
        ),
      ),
    );
  }
}
