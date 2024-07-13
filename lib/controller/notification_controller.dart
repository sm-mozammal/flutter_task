import 'package:get/get.dart';

class NotificationController extends GetxController {
  // Private Fields
  RxBool _isNewNotification = false.obs;
  RxList<String> _notifications = <String>[].obs;

  // Getters
  bool get isNewNotification => _isNewNotification.value;
  List<String> get notifications => _notifications;

  // Setter (add notification)
  void addNotification(String name, String category, String date, String location, String description) {
    String notificationMessage = 'New event added:\n'
        'Name: $name\n'
        'Category: $category\n'
        'Date: $date\n'
        'Location: $location\n'
        'Description: $description';
    
    _notifications.insert(0, notificationMessage); // Insert at the beginning of the list
    _isNewNotification.value = true; // Set isNewNotification to true
    update();
  }

  // Method to remove a notification
  void removeNotification(int index) {
    _notifications.removeAt(index);
    update();
  }

  // Method to mark notifications as read
  void markNotificationsAsRead() {
    _isNewNotification.value = false;
    update();
  }
}
