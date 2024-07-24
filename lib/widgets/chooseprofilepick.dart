import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class Chooseprofilepick extends StatefulWidget {
  const Chooseprofilepick({super.key});

  @override
  State<Chooseprofilepick> createState() => _ChooseprofilepickState();
}

class _ChooseprofilepickState extends State<Chooseprofilepick> {
  File? pickedImagefile;

  @override
  Widget build(BuildContext context) {
    void _pickImage() async {
      final selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (selectedImage == null) {
        return;
      }
      setState(() {
        pickedImagefile = File(selectedImage.path);
      });
    }

    //  AssetImage('assets/images/profile.png')
    //   ;
    return Column(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(  
              foregroundImage: pickedImagefile != null
                  ? FileImage(pickedImagefile!)
                  : const AssetImage('assets/images/profile.png'),
              radius: 50,backgroundImage: const AssetImage('assets/images/profile.png') ,
            ),
        )
      ],
    );
  }
}
