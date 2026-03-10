import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import '../core/app_color.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  Set<int> bookmarkedMovies = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: const Text("Welcome 064"),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          bool isBookmarked = bookmarkedMovies.contains(index);

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        movie.imgUrl,
                        width: 80,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${movie.title} (${movie.year})",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            movie.genre,
                            style: const TextStyle(color: Colors.grey),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 18),
                              const SizedBox(width: 4),
                              Text("${movie.rating}/10"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: isBookmarked ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isBookmarked) {
                            bookmarkedMovies.remove(index);
                          } else {
                            bookmarkedMovies.add(index);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}