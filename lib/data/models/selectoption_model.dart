import 'package:equatable/equatable.dart';

class SelectOption extends Equatable {
  final int id;
  var name;

  SelectOption(this.id, this.name);

  @override
  List<Object> get props => [id, name];
}
