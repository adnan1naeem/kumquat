import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kumquat_app/src/data/repository_implementation/auth_implementation.dart';
import 'package:kumquat_app/src/domain/services/firebase_service.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/event.dart';
import 'package:kumquat_app/src/features/auth/blocs/auth/state.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/event.dart';

import '../../../../data/models/session.dart';
import '../session/bloc.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  final SessionBloc  sessionBloc;
  AuthBloc(this.sessionBloc) : super(AuthInitial()){
    on<DoLogin>(_login);
    on<DoSignup>(_signup);
    on<CreateProfile>(_createProfile);
    on<DoLogout>(_logout);
  }
  AuthImplementation authRepo = AuthImplementation();
   String uid = '';
   String username = '';
   String email= '';
   String profession = '';
   String category1 = '';
   String category2 = '';
  String category3 = '';

  void _login(DoLogin event, Emitter emit)async{
    try{
      emit(AuthLoading(showIndicator: true,));
      Session session = await authRepo.login(email: event.email, password: event.password);
      await sessionBloc.secureStorageService.saveProfile(session.user);
       sessionBloc.add(LoggedIn(session: session));
      emit(AuthSuccess(isLoggedIn: true));
    }catch(error){
      emit(AuthError(error:  error.toString(), isLoggedIn: true));
    }
  }
  void _signup(DoSignup event, Emitter emit)async{
    try{
      emit(AuthLoading(showIndicator: true,));
      await authRepo.signup(email: event.email, password: event.password, username: event.username);
      uid = FirebaseService().firebaseAuth.currentUser!.uid ;
      email = event.email;
      username = event.username;
      FirebaseService().setUserId(uid);

      emit(AuthSuccess(isSignup: true));
    }catch(error){
      emit(AuthError(error:  error.toString(), isSignup: true));
    }
  }
  void _createProfile(CreateProfile event, Emitter emit)async{
    try{
      emit(AuthLoading(showIndicator: true));
      await authRepo.createUserProfile(
          username: event.username,
          uid: event.uid,
          email: event.email,
          profession: event.profession,
          category1: event.category1,
          category2: event.category2,
          category3: event.category3,
          phoneRate:0.0,
          videoRate:0.0,
          about: event.about,
          image: event.image,
          socials: event.socials);
      // sessionBloc.add(SignUp(uid: uid));
      // await authRepo.logout();
      FirebaseService().setUserId('');
      emit(AuthSuccess(isProfileCreation: true));
    }catch(error){
      emit(AuthError(error: error.toString(), isProfileCreation: true));
    }
  }

  void _logout(DoLogout event, Emitter emit)async{
    try{
      emit(AuthLoading(showIndicator: true));
      await authRepo.logout();
      sessionBloc.add(LoggedOut());
      emit(AuthSuccess());
    }catch(error){
      emit(AuthError(error: error.toString()));
    }
  }

}