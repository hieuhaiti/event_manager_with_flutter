import 'package:localstore/localstore.dart';

class EventService {
  final db = Localstore.getInstance(useSupportDir: true);
  // name collection
  final String collectionName = 'events';

  // function get all events
  // Future<List<EventModel>> getEvents() async {
  //   final events = await db.collection(collectionName).get();
  //   return events;
  // }
}
