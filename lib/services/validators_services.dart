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
    return null;
  }

  String? email(String? value) {
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
