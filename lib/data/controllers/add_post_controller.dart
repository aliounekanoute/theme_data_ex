

import 'package:flutter/material.dart';
import 'package:theme_data_ex/data/models/post_model.dart';

class AddPostController {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  Post getPost() => Post(
    title: title.text, 
    body: body.text
  );
}
