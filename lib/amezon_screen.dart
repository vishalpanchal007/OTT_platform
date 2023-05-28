import 'package:flutter/material.dart';

class AmzaonScreen extends StatefulWidget {
  const AmzaonScreen({Key? key}) : super(key: key);

  @override
  State<AmzaonScreen> createState() => _AmzaonScreenState();
}

class _AmzaonScreenState extends State<AmzaonScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [HomeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff000080),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text('Amazon Prime'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Moive'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Shows'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_download), label: 'Downloads'),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(16),
      children: [
        _buildTopBanner(),
        SizedBox(height: 16),
        _buildCategoryList(),
        SizedBox(height: 16),
        _buildPopularMovies(),
        SizedBox(height: 16),
        _buildRecommendedShows()
      ],
    );
  }

  Widget _buildTopBanner() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/movie.jpg'),
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Top Banner',
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 8),
        Container(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryItem('Action', 'assets/action.jpeg'),
              _buildCategoryItem('Adventure', 'assets/ads.jpeg'),
              _buildCategoryItem('Comedy', 'assets/comedy.png'),
              _buildCategoryItem('Drama', 'assets/drama.jpeg'),
              _buildCategoryItem('Fantasy', 'assets/fan.jpeg'),
              _buildCategoryItem('Thriller', 'assets/thi.png'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCategoryItem(String title, String image) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      width: 100.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPopularMovies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Movies",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildMovieItem('assets/movie1.jpg'),
              _buildMovieItem('assets/movie2.jpg'),
              _buildMovieItem('assets/movie3.jpg'),
              _buildMovieItem('assets/movie4.jpg'),
              _buildMovieItem('assets/movie5.jpg'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMovieItem(String title) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 120,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Image.asset(
          title,
          fit: BoxFit.fill,
          height: 200,

        ),
      ),
    );
  }

  Widget _buildShowItem(String title) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      width: 120.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildRecommendedShows() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Shows',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildShowItem('Shows 1'),
              _buildShowItem('Shows 2'),
              _buildShowItem('Shows 3'),
              _buildShowItem('Shows 4'),
              _buildShowItem('Shows 5'),
            ],
          ),
        )
      ],
    );
  }
}