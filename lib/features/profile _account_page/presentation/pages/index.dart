import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zed_business/core/styles/text.style.dart';

@RoutePage()
class ProfileAccountPage extends ConsumerStatefulWidget {
  static var page;

  const ProfileAccountPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileAccountPageState();
}

class _ProfileAccountPageState extends ConsumerState<ProfileAccountPage> {
  File? pickedImage; // Store the selected image file

  // Image picker logic
  Future<void> pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) {
        debugPrint('No image selected');
        return;
      }
      final tempImage = File(photo.path);

      setState(() {
        pickedImage = tempImage;
        debugPrint('Image picked: ${pickedImage!.path}');
      });
      Navigator.pop(context);
    } catch (error) {
      debugPrint('Error picking image: $error');
    }
  }

  void imagePickerOption() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Container(
              color: Colors.white,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Pick Image From",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              const Color.fromARGB(255, 255, 248, 247))),
                      onPressed: () => pickImage(ImageSource.camera),
                      icon: const Icon(
                        Icons.camera,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "CAMERA",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              const Color.fromARGB(255, 255, 248, 247))),
                      onPressed: () => pickImage(ImageSource.gallery),
                      icon: const Icon(
                        Icons.image,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "GALLERY",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              const Color.fromARGB(255, 255, 248, 247))),
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      label: const Text(
                        "CANCEL",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 10.0,
        toolbarHeight: 60,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 55, 55, 55),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                        ),
                        child: ClipOval(
                          child: pickedImage != null
                              ? Image.file(
                                  pickedImage!,
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 2,
                        child: IconButton(
                          onPressed: imagePickerOption, // Open BottomSheet
                          icon: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45))),
                            padding: EdgeInsets.all(5),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border(),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          minVerticalPadding: 22,
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Row(
                            children: [
                              Text(
                                "SUNNY KHARWAR",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ],
                          ),
                          onTap: () {
                            // print('${service['text']} tapped');
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          minVerticalPadding: 22,
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Row(
                            children: [
                              Text(
                                "SUNNY KHARWAR",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ],
                          ),
                          onTap: () {
                            // print('${service['text']} tapped');
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5)),
                        ),
                        child: ListTile(
                          minVerticalPadding: 22,
                          leading: SvgPicture.asset(
                            "assets/svg/ic_baseline-history.svg",
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Row(
                            children: [
                              Text(
                                "SUNNY KHARWAR",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ],
                          ),
                          onTap: () {
                            // print('${service['text']} tapped');
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Static Logout ListTile
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5)),
                  ),
                  child: ListTile(
                    minVerticalPadding: 22,
                    leading: SvgPicture.asset(
                      "assets/svg/logout.svg",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      'Logout',
                      style: AppTextStyles.appCaptionText(
                              fontWeight: FontWeight.w400)
                          .copyWith(fontSize: 16),
                    ),
                    onTap: () {
                      print('Logout tapped');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
