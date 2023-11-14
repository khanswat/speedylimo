abstract class userEvent {}

class UserEvent extends userEvent {
  final String update_name;
  final String update_email;

  UserEvent({required this.update_name, required this.update_email});
}
