import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ott_platform/amezon_screen.dart';
import 'package:ott_platform/hostar_screen.dart';
import 'netflix_screen.dart';

class StreamHome extends StatefulWidget {
  const StreamHome({Key? key}) : super(key: key);

  @override
  State<StreamHome> createState() => _StreamHomeState();
}

class _StreamHomeState extends State<StreamHome> {
  var currentpos=0;
  final List<Platforms> platforms = [
    Platforms(
        name: 'Netflix', logo: 'assets/netflix.png', designUI: NetflixScreen()),
    Platforms(
        name: 'Amazon Prime', logo: 'assets/am1.png', designUI: AmzaonScreen()),
    Platforms(
        name: 'Disney+HotStar ',
        logo: 'assets/hotstar.png',
        designUI: HotstarScreen()),
  ];
  final List<String> introimage=[
    'assets/movie1.jpg',
    'assets/movie2.jpg',
    'assets/movie3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.red,
        title: Text(
          'StreamHub App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.videocam_circle_fill,
              size: 30,
              color: Colors.indigo,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search_circle_fill,
              size: 30,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        unselectedItemColor: Colors.white.withOpacity(0.7),
        elevation: 5,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Library'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Text(
                'Popular on App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            CarouselSlider(
              items: introimage.map((e) {
                return Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(e)),
                      borderRadius: BorderRadius.circular(15)),
                );
              }).toList(),
              options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentpos = index;
                  },
                  );
                },
              ),
            ),
            Center(
              child: CarouselIndicator(
                color: Colors.white,
                activeColor: Colors.blueAccent,
                count: introimage.length,
                index: currentpos,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'OTT Apps',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Container(height: 120,
              child: ListView.builder(
                itemCount: platforms.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final platform = platforms[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => platform.designUI));
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: CircleAvatar(
                            foregroundImage: AssetImage(
                              platforms[index].logo,
                            ),
                            radius: 40,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Trending Now',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 390,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/movie.jpg')),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Platforms {
  final String name;
  final String logo;
  final Widget designUI;

  Platforms({required this.name, required this.logo, required this.designUI});
}