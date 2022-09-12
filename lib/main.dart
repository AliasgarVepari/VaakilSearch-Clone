import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

const kLinkStyle = TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
const kSectionHeadingStyle =
    TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20);
const kSectionPadding = EdgeInsets.all(12);
const List<BoxShadow> kBoxShadow = [
  BoxShadow(color:Color(0xFFEEEEEE),offset: Offset.zero,blurRadius: 1.5,spreadRadius: 2.5)
];


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.find_in_page_sharp,
        ),
        label: 'My services'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.payment,
        ),
        label: 'Payments'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.more_vert,
        ),
        label: 'More'),
  ];

  List<Widget> sliderItems = [
    Text('Slider 1'),
    Text('Slider 2'),
    Text('Slider 3'),
    Text('Slider 4'),
  ];

  Container card = Container(
    margin: EdgeInsets.only(top: 5, bottom: 5),
    padding: EdgeInsets.all(20),
    child: Text('Image Box'),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      boxShadow: kBoxShadow,
      color: Colors.white,
    ),
  );

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Row(children: [
          Container(
            padding: EdgeInsets.all(3),
            color: Color(0xFFFED006),
            child: Text(
              'VAKIL',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'SEARCH',
            style: TextStyle(color: Colors.black),
          )
        ]),
        actions: [
          AppBarAction(
              () => null,
              Icon(
                Icons.calendar_today_outlined,
                color: Colors.black,
              )),
          AppBarAction(
              () => null,
              Icon(
                Icons.chat,
                color: Colors.black,
              )),
          AppBarAction(
              () => null,
              Icon(
                Icons.notifications,
                color: Colors.black,
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){},child: Icon(Icons.headset_mic,color:Colors.white,),backgroundColor:Color(0xFF097AFA),),
      body: SafeArea(
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                padding: kSectionPadding,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: kBoxShadow,
                    color: Color(0xFFF7F7F7),
                  ),
                  height: 30,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(shape: BoxShape.circle,color:Color(0xFFFED006)),
                        child: Text('VS',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Text('Search Vakilsearch services'),
                      Container(
                        margin: EdgeInsets.only(right: 7),
                        child: Icon(Icons.search, color: Colors.blueAccent),
                      ),
                    ] 
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.blue,
                child: CarouselSlider(
                  items: sliderItems,
                  options: CarouselOptions(height: 100),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                padding: kSectionPadding,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'All Services',
                            style: kSectionHeadingStyle,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'View all',
                              style: kLinkStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                              size: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        card,
                        card,
                        card,
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        card,
                        card,
                        card,
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                padding: kSectionPadding,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Popular Services',
                            style: kSectionHeadingStyle,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'View all',
                              style: kLinkStyle,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                              size: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      dragStartBehavior: DragStartBehavior.start,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ResuableCard(100, 30, 100, 30),
                          ResuableCard(100, 30, 100, 30),
                          ResuableCard(100, 30, 100, 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                color: Color(0xFFA0D1FD),
                padding: kSectionPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Offers',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            textAlign: TextAlign.left),
                        Text(
                          'this is Offer Description',
                          style: TextStyle(fontSize: 15, color: Colors.black12),
                        ),
                      ],
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      fillColor: Colors.blueAccent,
                      shape: const CircleBorder(),
                      constraints: const BoxConstraints.tightFor(
                        width: 30.0,
                        height: 30.0,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7),
              Container(
                padding: kSectionPadding,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Read articles',
                          style: kSectionHeadingStyle,
                        ),
                        Row(
                          children: [
                            Text('View all', style: kLinkStyle),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                              size: 12,
                            )
                          ],
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      dragStartBehavior: DragStartBehavior.start,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ResuableCard(100, 20, 100, 20),
                          ResuableCard(100, 20, 100, 20),
                          ResuableCard(100, 20, 100, 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7),
              Container(
                color: Colors.white,
                padding: kSectionPadding,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Need Help?',
                          style: kSectionHeadingStyle,
                        ),
                        Text('Need help description'),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            children: [
                              Text('Contact us',
                                  style: TextStyle(color: Colors.black)),
                              SizedBox(width: 7),
                              Icon(Icons.arrow_forward, color: Colors.black,size: 15,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedIconTheme: IconThemeData(color: Colors.black38),
        unselectedLabelStyle: TextStyle(color: Colors.black38),
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }
}

class AppBarAction extends StatelessWidget {
  Function() function;
  Icon icon;

  AppBarAction(this.function, @required this.icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(onPressed: function, icon: icon);
  }
}

class ResuableCard extends StatelessWidget {
  double l, t, r, b;
  ResuableCard(this.l, this.t, this.r, this.b);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(l, t, r, b),
      margin: EdgeInsets.all(10),
      child: Text('text'),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          boxShadow: kBoxShadow,
          color: Colors.white),
    );
  }
}
