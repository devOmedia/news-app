import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/controller/app_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.refresh(controller);
        },
        child: ref.watch(controller).when(
              data: (data) {
                return ListView.builder(
                  itemCount: data?.totalResults,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          ///IMAGE
                          CachedNetworkImage(
                            imageUrl: "http://via.placeholder.com/200x150",
                            //data?.articles[index].urlToImage ?? "",
                            imageBuilder: (context, imageProvider) => Container(
                              height: size.height * 0.2,
                              width: size.width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            children: [
                              SizedBox(
                                width: size.width * 0.4,
                                child: const Text(
                                  // data?.articles[0].title ?? "",
                                  "dnadkn idasndkan dnadnas dioadasndof asksanfioa fas"
                                  "fnkasnfioa fnioa f afksnafaosi  asfnafs",
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: size.width * 0.4,
                                child: Text(
                                  // data?.articles[0].description ?? "",
                                  "dnadkn idasndkan dnadnas dioadasndof asksanfioa fas"
                                  "fnkasnfioa fnioa f afksnafaosi  asfnafs"
                                  "jsnfknanknasknfknas asknksanfa"
                                  "snakfnknafnkfanfkank",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              error: (Object error, StackTrace stackTrace) {
                return Text(error.toString());
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
