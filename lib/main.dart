//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Profile(),
    theme: ThemeData(fontFamily: 'Poppins'),
  ));
}

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter = counter + 1;
          });
        },
        shape: CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          child: Icon(Icons.add),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade800, Colors.deepPurpleAccent],
              )),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade800, Colors.deepPurpleAccent],
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 110.0,
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundImage: AssetImage('assets/erza.jpg'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Erza Scarlet',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'S Class Mage',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    )
                  ]),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                    color: Colors.grey[200], child: InformationWidget()),
              ),
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              left: 20.0,
              right: 20.0,
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoBoxItem(
                      title: 'Battles',
                      text: '$counter',
                    ),
                    InfoBoxItem(title: "Birthday", text: "April 7th"),
                    InfoBoxItem(title: "Age", text: "19 yrs")
                  ],
                ),
              )))
        ],
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  InformationWidget({super.key});
  final List<InformationItem> _informationItems = [
    InformationItem(
      icondata: Icons.home,
      color: Colors.blueAccent[400]!,
      title: 'Guild',
      details: 'FairyTail, Magnolia',
    ),
    InformationItem(
        icondata: Icons.auto_awesome,
        color: Colors.yellowAccent[400]!,
        title: "Magic",
        details: "Spatial & Sword Magic, Telekinesis"),
    InformationItem(
        icondata: Icons.favorite,
        color: Colors.pinkAccent[400]!,
        title: "Loves",
        details: "Eating cakes"),
    InformationItem(
        icondata: Icons.people,
        color: Colors.lightGreen[400]!,
        title: "Team",
        details: "Team Natsu"),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
            child: Container(
                width: 310.0,
                height: 290.0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Information",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      Container(
                        height: 230,
                        child: ListView.separated(
                            itemBuilder: (context, index) =>
                                _informationItems[index],
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                            itemCount: _informationItems.length),
                      )
                    ],
                  ),
                ))));
  }
  /*
  Widget build_old(BuildContext context) {
    return Center(
        child: Card(
            margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
            child: Container(
                width: 310.0,
                height: 290.0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Information",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                      ),
                      InformationItem(
                        icondata: Icons.home,
                        color: Colors.blueAccent[400]!,
                        title: 'Guild',
                        details: 'FairyTail, Magnolia',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InformationItem(
                          icondata: Icons.auto_awesome,
                          color: Colors.yellowAccent[400]!,
                          title: "Magic",
                          details: "Spatial & Sword Magic, Telekinesis"),
                      SizedBox(
                        height: 20.0,
                      ),
                      InformationItem(
                          icondata: Icons.favorite,
                          color: Colors.pinkAccent[400]!,
                          title: "Loves",
                          details: "Eating cakes"),
                      InformationItem(
                          icondata: Icons.people,
                          color: Colors.lightGreen[400]!,
                          title: "Team",
                          details: "Team Natsu"),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ))));
  }

  Widget build_new(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemBuilder: (context, index) => _informationItems[index],
        separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
        itemCount: _informationItems.length);
  }
*/
}

class InfoBoxItem extends StatelessWidget {
  const InfoBoxItem({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey[400], fontSize: 14.0),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
          ),
        )
      ],
    ));
  }
}

class InformationItem extends StatelessWidget {
  const InformationItem({
    super.key,
    required this.icondata,
    required this.color,
    required this.title,
    required this.details,
  });
  final IconData icondata;
  final Color color;
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icondata,
          color: color,
          size: 35,
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Text(
              details,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[400],
              ),
            )
          ],
        )
      ],
    );
  }
}
