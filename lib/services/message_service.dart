import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/MessageModel.dart';
import 'package:shamo/models/ProductModel.dart';
import 'package:shamo/models/UserModel.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesById({int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data());
        }).toList();

        result.sort((MessageModel a, MessageModel b) =>
            a.createdAt.compareTo(b.createdAt));

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

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
        'isFromUser': isFromUser,
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
