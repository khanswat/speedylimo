import 'package:equatable/equatable.dart';

import '../../../data/models/revenue_detail_Model.dart';

class IpDetailState extends Equatable {
  const IpDetailState();

  @override
  List<Object> get props => [];
}

class IpDetailInitial extends IpDetailState {}

class IpDetailError extends IpDetailState {
  final String message;
  IpDetailError(this.message);
}

class IpDetailLoaded extends IpDetailState {
  final List<OpDetaildata> ipdetaildata;
  IpDetailLoaded(this.ipdetaildata);
  @override
  List<Object> get props => [ipdetaildata];
}
