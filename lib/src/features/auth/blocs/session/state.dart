

import 'package:equatable/equatable.dart';

abstract class SessionState extends Equatable{
  @override
  List<Object?> get props => [];
}

class SessionUninitializedState extends SessionState{

  SessionUninitializedState();
  @override
  List<Object?> get props => [];
}

class SessionLoading extends SessionState{

  SessionLoading();
  @override
  List<Object?> get props => [];
}

class SessionAuthenticated extends SessionState{

  SessionAuthenticated();
  @override
  List<Object?> get props => [];
}

class SessionUnAuthenticated extends SessionState{

  SessionUnAuthenticated();
  @override
  List<Object?> get props => [];
}

class SessionError extends SessionState{
  final String error;
  SessionError({required this.error});
  @override
  List<Object?> get props => [];

}

