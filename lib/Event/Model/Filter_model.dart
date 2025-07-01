class Filter {
  List<String> location = [];
  List<String> supportCondition = [];
  List<String> causeTypes = [];
  List<String> subLocation = [];

// place in ethiopia and addis abeababa
  final Map<String, List<String>> locations = {
    'Addis Ababa': [
      'Addis Ketema',
      'Akaki-Kality',
      'Arada',
      'Bole',
      'Dadaja Woreda',
      'Kirkos',
      'Kolfe Keranio',
      'Lafto',
      'Nifas Silk-Lafto',
      'Yeka'
    ],
    'Adama': [],
    'Arba Minch': [],
    'hawasa': [],
    'Bahir Dar': [],
    'Debre Birhan': [],
    'Debre Markos': [],
    'Gambela': [],
    'Gonder': [],
    'Hawassa': [],
    'Jimma': [],
    'Jima': [],
    'Jijiga': [],
    'Lalibela': [],
    'Mekele': [],
    'Nekemte': [],
    'Oromia': [],
    'Sodo': [],
    'SNNPR': [],
  };

  final supportConditions = [
    'Cancer',
    'HIV & AIDS',
    'parkinson',
    'Autism',
    'FND',
    'Anxiety',
    'Depression',
    'Parkinson’s',
    'PTSD',
    'Epilepsy',
    'ADHD',
    'Down Syndrome',
  ];
  // 'Elderly',
  // 'Families',
  // 'Women',
  // 'Youth',
  // 'Homeless',

  List<String> cause= [
  'Mental Health',
  'Domestic Violence',
  'Drug & Alcohol',
  'Poverty',
  'Refugees & Immigrants',
  'Disaster Relief'

  ];

  Map<String, dynamic> toJson() {
    return {
      "location": location,
      "supportConditions": supportConditions,
      "causeTypes": causeTypes,
      "subLocation": subLocation
    };
  }
}
