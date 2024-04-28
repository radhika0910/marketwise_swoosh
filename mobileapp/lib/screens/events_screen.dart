import 'package:flutter/material.dart';

class EventData {
  final String event;
  final int rating;

  EventData({required this.event, required this.rating});
}

class EventsPage extends StatelessWidget {
  final List<Map<String, dynamic>> eventData = [
    {
      "_id": "662d50313ae1796ad0f406be",
      "Row Labels":
          "13th ACM Conference on Security and Privacy in Wireless and Mobile Networks",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406bf",
      "Row Labels": "3rd Annual Intelligent Automation Summit 2020.",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406c0",
      "Row Labels": "5 day certified workshop on c++ by talent battle",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406c1",
      "Row Labels": "Amazewow webinar series :introduction to coding",
      "Sum of Chain_Result": 4
    },
    {
      "_id": "662d50313ae1796ad0f406c2",
      "Row Labels": "Android development certification course on udacity ",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406c3",
      "Row Labels":
          "AWSome workshop by amazon for cloud counselage interns and employees",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406c4",
      "Row Labels": "blockchain and crypto currency workshop",
      "Sum of Chain_Result": 4
    },
    {
      "_id": "662d50313ae1796ad0f406c5",
      "Row Labels": "BUFFALO CYBERSECURITY CONFERENCE",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406c6",
      "Row Labels": "CodeBoost codeathon is live now!",
      "Sum of Chain_Result": 3
    },
    {
      "_id": "662d50313ae1796ad0f406c7",
      "Row Labels": "codevita season 9 contest",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406c8",
      "Row Labels": "crio launch trayouts in 11 Jan and 12 jan",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406c9",
      "Row Labels":
          "data analyatics and data visualization using google data studio",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406ca",
      "Row Labels": "devOps  days of london",
      "Sum of Chain_Result": 3
    },
    {
      "_id": "662d50313ae1796ad0f406cb",
      "Row Labels": "DevOps Talks Conference.",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406cc",
      "Row Labels": "Digital Summit at Home 2020",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406cd",
      "Row Labels":
          "Don't miss the Seminar on SEO optimization by Google experts",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406ce",
      "Row Labels": "ETQ Quality Vision 2020: Inspire Excellence",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406cf",
      "Row Labels": "ETQ Sponsors LNS Industrial Transformation event",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406d0",
      "Row Labels": "Flutter workshop by edureka",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406d1",
      "Row Labels": "Geeks for geeks interview preparation course",
      "Sum of Chain_Result": 4
    },
    {
      "_id": "662d50313ae1796ad0f406d2",
      "Row Labels":
          "Get a System Administration certification from PurpleHat today",
      "Sum of Chain_Result": 4
    },
    {
      "_id": "662d50313ae1796ad0f406d3",
      "Row Labels": "get certified and master AWS in real world by Coursera",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406d4",
      "Row Labels": "great hackathron by snapchat india",
      "Sum of Chain_Result": 4
    },
    {
      "_id": "662d50313ae1796ad0f406d5",
      "Row Labels": "GreyAtoms online code-along workshop",
      "Sum of Chain_Result": 3
    },
    {
      "_id": "662d50313ae1796ad0f406d6",
      "Row Labels": "IITB Techfest online training program",
      "Sum of Chain_Result": 4
    },
    {
      "_id": "662d50313ae1796ad0f406d7",
      "Row Labels": "internship opportunity peacock solar",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406d8",
      "Row Labels": "intro to deep learning @ intel",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406d9",
      "Row Labels":
          "kaggle competition launch : Google landmark retrieval 2020",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406da",
      "Row Labels": "NLP specialization from deep learing.ai",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406db",
      "Row Labels":
          "online internship and training program from IIT BHU varanasi",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406dc",
      "Row Labels": "product management  webinar by CDK global",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406dd",
      "Row Labels":
          "registration started for ethical hacking workshops iitb techfest",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406de",
      "Row Labels": "Robotic Process Automation Conference.",
      "Sum of Chain_Result": 4
    },
    {
      "_id": "662d50313ae1796ad0f406df",
      "Row Labels": "swampUP 2020.",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406e0",
      "Row Labels": "Take Step into statistics  , webinar by hackerrank",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406e1",
      "Row Labels": "TEK system CHAMP 2021",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406e2",
      "Row Labels": "Topcoder competitive programming seminar",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406e3",
      "Row Labels": "tutorial on Agile software development by Quincy larson",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406e4",
      "Row Labels": "virtual internship fair from challenge katta",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406e5",
      "Row Labels": "work from home internship from learntricks edutech",
      "Sum of Chain_Result": 5
    },
    {
      "_id": "662d50313ae1796ad0f406e6",
      "Row Labels": "work with code by code gladiators 2020 on 10 th of april",
      "Sum of Chain_Result": 5
    }
  ];

  List<EventData> _parseEventData() {
    List<EventData> eventsList = [];
    for (var event in eventData) {
      if (event.containsKey('Row Labels') &&
          event.containsKey('Sum of Chain_Result')) {
        eventsList.add(
          EventData(
            event: event['Row Labels'],
            rating: event['Sum of Chain_Result'],
          ),
        );
      }
    }
    return eventsList;
  }

  @override
  Widget build(BuildContext context) {
    List<EventData> events = _parseEventData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildEventTile(events[index]);
        },
      ),
    );
  }

  Widget _buildEventTile(EventData event) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              event.event,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              'Rating: ${event.rating}',
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
