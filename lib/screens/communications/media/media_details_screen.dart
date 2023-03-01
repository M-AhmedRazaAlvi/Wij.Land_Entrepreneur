import 'package:flutter/material.dart';
import 'package:wij_land/screens/communications/media/widgets/media_desc_card_widget.dart';
import 'package:wij_land/screens/communications/media/widgets/media_title_card_widget.dart';

import '../../../utils/functions.dart';

class MediaDetailScreen extends StatefulWidget {
  const MediaDetailScreen({Key? key}) : super(key: key);

  @override
  State<MediaDetailScreen> createState() => _MediaDetailScreenState();
}

class _MediaDetailScreenState extends State<MediaDetailScreen> {
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
              MediaTitleCardWidget('title', 'counts'),
              SizedBox(height: 8),
              MediaDescCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
