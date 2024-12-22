const mockTrainings = [
  {
    "title": "Safe Scrum Master",
    "date": "Oct 11 - 13, 2019",
    "time": "08:30 am - 12:30 pm",
    "location": "West Des Moines",
    "trainer": "Helen Gribble",
    "image": "https://randomuser.me/api/portraits/thumb/women/1.jpg",
    "cover_image": "https://picsum.photos/300/150?random=1"
  },
  {
    "title": "Advanced Kanban Training",
    "date": "Nov 4 - 6, 2019",
    "time": "09:00 am - 01:00 pm",
    "location": "Chicago, IL",
    "trainer": "Sarah Smith",
    "image": "https://randomuser.me/api/portraits/thumb/men/2.jpg",
    "cover_image": "https://picsum.photos/300/150?random=2"
  },
  {
    "title": "Agile Project Management",
    "date": "Dec 1 - 3, 2019",
    "time": "10:00 am - 02:00 pm",
    "location": "Dallas, TX",
    "trainer": "John Doe",
    "image": "https://randomuser.me/api/portraits/thumb/men/3.jpg",
    "cover_image": "https://picsum.photos/300/150?random=3"
  },
  {
    "title": "Certified Product Owner",
    "date": "Jan 15 - 17, 2020",
    "time": "11:00 am - 03:00 pm",
    "location": "Phoenix, AZ",
    "trainer": "Emma Brown",
    "image": "https://randomuser.me/api/portraits/thumb/women/4.jpg",
    "cover_image": "https://picsum.photos/300/150?random=4"
  },
  {
    "title": "Design Thinking Workshop",
    "date": "Feb 5 - 7, 2020",
    "time": "01:00 pm - 05:00 pm",
    "location": "San Diego, CA",
    "trainer": "Michael Lee",
    "image": "https://randomuser.me/api/portraits/thumb/men/5.jpg",
    "cover_image": "https://picsum.photos/300/150?random=5"
  },
  {
    "title": "Scrum Master Certification",
    "date": "Mar 10 - 12, 2020",
    "time": "08:00 am - 12:00 pm",
    "location": "San Francisco, CA",
    "trainer": "Linda Taylor",
    "image": "https://randomuser.me/api/portraits/thumb/women/6.jpg",
    "cover_image": "https://picsum.photos/300/150?random=6"
  },
  {
    "title": "Leadership in Agile Teams",
    "date": "Apr 18 - 20, 2020",
    "time": "09:30 am - 01:30 pm",
    "location": "New York, NY",
    "trainer": "David Wilson",
    "image": "https://randomuser.me/api/portraits/thumb/men/7.jpg",
    "cover_image": "https://picsum.photos/300/150?random=7"
  },
  {
    "title": "DevOps for Beginners",
    "date": "May 2 - 4, 2020",
    "time": "10:30 am - 02:30 pm",
    "location": "Austin, TX",
    "trainer": "Sophia Johnson",
    "image": "https://randomuser.me/api/portraits/thumb/women/8.jpg",
    "cover_image": "https://picsum.photos/300/150?random=8"
  },
  {
    "title": "Scaled Agile Framework (SAFe)",
    "date": "Jun 8 - 10, 2020",
    "time": "02:00 pm - 06:00 pm",
    "location": "Los Angeles, CA",
    "trainer": "Chris Martinez",
    "image": "https://randomuser.me/api/portraits/thumb/men/9.jpg",
    "cover_image": "https://picsum.photos/300/150?random=9"
  },
  {
    "title": "Effective Team Collaboration",
    "date": "Jul 15 - 17, 2020",
    "time": "01:00 pm - 05:00 pm",
    "location": "Seattle, WA",
    "trainer": "Olivia Harris",
    "image": "https://randomuser.me/api/portraits/thumb/women/10.jpg",
    "cover_image": "https://picsum.photos/300/150?random=10"
  }
];

const mockTrainingsHighlights = [
  {
    'title': 'Safe Scrum Master',
    'date': 'Oct 11 - 13, 2019',
    'time': '08:30 am - 12:30 pm',
    'location': 'West Des Moines',
    'trainer': 'Helen Gribble',
    'image': 'https://randomuser.me/api/portraits/thumb/men/1.jpg',
    'cover_image': 'https://picsum.photos/300/150?random=1',
  },
  {
    'title': 'Agile Project Management',
    'date': 'Nov 15 - 17, 2019',
    'time': '08:30 am - 12:30 pm',
    'location': 'Chicago, IL',
    'trainer': 'John Doe',
    'image': 'https://randomuser.me/api/portraits/thumb/men/2.jpg',
    'cover_image': 'https://picsum.photos/300/150?random=2',
  },
  {
    'title': 'Advanced Kanban Training',
    'date': 'Dec 1 - 3, 2019',
    'time': '08:30 am - 12:30 pm',
    'location': 'Phoenix, AZ',
    'trainer': 'Sarah Smith',
    'image': 'https://randomuser.me/api/portraits/thumb/men/3.jpg',
    'cover_image': 'https://picsum.photos/300/150?random=3',
  },
];

List<Map<String, bool>> locationsMock = <Map<String, bool>>[
  {'West Des Moines': false},
  {"Chicago, IL": false},
  {"Dallas, TX": false},
  {"Phoenix, AZ": false},
  {"San Diego, CA": false},
  {"San Francisco, CA": false},
  {"New York, NY": false},
  {"Austin, TX": false},
  {"Los Angeles, CA": false},
  {"Seattle, WA": false}
];

List<Map<String, bool>> trainingsMock = <Map<String, bool>>[
  {'Safe Scrum Master': false},
  {"Agile Project Management": false},
  {"Advanced Kanban Training": false},
  {"Certified Product Owner": false},
  {"Design Thinking Workshop": false},
  {"Scrum Master Certification": false},
  {"Leadership in Agile Teams": false},
  {"DevOps for Beginners": false},
  {"Scaled Agile Framework (SAFe)": false},
  {"Effective Team Collaboration": false}
];

List<Map<String, bool>> trainersMock = <Map<String, bool>>[
  {'Helen Gribble': false},
  {"John Doe": false},
  {"Sarah Smith": false},
  {"Emma Brown": false},
  {"Michael Lee": false},
  {"Linda Taylor": false},
  {"David Wilson": false},
  {"Sophia Johnson": false},
  {"Chris Martinez": false},
  {"Olivia Harris": false}
];
