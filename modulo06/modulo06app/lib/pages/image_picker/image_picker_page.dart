import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? xFile;

  cropImage(XFile imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      await GallerySaver.saveImage(croppedFile.path);
      xFile = XFile(croppedFile.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Camera"),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return Wrap(
                      children: [
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.camera),
                          title: Text("Camera"),
                          onTap: () async {
                            xFile = await _picker.pickImage(
                                source: ImageSource.camera);
                            if (xFile != null) {
                              Navigator.pop(context);
                              String path = (await path_provider
                                      .getApplicationDocumentsDirectory())
                                  .path;
                              setState(() {});
                              String name = basename(xFile!
                                  .path); // precisa do path.dart para funcionar
                              await xFile!.saveTo("$path/$name");
                              await GallerySaver.saveImage(xFile!.path);
                              cropImage(xFile!);
                            }
                          },
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.images),
                          title: Text("Galeria"),
                          onTap: () async {
                            xFile = await _picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {});
                            Navigator.pop(context);
                            cropImage(xFile!);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Camera"),
            ),
            xFile != null
                ? Container(
                    child: Image.file(File(xFile!.path)),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
