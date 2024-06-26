import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kumquat_app/src/features/auth/blocs/session/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../core/helper/firebase_error_helpers.dart';
import '../../data/models/json_doc.dart';


class FirebaseService{
  static final FirebaseService _singleton = FirebaseService._instantiate();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance ;
  FirebaseFirestore db = FirebaseFirestore.instance ;
  FirebaseStorage storage = FirebaseStorage.instance;
  late SessionBloc sessionBloc;
  late String _uid;

  FirebaseService._instantiate();

  factory FirebaseService(){
    return _singleton;
  }

  void initialize(SessionBloc sessionBloc){
      this.sessionBloc = sessionBloc ;
  }

  void setUserId(String id){
    _uid = id;
  }

  void removeId(){
    _uid = '';
  }

  Future createUser(String email,String password)async{
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    }
  }

  Future loginUser({required String email, required String password})async{
    try {
      UserCredential userCredential =  await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (error) {
      LogInWithEmailAndPasswordFailure.fromCode(error.code);
    }
  }

  Future<void> write(String collection, Map<String, dynamic> body,)async{
   try{
     DocumentReference documentReference = db.collection(collection).doc(_uid);
     // DocumentSnapshot userDocSnapshot = await documentReference.get();
     documentReference.set(body);
   }catch(e){
     throw e.toString();
   }
  }

  Future<String> uploadToStorage(File image, String name)async{

   final imagesRef = storage.ref('images/').child(name);
   try {
     await imagesRef.putFile(image);
     String ref = await imagesRef.getDownloadURL();
     return ref;
   } catch (error) {
     throw error.toString();
   }
  }

  Future<void> patch( String collection, Map body)async{
    try{
      DocumentReference documentReference = db.collection(collection).doc(_uid);
      // DocumentSnapshot userDocSnapshot = await documentReference.get();
      documentReference.set(body, SetOptions(merge: true));
    }catch(e){
      throw e.toString();
    }
  }

  Future<JsonDoc> read(String collection, {String key='', String? id })async{
    try{
      DocumentReference documentReference = db.collection(collection).doc(id??_uid);
      DocumentSnapshot userDocSnapshot = await documentReference.get();
      Map<String, dynamic>? userData =
      userDocSnapshot.data() as Map<String, dynamic>?;
      if (userData != null) {
        // var object = userData;
        return JsonDoc(data: userData );
      } else {
        throw 'Document Doesn\'t Exist';
      }
    }catch(e){
      throw e.toString();
    }
  }



}
