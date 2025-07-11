class Eventmodel {
  final String id;
  final String image;
  final String eventname;
  final String eventdate;
  final String eventlocation;
  final String supportgroup;
  final String description;
  final String cause;
  final String organizer;
  final List<String>? Memories;
  final double Vipseat;
  final double Normalseat;
  final double Vipseatprice;
  final double Normalseatprice;

  Eventmodel(
      {required this.id,
      required this.image,
      required this.eventname,
      required this.eventdate,
      required this.eventlocation,
      required this.supportgroup,
      required this.description,
      required this.cause,
      required this.organizer,
      this.Memories,
      required this.Vipseat,
      required this.Normalseat,
      required this.Vipseatprice,
      required this.Normalseatprice});

  factory Eventmodel.fromMap(Map<String, dynamic> map) {
    return Eventmodel(
      id: map['id'],
      image: map['image'],
      eventname: map['eventname'],
      eventdate: map['eventdate'],
      eventlocation: map['eventlocation'],
      supportgroup: map['supportgroup'],
      description: map['description'],
      cause: map['cause'],
      organizer: map['organizer'],
      Memories: map['Memories'],
      Vipseat: map['Vipseat'],
      Normalseat: map['Normalseat'],
      Vipseatprice: map['Vipseatprice'],
      Normalseatprice: map['Normalseatprice'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'eventname': eventname,
        'eventdate': eventdate,
        'eventlocation': eventlocation,
        'supportgroup': supportgroup,
        'description': description,
        'cause': cause,
        'organizer': organizer,
        'Memories': Memories,
        'Vipseat': Vipseat,
        'Normalseat': Normalseat,
        'Vipseatprice': Vipseatprice,
        'Normalseatprice': Normalseatprice
      };
}
