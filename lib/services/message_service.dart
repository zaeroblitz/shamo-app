import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/models/UserModel.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage({
    UserModel user,
    bool isFromUser,
    String message,
    ProductModel product,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': true,
        'message': message,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print('Succesfully sent message'));
    } catch (e) {
      throw Exception('Sent Message Failed');
    }
  }
}
