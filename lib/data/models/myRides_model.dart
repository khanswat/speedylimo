// To parse this JSON data, do
//
//     final myRidesModel = myRidesModelFromMap(jsonString);

import 'dart:convert';

MyRidesModel myRidesModelFromMap(String str) =>
    MyRidesModel.fromMap(json.decode(str));

String myRidesModelToMap(MyRidesModel data) => json.encode(data.toMap());

class MyRidesModel {
  final int? status;
  final List<MyRidesData>? data;
  final String? message;

  MyRidesModel({
    this.status,
    this.data,
    this.message,
  });

  MyRidesModel copyWith({
    int? status,
    List<MyRidesData>? data,
    String? message,
  }) =>
      MyRidesModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory MyRidesModel.fromMap(Map<String, dynamic> json) => MyRidesModel(
        status: json['status'],
        data: json['data'] == null
            ? []
            : List<MyRidesData>.from(
                json['data']!.map((x) => MyRidesData.fromMap(x))),
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'data':
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        'message': message,
      };
}

class MyRidesData {
  final int? id;
  final int? passengerId;
  final dynamic driverId;
  final DateTime? date;
  final String? pickupLocation;
  final dynamic waypoint;
  final String? dropoffLocation;
  final dynamic price;
  final int? status;
  final String? pickupTime;
  final String? passenger;
  final String? bags;
  final String? bookingType;
  final String? asDirected;
  final String? time;
  final String? latLong;
  final dynamic nextDay;
  final dynamic completedBy;
  final dynamic cancelledBy;
  final String? bookingStatus;
  final String? specialInstruction;
  final String? totalTripTime;
  final String? totalTripMiles;
  final String? totalTripAmount;
  final dynamic paymentStatus;
  final dynamic paymentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Usertype? usertype;

  MyRidesData({
    this.id,
    this.passengerId,
    this.driverId,
    this.date,
    this.pickupLocation,
    this.waypoint,
    this.dropoffLocation,
    this.price,
    this.status,
    this.pickupTime,
    this.passenger,
    this.bags,
    this.bookingType,
    this.asDirected,
    this.time,
    this.latLong,
    this.nextDay,
    this.completedBy,
    this.cancelledBy,
    this.bookingStatus,
    this.specialInstruction,
    this.totalTripTime,
    this.totalTripMiles,
    this.totalTripAmount,
    this.paymentStatus,
    this.paymentId,
    this.createdAt,
    this.updatedAt,
    this.usertype,
  });

  MyRidesData copyWith({
    int? id,
    int? passengerId,
    dynamic driverId,
    DateTime? date,
    String? pickupLocation,
    dynamic waypoint,
    String? dropoffLocation,
    dynamic price,
    int? status,
    String? pickupTime,
    String? passenger,
    String? bags,
    String? bookingType,
    String? asDirected,
    String? time,
    String? latLong,
    dynamic nextDay,
    dynamic completedBy,
    dynamic cancelledBy,
    String? bookingStatus,
    String? specialInstruction,
    String? totalTripTime,
    String? totalTripMiles,
    String? totalTripAmount,
    dynamic paymentStatus,
    dynamic paymentId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Usertype? usertype,
  }) =>
      MyRidesData(
        id: id ?? this.id,
        passengerId: passengerId ?? this.passengerId,
        driverId: driverId ?? this.driverId,
        date: date ?? this.date,
        pickupLocation: pickupLocation ?? this.pickupLocation,
        waypoint: waypoint ?? this.waypoint,
        dropoffLocation: dropoffLocation ?? this.dropoffLocation,
        price: price ?? this.price,
        status: status ?? this.status,
        pickupTime: pickupTime ?? this.pickupTime,
        passenger: passenger ?? this.passenger,
        bags: bags ?? this.bags,
        bookingType: bookingType ?? this.bookingType,
        asDirected: asDirected ?? this.asDirected,
        time: time ?? this.time,
        latLong: latLong ?? this.latLong,
        nextDay: nextDay ?? this.nextDay,
        completedBy: completedBy ?? this.completedBy,
        cancelledBy: cancelledBy ?? this.cancelledBy,
        bookingStatus: bookingStatus ?? this.bookingStatus,
        specialInstruction: specialInstruction ?? this.specialInstruction,
        totalTripTime: totalTripTime ?? this.totalTripTime,
        totalTripMiles: totalTripMiles ?? this.totalTripMiles,
        totalTripAmount: totalTripAmount ?? this.totalTripAmount,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        paymentId: paymentId ?? this.paymentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        usertype: usertype ?? this.usertype,
      );

  factory MyRidesData.fromMap(Map<String, dynamic> json) => MyRidesData(
        id: json['id'],
        passengerId: json['passenger_id'],
        driverId: json['driver_id'],
        date: json['date'] == null ? null : DateTime.parse(json['date']),
        pickupLocation: json['pickup_location'],
        waypoint: json['waypoint'],
        dropoffLocation: json['dropoff_location'],
        price: json['price'],
        status: json['status'],
        pickupTime: json['pickup_time'],
        passenger: json['passenger'],
        bags: json['bags'],
        bookingType: json['booking_type'],
        asDirected: json['as_directed'],
        time: json['time'],
        latLong: json['lat_long'],
        nextDay: json['next_day'],
        completedBy: json['completed_by'],
        cancelledBy: json['cancelled_by'],
        bookingStatus: json['booking_status'],
        specialInstruction: json['special_instruction'],
        totalTripTime: json['total_trip_time_'],
        totalTripMiles: json['total_trip_miles_'],
        totalTripAmount: json['total_trip_amount_'],
        paymentStatus: json['payment_status'],
        paymentId: json['payment_id'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
        usertype: json['usertype'] == null
            ? null
            : Usertype.fromMap(json['usertype']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'passenger_id': passengerId,
        'driver_id': driverId,
        'date':
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        'pickup_location': pickupLocation,
        'waypoint': waypoint,
        'dropoff_location': dropoffLocation,
        'price': price,
        'status': status,
        'pickup_time': pickupTime,
        'passenger': passenger,
        'bags': bags,
        'booking_type': bookingType,
        'as_directed': asDirected,
        'time': time,
        'lat_long': latLong,
        'next_day': nextDay,
        'completed_by': completedBy,
        'cancelled_by': cancelledBy,
        'booking_status': bookingStatus,
        'special_instruction': specialInstruction,
        'total_trip_time_': totalTripTime,
        'total_trip_miles_': totalTripMiles,
        'total_trip_amount_': totalTripAmount,
        'payment_status': paymentStatus,
        'payment_id': paymentId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'usertype': usertype?.toMap(),
      };
}

class Usertype {
  final int? id;
  final int? status;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Usertype({
    this.id,
    this.status,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Usertype copyWith({
    int? id,
    int? status,
    String? name,
    String? email,
    String? phoneNumber,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Usertype(
        id: id ?? this.id,
        status: status ?? this.status,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Usertype.fromMap(Map<String, dynamic> json) => Usertype(
        id: json['id'],
        status: json['status'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        image: json['image'],
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at']),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'status': status,
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
