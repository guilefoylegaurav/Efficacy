import 'package:Efficacy/models/eventCloud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  String id;
  DatabaseService({this.id});
  final CollectionReference eventCollection =
      Firestore.instance.collection('events');

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

  Stream<EventCloud> get fetchEvent {
    return eventCollection.document(id).snapshots().map((event) {
      return _eventFromSnapshot(event);
    });
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
    return eventCollection.snapshots().map(_eventListFromSnapshot);
  }
}
