import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: "http://via.placeholder.com/200x150",
              //data?.articles[index].urlToImage ?? "",
              imageBuilder: (context, imageProvider) => Container(
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 8),

            ///TITLE
            const Text(
              // data?.articles[0].title ?? "",
              "dnadkn idasndkan dnadnas dioadasndof asksanfioa fas"
              "fnkasnfioa fnioa f afksnafaosi  asfnafs",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
             Text(
              // data?.articles[0].title ?? "",
              "2 january 2023",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600
              ),
            ),
          const SizedBox(height: 8),
            const Text(
              // data?.articles[0].title ?? "",
              "dnadkn idasndkan dnadnas dioadasndof asksanfioa fas"
                  "fnkasnfioa fnioa f afksnafaosi  asfnafs",
              style: TextStyle(fontSize: 16,),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
