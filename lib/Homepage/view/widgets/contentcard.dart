import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/Homepage/model/content.dart';
import 'package:travel/Homepage/viewmode/Bloc/homebloc.dart';
import 'package:travel/Homepage/viewmode/Event/homeevent.dart';
import 'package:travel/Homepage/viewmode/state/home_sate.dart';
import 'package:travel/base_Data/customize.dart';

class ContentCard extends StatefulWidget {
  final Content content;

  const ContentCard({Key? key, required this.content}) : super(key: key);

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool isLiked = false;
  Customize items = Customize();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.content.profile),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.content.username,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: items.font,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context
                      .read<CommentProvider>()
                      .add(Followcontent(widget.content.id));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: BoxBorder.all(color: items.basecolor, width: 1),
                      color: widget.content.isFollowed
                          ? Colors.white
                          : items.basecolor,
                      borderRadius: BorderRadius.circular(10)),
                  child: widget.content.isFollowed
                      ? Text(
                          'Following',
                          style:
                              TextStyle(color: items.basecolor, fontSize: 24),
                        )
                      : Text(
                          'Follow',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                ),
              )

              // Icon(Icons.add, color: items.basecolor, size: 24),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${widget.content.username}: ${widget.content.discription}',
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 650,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.content.post),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      widget.content.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: widget.content.isLiked ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      context
                          .read<CommentProvider>()
                          .add(Likecontent(widget.content.id));
                    },
                  ),
                  const SizedBox(width: 20),
                  Text('${widget.content.likes}'),
                  const Icon(Icons.mode_comment_outlined),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Donate',
                  style: TextStyle(
                    color: items.basecolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
