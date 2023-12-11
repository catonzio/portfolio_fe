import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/dimensions.dart';
import 'package:portfolio/config/themes.dart';
import 'package:portfolio/controllers/email_controller.dart';
import 'package:portfolio/controllers/section_controller.dart';
import 'dart:html' as html;

class ContactDesktop extends StatelessWidget {
  final SectionController sectionController;
  const ContactDesktop(this.sectionController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width(context, perc: 15),
          vertical: Dimensions.height(context, perc: 15)),
      child: Material(
        elevation: 10,
        type: MaterialType.card,
        color: Themes.colorScheme(context).surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: getFirstColumn(context, 30, 65),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: getSecondColumn(context, 30, 65),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 1000.ms, delay: 500.ms);
  }

  Widget getFirstColumn(BuildContext context, double widthP, double heightP) {
    InputDecoration defaultDecoration = InputDecoration(
        fillColor: Themes.colorScheme(context).inverseSurface.withOpacity(0.8),
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintStyle: Themes.textTheme(context)
            .bodyMedium!
            .copyWith(color: Themes.colorScheme(context).onInverseSurface));
    TextStyle defaultStyle = Themes.textTheme(context)
        .bodyMedium!
        .copyWith(color: Themes.colorScheme(context).onInverseSurface);

    EmailController emailController = Get.put(EmailController());
    return Container(
      width: Dimensions.width(context, perc: widthP),
      height: Dimensions.height(context, perc: heightP),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: Dimensions.height(context, perc: heightP) * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Send me a message",
                  style: Themes.textTheme(context).headlineLarge,
                ),
                Divider(
                  thickness: 5,
                  endIndent: Dimensions.width(context, perc: widthP) * 0.5,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: emailController.nameController,
                  style: defaultStyle,
                  maxLines: 1,
                  decoration:
                      defaultDecoration.copyWith(hintText: 'Enter name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: emailController.emailController,
                  style: defaultStyle,
                  maxLines: 1,
                  decoration:
                      defaultDecoration.copyWith(hintText: 'Enter email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: emailController.subjectController,
                  style: defaultStyle,
                  maxLines: 1,
                  decoration:
                      defaultDecoration.copyWith(hintText: 'Enter the subject'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
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
          Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => emailController.sendEmail(),
                child: const Text("Send"),
              ))
        ],
      ),
    );
  }

  Widget getSecondColumn(BuildContext context, double widthP, double heightP) {
    return Container(
      width: Dimensions.width(context, perc: widthP),
      height: Dimensions.height(context, perc: heightP),
      alignment: Alignment.center,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Dimensions.height(context, perc: heightP) * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Get in touch",
                    style: Themes.textTheme(context).headlineLarge,
                  ),
                  Divider(
                    thickness: 5,
                    endIndent: Dimensions.width(context, perc: widthP) * 0.5,
                  ),
                ],
              ),
            ),
            AutoSizeText(
              "Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis dolorum dolorem soluta quidem expedita aperiam aliquid at. Totam magni ipsum suscipit amet? Autem nemo esse laboriosam ratione nobis mollitia inventore?",
              style: Themes.textTheme(context).bodyLarge,
              maxLines: 4,
            ),
            SizedBox(
              height: Dimensions.height(context, perc: heightP) * 0.30,
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
                      Text(Configs.myInfo['Address']!)
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.phone),
                      ),
                      Text(Configs.myInfo['Phone']!)
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.email),
                      ),
                      Text(Configs.myInfo['Email']!)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: Configs.socials
                        .map((key, value) => MapEntry<String, Widget>(
                            key,
                            SocialLink(
                              title: key,
                              iconUrl: value['iconUrl'],
                              url: value['url'],
                            )))
                        .values
                        .toList(),
                  )
                ],
              ),
            )
          ]),
    );
  }
}

class SocialLink extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String url;

  const SocialLink({
    super.key,
    required this.title,
    required this.iconUrl,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return
        // Padding(
        //   padding: const EdgeInsets.only(right: 8),
        //   child: Container(
        //     width: Dimensions.width(context, perc: 3),
        //     height: Dimensions.width(context, perc: 3),
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Themes.colorScheme(context).surface.withOpacity(0.5),
        //     ),
        //     child: InkWell(
        //       onTap: () => html.window.open(url, 'new tab'),
        //       child: Tooltip(
        //         padding: const EdgeInsets.all(8),
        //         message: title,
        //         child: ClipOval(
        //           child: Image.asset(
        //             iconUrl,
        //             fit: BoxFit.contain,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),

        Padding(
      padding: const EdgeInsets.only(right: 16, top: 16),
      child: GestureDetector(
        onTap: () => html.window.open(url, 'new tab'),
        child: Container(
          width: Dimensions.width(context, perc: 1.5),
          height: Dimensions.width(context, perc: 1.5),
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(iconUrl),
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
