import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Homepage/model/content.dart';
import 'package:travel/Homepage/view/widgets/contentcard.dart';
import 'package:travel/Homepage/viewmode/Bloc/homebloc.dart';
import 'package:travel/Homepage/viewmode/Event/homeevent.dart';
import 'package:travel/Homepage/viewmode/state/home_sate.dart';
import 'package:travel/base_Data/customize.dart';
import 'package:travel/Homepage/view/widgets/story_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Customize items = Customize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                          image: AssetImage('asset/images/main_logo.png'),
                          height: 80,
                          width: 80),
                      Text(
                        'Charity',
                        style: TextStyle(
                            color: items.basecolor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.search,
                    color: items.basecolor,
                    size: 30,
                  ),
                ],
              ),
            ),
            StoryViewer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: items.basecolor),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            BlocBuilder<CommentProvider, Conetntstate>(
                builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadcontentState) {
                return Column(
                  children: List.generate(
                      state.date.length,
                      (index) => ContentCard(content: state.date[index])), // Display all items inside the scrollable page
                );
              } else if (state is ErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }
              return const Center(
                child: Text('Nothing is loded'),
              );
            })
          ],
        ),
      ),
    );
  }
}

