/// A value object representing an email address.
///
/// The email address must be in a valid format, as determined by the regular expression
/// `r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'`.
class Email {
  final String _value;

  const Email(this._value);

  /// Returns true if the email address is in a valid format, false otherwise.
  bool get isValid {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(_value);
  }

  /// Returns the email address as a string.
  String? get isValidString => isValid ? null : 'Email inválido';

  @override
  String toString() => _value;
}
