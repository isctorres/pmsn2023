import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesFirebase {
  
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  CollectionReference? _favoritesCollection;

  FavoritesFirebase(){
    _favoritesCollection = _firebase.collection('favorites');
  }

  Future<void> insFavorite(Map<String,dynamic> map) async{
    return _favoritesCollection!.doc().set(map);
  }

  Future<void> updFavorite(Map<String,dynamic> map, String id) async {
    return _favoritesCollection!.doc(id).update(map);
  }

  Future<void> delFavorite(String id) async {
    return _favoritesCollection!.doc(id).delete();
  }

  Stream<QuerySnapshot> getAllFavorites() {
    return _favoritesCollection!.snapshots();
  }

}