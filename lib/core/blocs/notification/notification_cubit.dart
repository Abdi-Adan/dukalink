import 'package:dukalink_app/core/blocs/notification/notification_state.dart';
import 'package:dukalink_app/core/data/model/notification_model.dart';
import 'package:dukalink_app/core/data/repository/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository notificationRepository;

  NotificationCubit({
    required this.notificationRepository,
  }) : super(const NotificationState.init());

  void getNotifications() async {
    try {
      emit(const NotificationState.loading());

      // final eitherResponse = await notificationRepository.getNotification();
      List<Notification> res = [
        Notification(
          title: 'Payment',
          subtitle: 'Another payment on the way',
          body: 'dukalink is ready to serve you whenever you want',
          isRead: false,
        ),
        Notification(
          title: 'Payment',
          subtitle: 'Another payment on the way',
          body: 'dukalink is ready to serve you whenever you want',
          isRead: true,
        ),
        Notification(
          title: 'Payment',
          subtitle: 'Another payment on the way',
          body: 'dukalink is ready to serve you whenever you want',
          isRead: false,
        )
      ];
      emit(NotificationState.success(
        res,
      ));
      // emit(
      //   eitherResponse.fold(
      //     (l) {
      //       return NotificationState.error(l.message ??
      //           l.detail ??
      //           'Unable to fetch make payment at the moment. Try later');
      //     },
      //     (r) {
      //       return NotificationState.success(
      //         r,
      //       );
      //     },
      //   ),
      // );
    } catch (e) {
      emit(NotificationState.error(e.toString()));
    }
  }
}
