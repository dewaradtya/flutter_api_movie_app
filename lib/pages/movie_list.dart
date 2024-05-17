// Di MovieList atau halaman lain yang Anda inginkan
import 'package:flutter/material.dart';
import 'package:tugas_api/pages/movie_detail.dart';
import 'package:tugas_api/service/http_service.dart';
import 'package:tugas_api/models/movie.dart';
import 'package:tugas_api/layout/bottom_bar.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List<Movie> movies = [];
  late HttpService service;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    service = HttpService();
    initialize();
  }

  Future<void> initialize() async {
    final List<Movie> fetchedMovies = await service.getPopularMovies();

    setState(() {
      movies = fetchedMovies ?? [];
      moviesCount = movies.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              'My',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Cinema',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetail(movies[position]),
                ),
              );
            },
            child: Card(
              color: Colors.black,
              elevation: 2.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/${movies[position].posterPath}',
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movies[position].title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.red, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                '${movies[position].voteAverage.toStringAsFixed(1)} / 10',
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movies[position].overview,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        // Gunakan widget BottomNavBar di sini
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
