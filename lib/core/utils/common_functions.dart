import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onefan_app/core/constants/app_colors.dart';
import 'package:onefan_app/core/constants/app_text_styles.dart';

enum MessageType {
  error(color: AppColors.error, icon: Icon(Icons.close), message: "Something went wrong"),
  success(color: AppColors.success, icon: Icon(Icons.check), message: "Successful"),
  info(color: AppColors.info, icon: Icon(Icons.info), message: "Info");

  const MessageType({required this.color, required this.icon, required this.message});

  final Color color;
  final Icon icon;
  final String message;
}

class CommonFunctions {
  static final FToast _fToast = FToast();

  static void showToastMessage({
    required BuildContext context,
    String? message,
    Color? messageColor,
    Color? backgroundColor,
    Icon? icon,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration toastDuration = const Duration(seconds: 2),
    MessageType messageType = MessageType.error,
  }) {
    _fToast.init(context);

    _fToast.removeQueuedCustomToasts();

    SemanticsService.announce(
      message ?? "Something went wrong",
      TextDirection.ltr,
    );

    _fToast.showToast(
      child: Semantics(
        label: message ?? "Something went wrong",
        excludeSemantics: true,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor ?? messageType.color,
          ),
          child: Row(
            children: [
              icon ?? messageType.icon,
              const SizedBox(width: 12.0),
              Flexible(
                child: Text(
                  message ?? messageType.message,
                  style: AppTextStyles.interMediumMd,
                ),
              ),
            ],
          ),
        ),
      ),
      gravity: gravity,
      toastDuration: toastDuration,
    );
  }
}
