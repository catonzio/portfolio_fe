import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/project_detail/controllers/project_detail_controller.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher_string.dart';

class ProjectDetailMobile extends GetView<ProjectDetailController> {
  const ProjectDetailMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Obx(() => controller.isFetchingReadme.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Markdown(
              selectable: true,
              data: controller.readme.value,
              styleSheet: MarkdownStyleSheet.fromTheme(context.theme),
              softLineBreak: true,
              extensionSet: md.ExtensionSet.gitHubWeb,
              onTapLink: (text, href, title) =>
                  href != null ? launchUrlString(href) : null,
            )),
    );
  }
}
