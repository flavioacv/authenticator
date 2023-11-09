/// A value object representing an email address.
///
/// The email address must be in a valid format, as determined by the regular expression
/// `r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'`.
class User {
  final String _value;

  const User(this._value);

  bool get hasNoWhitespace => !_value.contains(' ');

  String? get isValidUser {
    if (_value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!hasNoWhitespace) {
      return 'A senha não deve ter espaços em branco';
    } else if (_value.length > 20) {
      return 'A senha deve ter no maximo 20 caracteres';
    } else {
      return null;
    }
  }

  bool get isValid {
    return _value.isNotEmpty && _value.length <= 20 && hasNoWhitespace;
  }

  @override
  String toString() => _value;
}
