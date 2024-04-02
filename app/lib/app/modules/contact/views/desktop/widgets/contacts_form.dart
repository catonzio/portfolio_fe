import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/modules/contact/controllers/contact_controller.dart';
import 'package:portfolio/config/colors.dart';

class ContactsForm extends StatelessWidget {
  const ContactsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController controller = ContactController.to;
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ContactsInput(labelText: "Name"),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ContactsInput(labelText: "Email"),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ContactsInput(labelText: "Subject"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ContactsInput(
              labelText: "Message",
              minLines: 10,
              maxLines: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: controller.sendEmail,
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Send message",
                        style: context.textTheme.bodyLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.email_rounded,
                          color: context.textTheme.bodyLarge?.color,
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactsInput extends StatelessWidget {
  final String labelText;
  final int? minLines;
  final int? maxLines;

  const ContactsInput(
      {super.key, required this.labelText, this.minLines, this.maxLines});

  @override
  Widget build(BuildContext context) {
    final ContactController controller = ContactController.to;

    var textFormField = TextFormField(
        cursorColor: AppColors.lightGrey,
        validator: controller.validators[labelText],
        minLines: minLines,
        maxLines: maxLines,
        showCursor: true,
        autocorrect: true,
        restorationId: labelText,
        onChanged: (String value) => controller.setText(labelText, value),
        initialValue: controller.fieldsText[labelText],
        style: const TextStyle(color: AppColors.darkWhite),
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: AppColors.lightGrey),
          focusColor: Colors.green,
          constraints: const BoxConstraints(maxHeight: 200, minHeight: 50),
          alignLabelWithHint: true,
          labelText: labelText,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ));

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF1f1f1f),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGrey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ]),
          ),
        ),
        minLines != null
            ? InkWell(
                onTap: () => {},
                onHover: (bool value) => controller.isHovering = value,
                child: textFormField,
              )
            : textFormField
      ],
    );
  }
}
