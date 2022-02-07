import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AcesDevFirebaseUser {
  AcesDevFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AcesDevFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AcesDevFirebaseUser> acesDevFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AcesDevFirebaseUser>(
            (user) => currentUser = AcesDevFirebaseUser(user));
