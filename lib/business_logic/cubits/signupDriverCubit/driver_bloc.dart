import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import '../../../data/data.dart';
import '../cubits.dart';

class DriverRegisterBloc
    extends Bloc<RegisterDriverEvent, RegisterDriverState> {
  DriverRegisterBloc() : super(RegisterDriverInitial());
  var token;

  final SharedPrefs _sharedPrefs = SharedPrefs();

  @override
  Stream<RegisterDriverState> mapEventToState(
      RegisterDriverEvent event) async* {
    if (event is DriverEvent) {
      yield* _mapUploadFileEventToState(event);
    }
  }

  Stream<RegisterDriverState> _mapUploadFileEventToState(
      DriverEvent event) async* {
    try {
      await _sharedPrefs.getToken().then(
        (value) {
          token = value;
        },
      );
      yield RegisterDriverInProgress(progress: 0.0);

      // Construct the multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://myspeedylimo.com/api/user/driver/create'));
      request.headers['Authorization'] = 'Bearer $token';
      // Add the file to the request
      // var fileStream = http.ByteStream(file.openRead());
      // var length = await file.length();
      // var multipartFile = http.MultipartFile('file', fileStream, length,
      //     filename: file.path.split('/').last);

      request.files.add(await http.MultipartFile.fromPath(
          'driving_license', event.license.path));
      request.files.add(
          await http.MultipartFile.fromPath('partner_photo', event.photo.path));
      request.files.add(await http.MultipartFile.fromPath(
          'vehicle_reg_book', event.vehicleregistration.path));
      request.files.add(await http.MultipartFile.fromPath(
          'cnic_front', event.vehicleinsurance.path));
      request.files.add(
          await http.MultipartFile.fromPath('cnic_back', event.drugtest.path));

      // Add other parameters if needed
      request.fields['name'] = event.name;
      request.fields['email'] = event.email;
      request.fields['phone_number'] = event.phone;
      request.fields['password'] = event.password;
      request.fields['password_confirmation'] = event.confirmpassword;

      var response = await request.send();

      if (response.statusCode == 200) {
        yield RegisterDriverSuccess('File uploaded successfully');
      } else {
        yield RegisterDriverFailure('Failed to upload file');
      }
    } catch (e) {
      yield RegisterDriverFailure('An error occurred: $e');
    }
  }
}
