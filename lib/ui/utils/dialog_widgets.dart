import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import 'app_colors.dart';

class DialogWidgets {
  static void showModernDialog(
    BuildContext context, {
    required String title,
    required String message,
    required String buttonText,
    required Function() onTapDismiss,
    Color? color,
    required PanaraDialogType type,
  }) {
    PanaraInfoDialog.showAnimatedGrow(
      barrierDismissible: false,
      padding: EdgeInsets.all(10),
      context,
      title: title,
      message: message,
      buttonText: buttonText,
      onTapDismiss: () {
        Navigator.pop(context);
        onTapDismiss();

      },
      panaraDialogType: type,
      buttonTextColor: Colors.black,
    );
  }

  static void showLoading(
      {required BuildContext context,
      required String massage,
      bool isDismissible = true}) {
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(massage)
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      bool isDismissible = false,
      required String massage,
      String? title,
      String? posActionName,
      Function? posAction,
      String? nagActionName,
      Function? nagAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (posAction != null) {
                posAction.call(context);
              }
              // posAction?.call();
            },
            child: Text(
              posActionName,
              style: TextStyle(color: Colors.green, fontSize: 20),
            )),
      );
    }
    if (nagActionName != null) {
      actions.add(
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              // if(nagAction!=null){
              //    nagAction.call();
              // }
              nagAction?.call();
            },
            child: Text(
              nagActionName,
              style: TextStyle(color: Colors.green),
            )),
      );
    }
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(massage),
            title: Text(title ?? ""),
            actions: actions,
            icon: Icon(
              Icons.info,
              size: 100,
              color: AppColors.greyColor,
            ),
            contentTextStyle: Theme.of(context).textTheme.titleMedium,
          );
        });
  }
}
