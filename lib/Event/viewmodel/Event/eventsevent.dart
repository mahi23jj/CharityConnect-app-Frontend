abstract class EventsEvent {}

class GetEvents extends EventsEvent {
  String? search;
  String? location;
  String? category;
  List<String>? supportGroups;
  GetEvents({this.search, this.location, this.category, this.supportGroups});
}

class GetEventsdetail extends EventsEvent {
  String id;
  GetEventsdetail({required this.id});
}


