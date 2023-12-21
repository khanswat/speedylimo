// To parse this JSON data, do
//
//     final bookNowModel = bookNowModelFromMap(jsonString);

import 'dart:convert';

BookNowModel bookNowModelFromMap(String str) =>
    BookNowModel.fromMap(json.decode(str));

String bookNowModelToMap(BookNowModel data) => json.encode(data.toMap());

class BookNowModel {
  final int? status;
  final dynamic message;
  final BooknowData? data;

  BookNowModel({
    this.status,
    this.message,
    this.data,
  });

  BookNowModel copyWith({
    int? status,
    dynamic message,
    BooknowData? data,
  }) =>
      BookNowModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BookNowModel.fromMap(Map<String, dynamic> json) => BookNowModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] == null ? null : BooknowData.fromMap(json['data']),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.toMap(),
      };
}

class BooknowData {
  final int? passengerId;
  final dynamic driverId;
  final DateTime? date;
  final dynamic waypoint;
  final dynamic pickupLocation;
  final dynamic dropoffLocation;
  final dynamic asDirected;
  final dynamic time;
  final dynamic latLong;
  final dynamic nextDay;
  final dynamic pickupTime;
  final dynamic passenger;
  final dynamic bags;
  final dynamic bookingType;
  final int? bookingStatus;
  final dynamic paymentId;
  final int? paymentStatus;
  final dynamic specialInstruction;
  final dynamic totalTripTime;
  final dynamic totalTripMiles;
  final dynamic totalTripAmount;

  BooknowData({
    this.passengerId,
    this.driverId,
    this.date,
    this.waypoint,
    this.pickupLocation,
    this.dropoffLocation,
    this.asDirected,
    this.time,
    this.latLong,
    this.nextDay,
    this.pickupTime,
    this.passenger,
    this.bags,
    this.bookingType,
    this.bookingStatus,
    this.paymentId,
    this.paymentStatus,
    this.specialInstruction,
    this.totalTripTime,
    this.totalTripMiles,
    this.totalTripAmount,
  });

  BooknowData copyWith({
    int? passengerId,
    dynamic driverId,
    DateTime? date,
    dynamic waypoint,
    dynamic pickupLocation,
    dynamic dropoffLocation,
    dynamic asDirected,
    dynamic time,
    dynamic latLong,
    dynamic nextDay,
    dynamic pickupTime,
    dynamic passenger,
    dynamic bags,
    dynamic bookingType,
    int? bookingStatus,
    dynamic paymentId,
    int? paymentStatus,
    dynamic specialInstruction,
    dynamic totalTripTime,
    dynamic totalTripMiles,
    dynamic totalTripAmount,
  }) =>
      BooknowData(
        passengerId: passengerId ?? this.passengerId,
        driverId: driverId ?? this.driverId,
        date: date ?? this.date,
        waypoint: waypoint ?? this.waypoint,
        pickupLocation: pickupLocation ?? this.pickupLocation,
        dropoffLocation: dropoffLocation ?? this.dropoffLocation,
        asDirected: asDirected ?? this.asDirected,
        time: time ?? this.time,
        latLong: latLong ?? this.latLong,
        nextDay: nextDay ?? this.nextDay,
        pickupTime: pickupTime ?? this.pickupTime,
        passenger: passenger ?? this.passenger,
        bags: bags ?? this.bags,
        bookingType: bookingType ?? this.bookingType,
        bookingStatus: bookingStatus ?? this.bookingStatus,
        paymentId: paymentId ?? this.paymentId,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        specialInstruction: specialInstruction ?? this.specialInstruction,
        totalTripTime: totalTripTime ?? this.totalTripTime,
        totalTripMiles: totalTripMiles ?? this.totalTripMiles,
        totalTripAmount: totalTripAmount ?? this.totalTripAmount,
      );

  factory BooknowData.fromMap(Map<String, dynamic> json) => BooknowData(
        passengerId: json['passenger_id'],
        driverId: json['driver_id'],
        date: json['date'] == null ? null : DateTime.parse(json['date']),
        waypoint: json['waypoint'],
        pickupLocation: json['pickup_location'],
        dropoffLocation: json['dropoff_location'],
        asDirected: json['as_directed'],
        time: json['time'],
        latLong: json['lat_long'],
        nextDay: json['next_day'],
        pickupTime: json['pickup_time'],
        passenger: json['passenger'],
        bags: json['bags'],
        bookingType: json['booking_type'],
        bookingStatus: json['booking_status'],
        paymentId: json['payment_id'],
        paymentStatus: json['payment_status'],
        specialInstruction: json['special_instruction'],
        totalTripTime: json['total_trip_time_'],
        totalTripMiles: json['total_trip_miles_'],
        totalTripAmount: json['total_trip_amount_'],
      );

  Map<String, dynamic> toMap() => {
        'passenger_id': passengerId,
        'driver_id': driverId,
        'date':
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        'waypoint': waypoint,
        'pickup_location': pickupLocation,
        'dropoff_location': dropoffLocation,
        'as_directed': asDirected,
        'time': time,
        'lat_long': latLong,
        'next_day': nextDay,
        'pickup_time': pickupTime,
        'passenger': passenger,
        'bags': bags,
        'booking_type': bookingType,
        'booking_status': bookingStatus,
        'payment_id': paymentId,
        'payment_status': paymentStatus,
        'special_instruction': specialInstruction,
        'total_trip_time_': totalTripTime,
        'total_trip_miles_': totalTripMiles,
        'total_trip_amount_': totalTripAmount,
      };
}
