import 'package:flutter/material.dart';

class ScrollingMessage extends StatefulWidget {
  final List<String> messages;
  const ScrollingMessage({required this.messages, super.key});

  @override
  State<ScrollingMessage> createState() => _ScrollingMessageState();
}

class _ScrollingMessageState extends State<ScrollingMessage> {
  final ScrollController _scrollController = ScrollController();
  // double _scrollOffset = 0.0;
  // double _scrollSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  void _startScrolling() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: widget.messages.length * 100),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        return Container(
          height: 20, // Set the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: widget.messages.length * 2, // Infinite loop
            itemBuilder: (context, index) {
              final messageIndex = index % widget.messages.length;
              return Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  widget.messages[messageIndex],
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
