final RegExp numberRegExp = RegExp(r"^\+?0[0-9]{10}$");
final RegExp nameRegExp =
    RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']|))+[A-Za-z]+\.?\s*$");
final RegExp fullNameRegExp = RegExp(r"^[a-zA-Z -]*$");

final RegExp cnicRegExp = RegExp(r"^[0-9+]{5}[0-9+]{7}[0-9]{1}$");

final RegExp cnicRegExpp = RegExp(r"^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$");

final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final RegExp passwordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
