import 'package:flutter/material.dart';

class HotstarScreen extends StatefulWidget {
  const HotstarScreen({Key? key}) : super(key: key);

  @override
  State<HotstarScreen> createState() => _HotstarScreenState();
}

class _HotstarScreenState extends State<HotstarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Color(0xff3318ab)]),
          ),
        ),
        elevation: 0,
        actions: [Image.asset('assets/hotstar.png')],
        title: Text('Disney+HotStar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Moive'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Shows'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download), label: 'Downloads'),
        ],
      ),
      body: ListView(
        children: [
          _buildFeaturedContent(),
          _buildCategories(),
          _buildPopularShows()
        ],
      ),
    );
  }

  Widget _buildFeaturedContent() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/hotstar.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.black.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Content',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Watch the latest Movies and TV shows',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem('Movies', 'assets/movie.jpg'),
              _buildCategoryItem('TV Shows', 'assets/tvshows.jpg'),
              _buildCategoryItem('Sports', 'assets/sports.jpeg'),
              _buildCategoryItem('News', 'assets/news.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, String image) {
    return Column(
      children: [
        Card(
          child: Image.asset(
            image,
            fit: BoxFit.fill,
            height: 50,
            width: 50,
          ),
        ),
        SizedBox(height: 8),
        Text(title),
      ],
    );
  }

  Widget _buildShowItem(String title, String imageUrl) {
    return AspectRatio(
      aspectRatio: 5 / 4,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularShows() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Shows',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildShowItem('Game of Thrones', 'assets/game.png'),
                _buildShowItem('Breaking Bad', 'assets/bad.png'),
                _buildShowItem('Stranger Things', 'assets/thi.png'),
                _buildShowItem('The Office', 'assets/the.jpeg'),
                _buildShowItem('MAI', 'assets/web1.jpeg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}