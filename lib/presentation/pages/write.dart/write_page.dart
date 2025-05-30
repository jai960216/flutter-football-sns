import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mercenaryhub/core/loading_bar.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/content_text_form_field.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/cost_text_form_field.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/date_icon.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/date_text_form_field.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/level_dropdown_form_field.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/name_text_form_field.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/person_text_form_field.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/image_bottom_sheet.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/image_viewer.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/location_icon.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/location_text_form_field.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/post_button.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/team_text_form_field.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/time_icon.dart';
import 'package:mercenaryhub/presentation/pages/write.dart/widgets/time_text_form_field.dart';

class WritePage extends ConsumerStatefulWidget {
  final BuildContext homeContext;
  final String typeText;

  const WritePage({
    super.key,
    required this.homeContext,
    required this.typeText,
  });

  @override
  ConsumerState<WritePage> createState() => _WritePageState();
}

class _WritePageState extends ConsumerState<WritePage> {
  final formKey = GlobalKey<FormState>();
  final locationTextController = TextEditingController();
  final teamTextController = TextEditingController();
  final costTextController = TextEditingController();
  final personTextController = TextEditingController();
  final dateTextController = TextEditingController();
  final startTimeTextController = TextEditingController();
  final endTimeTextController = TextEditingController();
  final imagePathTextController = TextEditingController();
  final contentTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final LoadingOverlay loadingOverlay = LoadingOverlay();

  @override
  void dispose() {
    super.dispose();
    locationTextController.dispose();
    teamTextController.dispose();
    costTextController.dispose();
    personTextController.dispose();
    dateTextController.dispose();
    startTimeTextController.dispose();
    endTimeTextController.dispose();
    imagePathTextController.dispose();
    contentTextController.dispose();
    nameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('❤️❤️❤️❤️');
    print(widget.typeText);
    print('❤️❤️❤️❤️');

    final scaffoldPadding = MediaQuery.of(context).padding;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xff222222),
              shape: Border(
                bottom: BorderSide(
                  color: Colors.grey[300]!,
                ),
              ),
              actions: [
                PostButton(
                  formKey: formKey,
                  costTextController: costTextController,
                  personTextController: personTextController,
                  teamTextController: teamTextController,
                  nameTextController: nameTextController,
                  contentTextController: contentTextController,
                  loadingOverlay: loadingOverlay,
                  homeContext: widget.homeContext,
                  typeText: widget.typeText,
                ),
              ],
              actionsPadding: EdgeInsets.only(right: 20)),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                padding: const EdgeInsets.only(bottom: 400),
                children: [
                  Row(
                    children: [
                      LocationTextFormField(controller: locationTextController),
                      LocationIcon(
                        controller: locationTextController,
                        loadingOverlay: loadingOverlay,
                      ),
                    ],
                  ),
                  widget.typeText == '용병'
                      ? NameTextFormField(controller: nameTextController)
                      : TeamTextFormField(controller: teamTextController),
                  CostTextFormField(controller: costTextController),
                  widget.typeText == '용병'
                      ? SizedBox()
                      : PersonTextFormField(controller: personTextController),
                  LevelDropdownFormField(typeText: widget.typeText),
                  Row(
                    children: [
                      DateTextFormField(controller: dateTextController),
                      DateIcon(controller: dateTextController),
                    ],
                  ),
                  Row(
                    children: [
                      TimeTextFormField(
                        controller: startTimeTextController,
                        type: 'start',
                      ),
                      TimeIcon(
                        controller: startTimeTextController,
                        type: 'start',
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TimeTextFormField(
                        controller: endTimeTextController,
                        type: 'end',
                      ),
                      TimeIcon(
                        controller: endTimeTextController,
                        type: 'end',
                      ),
                    ],
                  ),
                  ContentTextFormField(
                    controller: contentTextController,
                    typeText: widget.typeText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ImageViewer(),
                ],
              ),
            ),
          ),
          bottomSheet: ImageBottomSheet(
            scaffoldPadding: scaffoldPadding,
            controller: imagePathTextController,
            loadingOverlay: loadingOverlay,
          ),
        ),
      ),
    );
  }
}
