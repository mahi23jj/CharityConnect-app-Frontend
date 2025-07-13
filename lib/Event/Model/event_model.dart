class Eventmodel {
  final String id;
  final String image;
  final String eventname;
  final String eventdate;
  final String eventlocation;
  final List<String> supportgroupMain;
  final List<String> supportgroupSub;
  final String description;
  final List<String> cause;
  final String organizer;
  final List<String>? Memories;
  final List<String>? relatedpic;
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
      required this.supportgroupMain,
      required this.supportgroupSub,
      required this.description,
      required this.cause,
      required this.organizer,
      this.Memories,
      this.relatedpic,
      required this.Vipseat,
      required this.Normalseat,
      required this.Vipseatprice,
      required this.Normalseatprice
      });

  factory Eventmodel.fromMap(Map<String, dynamic> map) {
    return Eventmodel(
      id: map['_id'],
      image: map['image_url'],
      eventname: map['eventname'],
      eventdate: map['eventdate'],
      eventlocation: map['eventlocation'],
      supportgroupMain: List<String>.from(map['supportgroup']['main'] ?? []),
      supportgroupSub: List<String>.from(map['supportgroup']['sub'] ?? []),
      description: map['discription'],
      cause: List<String>.from(map['eventcause']),
      organizer: map['creator_id']['org_name'],
      Memories:
          map['memories'] != null ? List<String>.from(map['memories']) : null,
      relatedpic: map['relatedpic'] != null
          ? List<String>.from(map['relatedpic'])
          : null,
      Vipseat: map['vipseat'],
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
        'supportgroup': {
          'main': supportgroupMain,
          'sub': supportgroupSub,
        },
        
        'description': description,
        'cause': cause,
        'organizer': organizer,
        'Memories': Memories,
        'relatedpic': relatedpic,
        'Vipseat': Vipseat,
        'Normalseat': Normalseat,
        'Vipseatprice': Vipseatprice,
        'Normalseatprice': Normalseatprice
      };
}
