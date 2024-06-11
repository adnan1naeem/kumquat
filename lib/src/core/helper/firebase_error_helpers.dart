

class SignUpWithEmailAndPasswordFailure implements Exception {
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        throw 'Email is not valid or badly formatted.';
      case 'user-disabled':
        throw 'This user has been disabled. Please contact support for help.';
      case 'email-already-in-use':
        throw 'An account already exists for that email.';
      case 'operation-not-allowed':
        throw 'Operation is not allowed.  Please contact support.';
      case 'weak-password':
        throw 'Please enter a stronger password.';
      default:
        throw 'An unknown exception occurred.';
    }
  }
}

class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        throw 'Email is not valid or badly formatted.';
      case 'user-disabled':
        throw 'This user has been disabled. Please contact support for help.';
      case 'user-not-found':
        throw 'Email is not found, please create an account.';
      case 'wrong-password':
        throw 'Incorrect password, please try again.';
      case 'invalid-credential':
        throw 'Incorrect password or email try again';
      default:
        throw 'An unknown exception occurred.';
    }
  }

  /// The associated error message.
  final String message;
}