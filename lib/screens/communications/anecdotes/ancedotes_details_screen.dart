import 'package:flutter/material.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_desc_card_widget.dart';
import 'package:wij_land/screens/communications/anecdotes/widgets/anecdotes_title_card_widget.dart';

import '../../../utils/functions.dart';

class AnecdotesDetailScreen extends StatefulWidget {
  const AnecdotesDetailScreen({Key? key}) : super(key: key);

  @override
  State<AnecdotesDetailScreen> createState() => _AnecdotesDetailScreenState();
}

class _AnecdotesDetailScreenState extends State<AnecdotesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          width: getWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              AnecdotesTitleCardWidget('title', 'counts'),
              SizedBox(height: 8),
              AnecdotesDescCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
