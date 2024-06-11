import 'package:equatable/equatable.dart';

import '../../../../data/models/session.dart';


abstract class SessionEvent  extends Equatable{
  @override
  List<Object?> get props => [];
}

class AppStarted extends SessionEvent{

  AppStarted();
  @override
  List<Object?> get props => [];

}

class LoggedIn extends SessionEvent{
  final Session session;
  LoggedIn({required this.session});
  @override
  List<Object?> get props => [];

}

class SignUp extends SessionEvent{
  final String uid;
  SignUp({required this.uid});
  @override
  List<Object?> get props => [];

}

class LoggedOut extends SessionEvent{


}