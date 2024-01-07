import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/config/info.dart';
import 'package:portfolio/data/controllers/email_controller.dart';
import 'package:portfolio/data/models/section.dart';
import 'package:portfolio/widgets/social_link.dart';

class ContactMobile extends StatelessWidget {
  final Section section;
  const ContactMobile(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    double widthP = 90;
    double heightP = 65;
    return Container(
      alignment: Alignment.center,
      width: context.widthP(90),
      padding: EdgeInsets.symmetric(
          horizontal: context.widthP(5), vertical: context.heightP(10)),
      child: Material(
        elevation: 10,
        type: MaterialType.card,
        color: context.colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: context.heightP(heightP) * 0.15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        context.widthP(5), context.heightP(1), 0, 0),
                    child: Text(
                      "Get in touch",
                      style: context.textTheme.headlineLarge,
                    ),
                  ),
                  Divider(
                    thickness: 5,
                    endIndent: context.widthP(widthP) * 0.5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: context.widthP(5), right: context.widthP(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis dolorum dolorem soluta quidem expedita aperiam aliquid at. Totam magni ipsum suscipit amet? Autem nemo esse laboriosam ratione nobis mollitia inventore?",
                    style: context.textTheme.bodyLarge,
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: context.heightP(heightP) * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.location_city),
                            ),
                            AutoSizeText(
                              Info.myInfo['Address']!,
                              maxLines: 1,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.phone),
                            ),
                            AutoSizeText(
                              Info.myInfo['Phone']!,
                              maxLines: 1,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.email),
                            ),
                            AutoSizeText(
                              Info.myInfo['Email']!,
                              maxLines: 1,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: Info.socials
                              .map((key, value) => MapEntry<String, Widget>(
                                  key,
                                  SocialLink(
                                    title: key,
                                    width: context.widthP(10),
                                    height: context.widthP(10),
                                    iconUrl: value['iconUrl'],
                                    url: value['url'],
                                  )))
                              .values
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.heightP(heightP) * 0.1,
              width: context.widthP(widthP) * 0.7,
              child: ElevatedButton(
                  onPressed: () => showDialog(
                        context: context,
                        builder: (context) => ContactDialog(
                          width: context.widthP(widthP) * 0.7,
                          height: context.heightP(heightP) * 0.7,
                        ),
                      ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(Icons.email), Text("Send me a message")],
                  )),
            )
          ],
        ),
      ),
    ).animate().fadeIn(duration: 1000.ms, delay: 500.ms);
  }
}

class ContactDialog extends StatelessWidget {
  final double width;
  final double height;

  const ContactDialog({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    InputDecoration defaultDecoration = InputDecoration(
        fillColor: context.colorScheme.inverseSurface.withOpacity(0.8),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintStyle: context.textTheme.bodyMedium!
            .copyWith(color: context.colorScheme.onInverseSurface));
    TextStyle defaultStyle = context.textTheme.bodyMedium!
        .copyWith(color: context.colorScheme.onInverseSurface);

    EmailController emailController = Get.find<EmailController>();

    return AlertDialog(
      title: const Text("Send me a message"),
      content: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.01),
              child: TextField(
                controller: emailController.nameController,
                style: defaultStyle,
                maxLines: 1,
                decoration: defaultDecoration.copyWith(hintText: 'Enter name'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.01),
              child: TextField(
                controller: emailController.emailController,
                style: defaultStyle,
                maxLines: 1,
                decoration: defaultDecoration.copyWith(hintText: 'Enter email'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.01),
              child: TextField(
                controller: emailController.subjectController,
                style: defaultStyle,
                maxLines: 1,
                decoration:
                    defaultDecoration.copyWith(hintText: 'Enter the subject'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.01),
              child: TextField(
                controller: emailController.bodyController,
                style: defaultStyle,
                minLines: 6,
                maxLines: 15,
                decoration:
                    defaultDecoration.copyWith(hintText: 'Enter the body'),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              emailController.sendEmail();
              Get.back();
            },
            child: const Text("Send")),
      ],
    );
  }
}
