import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class Noti {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/logo',
      [
        NotificationChannel(
            channelGroupKey: 'high_importance_channel',
            channelKey: 'high_importance_channel',
            channelName: 'FloatStack Notification System',
            channelDescription: 'float_stack_notification_system',
            defaultColor: primary,
            ledColor: Colors.white,
            importance: NotificationImportance.Max,
            channelShowBadge: true,
            onlyAlertOnce: true,
            playSound: true,
            criticalAlerts: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'high_importance_channel_group',
            channelGroupName: 'Group 1')
      ],
      debug: true,
    );
    await AwesomeNotifications().isNotificationAllowed().then(
        (isAllowed) async {
          if(!isAllowed){
            await AwesomeNotifications().requestPermissionToSendNotifications();
          }
        }
    );

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onNotiReceive,
      onDismissActionReceivedMethod: onNotiDismiss,
      onNotificationCreatedMethod: onNotiCreated,
      onNotificationDisplayedMethod: onNotiDisplay,
    );

  }

  static Future<void> onNotiCreated(ReceivedNotification receivedNotification) async{
    debugPrint('NotiCreated 24/7');
  }

  static Future<void> onNotiDisplay(ReceivedNotification receivedNotification) async{
    debugPrint('NotiDisplay 24/7');
  }

  static Future<void> onNotiDismiss(ReceivedAction receivedAction) async{
    debugPrint('NotiDismiss 24/7');
  }

  static Future<void> onNotiReceive(ReceivedAction receivedAction) async{
    debugPrint('NotiReceive 24/7');
  }

  static Future<void> showNoti({
    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigPicture,
   final List<NotificationActionButton>? actionButtons,
    final bool scheduled = false,
    final Duration? interval,
  }) async {
    assert(!scheduled || (scheduled && interval != null));

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: -1,
            channelKey: 'high_importance_channel',
            title: title,
            body: body,
            actionType: actionType,
            notificationLayout: notificationLayout,
            summary: summary,
            category: category,
            payload: payload,
            bigPicture: bigPicture,
        ),
      actionButtons: actionButtons,
      schedule: scheduled
        ? NotificationInterval(
        interval: interval,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        preciseAlarm: true,
      ) : null,
    );
}

}