import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/projects/project_model.dart';
import 'package:portfolio/app/shared/ui/widgets/social_buttons.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/constants.dart';

class CollapsedProjectBox extends StatelessWidget {
  final double? collapsedWidth;
  final double? collapsedHeight;
  final bool isDesktop;
  final Project project;

  const CollapsedProjectBox({
    super.key,
    this.collapsedWidth,
    this.collapsedHeight,
    required this.isDesktop,
    required this.project,
  }) : assert(isDesktop ? collapsedWidth != null : collapsedHeight != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: collapsedHeight,
      width: collapsedWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(project.imagePath!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                AppColors.darkGrey.withOpacity(0.7), BlendMode.xor),
            opacity: 0.2),
      ),
      alignment: AlignmentDirectional.bottomEnd,
      child: RotatedBox(
        quarterTurns: isDesktop ? -1 : 0,
        child: Text(
          project.name!.toUpperCase(),
          style: context.theme.textTheme.headlineSmall!.copyWith(
              color: context.theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ExpandedProjectBox extends StatelessWidget {
  final double? expandedHeight;
  final double? expandedWidth;
  final bool isDesktop;
  final Project project;

  const ExpandedProjectBox({
    super.key,
    this.expandedHeight,
    this.expandedWidth,
    required this.isDesktop,
    required this.project,
  }) : assert(isDesktop ? expandedWidth != null : expandedHeight != null);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = (isDesktop
            ? context.textTheme.headlineLarge
            : context.textTheme.titleLarge)!
        .copyWith(
      color: context.theme.colorScheme.onSurfaceVariant,
      fontWeight: FontWeight.bold,
    );
    final TextStyle descriptionStyle =
        (isDesktop ? context.textTheme.bodyLarge : context.textTheme.bodySmall)!
            .copyWith(
      color: context.theme.colorScheme.onSurfaceVariant,
    );

    var buttonStyle = (isDesktop
            ? context.textTheme.titleMedium
            : context.textTheme.bodyMedium)!
        .copyWith(
      color: context.theme.colorScheme.onPrimaryContainer,
    );

    return Container(
      height: expandedHeight,
      width: expandedWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: AssetImage(project.imagePath!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                AppColors.darkGrey.withOpacity(0.7), BlendMode.xor),
            opacity: 0.2),
      ),
      alignment: AlignmentDirectional.bottomEnd,
      child: FractionallySizedBox(
        heightFactor: isDesktop ? 0.7 : 0.7,
        child: Container(
          color: AppColors.lightGrey.withOpacity(0.4),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(project.name!.toUpperCase(), style: titleStyle),
              Text(
                project.description!,
                style: descriptionStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: project.hasGithub
                          ? () {
                              _goToProjectDetail(context, project);
                            }
                          : null,
                      child: Container(
                        height: expandedHeight! * 0.12,
                        width: expandedWidth != null
                            ? expandedWidth! * 0.35
                            : null,
                        decoration: BoxDecoration(
                          color: context.theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        child: Text(
                          project.hasGithub
                              ? "More info".toUpperCase()
                              : "Building...",
                          style: buttonStyle,
                        ),
                      ),
                    ),
                  ),
                  if (project.hasGithub)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinkButton(
                          url: project.githubUrl!,
                          imagePath: Constants.socialLinks['github']!.iconPath!,
                          height: expandedHeight! * 0.12),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _goToProjectDetail(BuildContext context, Project project) {
    Navigator.of(context).pushNamed('/project-detail', arguments: project);
    // Get.toNamed('/project-detail', arguments: project);
    // Future.delayed(Constants.pageTransitionDuration,
    //     () => ProjectDetailController.to.setProject(project));
  }
}
