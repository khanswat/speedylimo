import 'dart:io';

abstract class RegisterDriverEvent {}

class DriverEvent extends RegisterDriverEvent {
  final File vehicleinsurance;
  final File vehicleregistration;
  final File license;
  final File photo;
  final File drugtest;
  final String name;
  final String email;
  final String password;
  final String confirmpassword;
  final String phone;

  DriverEvent(
      this.vehicleinsurance,
      this.vehicleregistration,
      this.drugtest,
      this.license,
      this.photo,
      this.name,
      this.email,
      this.confirmpassword,
      this.password,
      this.phone);
}
