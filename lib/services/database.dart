import 'package:Efficacy/models/club.dart';
import 'package:Efficacy/models/eventCloud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  String id;
  DatabaseService({this.id});
  final CollectionReference eventCollection =
      Firestore.instance.collection('events');

  final CollectionReference clubCollection =
      Firestore.instance.collection('clubs');
  EventCloud _eventFromSnapshot(DocumentSnapshot snapshot) {
    return EventCloud(
      id: snapshot.data()["id"] ?? '1',
      title: snapshot.data()["title"] ?? 'event title',
      picture: snapshot.data()["picture"] ?? 'picture url',
      clubId: snapshot.data()["clubId"] ?? 'clubid',
      clubName: snapshot.data()["clubName"] ?? 'clubname',
      about: snapshot.data()["about"] ?? 'about',
      timings: DateTime.parse(snapshot.data()["timings"]),
    );
  }

  Club _clubFromSnapshot(DocumentSnapshot snapshot) {
    return Club(
      id: snapshot.data()["id"] ?? 'id missing',
      name: snapshot.data()["name"] ?? 'name missing',
      imageUrl: snapshot.data()["imageUrl"] ?? 'image unavailable',
      desc: snapshot.data()["desc"] ?? 'description unavailable',
      fb: snapshot.data()["fb"] ?? 'link unavailable',
    );
  }

  Stream<Club> get fetchClub {
    return clubCollection.document(id).snapshots().map((club) {
      return _clubFromSnapshot(club);
    });
  }

  // Future<void> getSingleEvent(String id) async {
  //   return eventCollection.document(id).get().then((value) {
  //     print(value.data());
  //   });
  // }

  Stream<EventCloud> get fetchEvent {
    return eventCollection.document(id).snapshots().map((event) {
      return _eventFromSnapshot(event);
    });
  }

  List<Club> _clubListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Club(
        id: doc.data()["id"],
        name: doc.data()["name"] ?? 'event title',
        desc: doc.data()["desc"] ?? 'Desc needed',
        imageUrl: doc.data()["imageUrl"] ?? 'image missing',
        fb: doc.data()["fb"] ?? "link unavailable",
      );
    }).toList();
  }

  Stream<List<Club>> get clubsFromCloud {
    return clubCollection.snapshots().map(_clubListFromSnapshot);
  }

  List<EventCloud> _eventListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return EventCloud(
        id: doc.data()["id"],
        title: doc.data()["title"] ?? 'event title',
        picture: doc.data()["picture"] ?? 'picture url',
        clubId: doc.data()["clubId"] ?? 'clubid',
        clubName: doc.data()["clubName"] ?? 'clubname',
        about: doc.data()["about"] ?? 'about',
        timings: DateTime.parse(doc.data()["timings"]),
      );
    }).toList();
  }

  Stream<List<EventCloud>> get eventsFromCloud {
    return eventCollection
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(_eventListFromSnapshot);
  }

  Stream<List<EventCloud>> get eventsPerClub {
    return eventCollection
        .orderBy("timestamp", descending: true)
        .where("clubId", isEqualTo: id)
        .snapshots()
        .map(_eventListFromSnapshot);
  }
}
