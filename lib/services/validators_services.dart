class ValidatorsServices {
  String? notNull(String? value) {
    if (value!.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String? validDouble(String? value) {
    try {
      final d = double.parse(value!);
      if (d <= 0) {
        return 'Price must to be greater than 0';
      }
      return null;
    } catch (e) {
      return 'This value must to be a NUMBER';
    }
  }

  String? password(String? value) {
    if (value == null) return 'can\'t be null';

    bool valid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
            .hasMatch(value);

    if (!valid) {
      return 'Password invalid! \n must have 1 lower char, 1 upper char, 1 number and 1 symbol';
    }
    return null;
  }

  String? email(String? email) {
    if (email == null) {
      return 'can\'t be null';
    }

    bool valid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (!valid) return 'Put an valid e-mail';
    return null;
  }

  String? imageUrlValidator(String? value) {
    try {
      bool validURL = Uri.parse(value!).isAbsolute;
      if (!validURL) {
        return 'Invalid URL';
      }

      if (value.endsWith('.jpg') ||
          value.endsWith('.jpeg') ||
          value.endsWith('.png')) {
        return null;
      }
      return 'Enter a valid Image URL.';
    } catch (e) {
      return 'Invalid URL';
    }
  }
}
