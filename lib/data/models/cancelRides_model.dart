import 'dart:convert';

CancelRidesModel cancelRidesModelFromMap(String str) =>
    CancelRidesModel.fromMap(json.decode(str));

String cancelRidesModelToMap(CancelRidesModel data) =>
    json.encode(data.toMap());

class CancelRidesModel {
  final int? status;
  final List<CancelRideData>? data;
  final String? message;

  CancelRidesModel({
    this.status,
    this.data,
    this.message,
  });

  CancelRidesModel copyWith({
    int? status,
    List<CancelRideData>? data,
    String? message,
  }) =>
      CancelRidesModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory CancelRidesModel.fromMap(Map<String, dynamic> json) =>
      CancelRidesModel(
        status: json['status'],
        data: json['data'] == null
            ? []
            : List<CancelRideData>.from(
                json['data']!.map((x) => CancelRideData.fromMap(x))),
        message: json['message'],
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'data':
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        'message': message,
      };
}

class CancelRideData {
  final int? id;
  final int? passengerId;
  final int? driverId;
  final DateTime? date;
  final String? pickupLocation;
  final String? waypoint;
  final String? dropoffLocation;
  final dynamic price;
  final int? status;
  final String? pickupTime;
  final String? passenger;
  final String? bags;
  final String? bookingType;
  final String? asDirected;
  final dynamic time;
  final String? latLong;
  final dynamic nextDay;
  final dynamic completedBy;
  final int? cancelledBy;
  final String? bookingStatus;
  final String? specialInstruction;
  final String? totalTripTime;
  final String? totalTripMiles;
  final String? totalTripAmount;
  final String? paymentStatus;
  final String? paymentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UsertypeCancel? usertype;
  final UsertypeCancel? usertypeDriver;
  final UsertypeCancel? name;

  CancelRideData({
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
    this.usertypeDriver,
    this.name,
  });

  CancelRideData copyWith({
    int? id,
    int? passengerId,
    int? driverId,
    DateTime? date,
    String? pickupLocation,
    String? waypoint,
    String? dropoffLocation,
    dynamic price,
    int? status,
    String? pickupTime,
    String? passenger,
    String? bags,
    String? bookingType,
    String? asDirected,
    dynamic time,
    String? latLong,
    dynamic nextDay,
    dynamic completedBy,
    int? cancelledBy,
    String? bookingStatus,
    String? specialInstruction,
    String? totalTripTime,
    String? totalTripMiles,
    String? totalTripAmount,
    String? paymentStatus,
    String? paymentId,
    DateTime? createdAt,
    DateTime? updatedAt,
    UsertypeCancel? usertype,
    UsertypeCancel? usertypeDriver,
    UsertypeCancel? name,
  }) =>
      CancelRideData(
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
        usertypeDriver: usertypeDriver ?? this.usertypeDriver,
        name: name ?? this.name,
      );

  factory CancelRideData.fromMap(Map<String, dynamic> json) => CancelRideData(
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
            : UsertypeCancel.fromMap(json['usertype']),
        usertypeDriver: json['usertype_driver'] == null
            ? null
            : UsertypeCancel.fromMap(json['usertype_driver']),
        name:
            json['name'] == null ? null : UsertypeCancel.fromMap(json['name']),
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
        'usertype_driver': usertypeDriver?.toMap(),
        'name': name?.toMap(),
      };
}

class UsertypeCancel {
  final int? id;
  final int? status;
  final String? name;
  final String? email;
  final dynamic phoneNumber;
  final dynamic image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UsertypeCancel({
    this.id,
    this.status,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  UsertypeCancel copyWith({
    int? id,
    int? status,
    String? name,
    String? email,
    dynamic phoneNumber,
    dynamic image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UsertypeCancel(
        id: id ?? this.id,
        status: status ?? this.status,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UsertypeCancel.fromMap(Map<String, dynamic> json) => UsertypeCancel(
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
