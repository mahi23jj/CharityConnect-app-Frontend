import 'package:flutter/material.dart';
import 'package:travel/base_Data/customize.dart';

class StoryViewer extends StatelessWidget {
  final List<String> storyImages = [
  'asset/images/logo1.jpg',
  'asset/images/logo1.jpg',
  'asset/images/logo1.jpg'
  ];
   Customize items = Customize();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // Fits the stories and usernames
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: storyImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Open the full-screen story viewer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenStoryViewer(
                    stories: storyImages,
                    initialIndex: index,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  // Circular Story Container
                  Container(
                    padding: EdgeInsets.all(3), // Border thickness
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: items.basecolor, width: 3), // Instagram-like border
                    ),
                    child: CircleAvatar(
                      radius: 35, // Profile size
                      backgroundImage: AssetImage(storyImages[index]), // Replace with NetworkImage for real data
                    ),
                  ),

                  // Username or Name under Story
                  SizedBox(height: 5),
                  Text(
                    "User $index",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenStoryViewer extends StatefulWidget {
  final List<String> stories;
  final int initialIndex;

  FullScreenStoryViewer({required this.stories, required this.initialIndex});

  @override
  _FullScreenStoryViewerState createState() => _FullScreenStoryViewerState();
}

class _FullScreenStoryViewerState extends State<FullScreenStoryViewer> {
  PageController? _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);

    // Auto-switch stories every 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      if (_currentIndex < widget.stories.length - 1) {
        _pageController?.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        Navigator.pop(context); // Close viewer when last story is reached
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // PageView to swipe between stories
          PageView.builder(
            controller: _pageController,
            itemCount: widget.stories.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Center(
                child: Image.asset(
                  widget.stories[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            },
          ),

          // Close Button
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
