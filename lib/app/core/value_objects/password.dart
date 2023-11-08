/// Value object representing a password.
class Password {
  final String _value;

  const Password(this._value);

  bool get hasLowerCase => RegExp(r'[a-z]').hasMatch(_value);

  bool get hasDigit => RegExp(r'\d').hasMatch(_value);

  bool get hasNoWhitespace => !_value.contains(' ');

  bool get isNotSimpleSequence => !RegExp(r'(123|abc)').hasMatch(_value);

  bool get isNotSimpleReverseSequence => !RegExp(r'(321|cba)').hasMatch(_value);

  bool get hasNoRepeatingCharacters => !RegExp(r'(.)\1\1').hasMatch(_value);

  /// Validates a password string according to the following rules:
  ///
  /// - Must have at least 8 characters
  /// - Must have at least one lowercase letter
  /// - Must have at least one uppercase letter
  /// - Must have at least one digit
  /// - Must have at least one special character
  /// - Must not have any whitespace
  /// - Must not be a simple sequence (e.g. "1234" or "abcd")
  /// - Must not be a simple reverse sequence (e.g. "4321" or "dcba")
  /// - Must not have any repeating characters
  ///
  /// Returns an empty string if the password is valid, otherwise returns a string
  /// with a message describing the first rule that is not met.
  String? get isValidPassword {
    if (_value.length < 8) {
      return 'A senha deve ter no mínimo 8 caracteres';
    } else if (!hasLowerCase) {
      return 'A senha deve ter pelo menos uma letra minúscula';
    } else if (!hasDigit) {
      return 'A senha deve ter pelo menos um número';
    } else if (!hasNoWhitespace) {
      return 'A senha não deve ter espaços em branco';
    } else if (!hasNoRepeatingCharacters) {
      return 'A senha não deve ter caracteres repetidos';
    } else {
      return null;
    }
  }

  bool get isValid {
    return _value.length >= 8 &&
        hasLowerCase &&
        hasDigit &&
        hasNoWhitespace &&
        hasNoRepeatingCharacters;
  }

  @override
  String toString() => _value;
}
