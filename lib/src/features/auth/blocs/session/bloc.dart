import 'package:kumquat_app/src/domain/services/firebase_service.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/event.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/user_profile.dart';
import '../../../../domain/services/secure_storage_service.dart';

class SessionBloc extends Bloc<SessionEvent,SessionState>{
  final SecureStorageService secureStorageService;
  late  UserProfile userProfile;
  SessionBloc(this.secureStorageService): super(SessionUninitializedState()){
    on<AppStarted>(_appStarted);
    on<LoggedIn>(_login);
    on<LoggedOut>(_logout);
    on<SignUp>(_signup);
  }

  void _appStarted(AppStarted event, Emitter emit)async{
   try{
     emit(SessionUninitializedState());
        String? userId = await secureStorageService.getId();
        userProfile = await secureStorageService.getProfile();
        if(userId != null && userId.isNotEmpty){
          FirebaseService().setUserId(userId);
          emit(SessionAuthenticated());
        }else{
          emit(SessionUnAuthenticated());
        }
   }catch(error){
    emit(SessionError(error: error.toString()));
    }
  }

  Future<void> _login(LoggedIn event, Emitter emit)async{
   try{
     FirebaseService().setUserId(event.session.uid);
     await secureStorageService.saveId(event.session.uid);
     userProfile = await secureStorageService.getProfile();
     emit(SessionAuthenticated());
   }catch(error){
     emit(SessionError(error: error.toString()));
   }
  }

  Future<void> _signup(SignUp event, Emitter emit)async{
    try{
      FirebaseService().setUserId(event.uid);
      await secureStorageService.saveId(event.uid);
      emit(SessionAuthenticated());
    }catch(error){
      emit(SessionError(error: error.toString()));
    }
  }

  Future<void> _logout(LoggedOut event, Emitter emit)async{
    emit(SessionUninitializedState());
    secureStorageService.deleteSession();
    FirebaseService().removeId();
    emit(SessionUnAuthenticated());
  }

}