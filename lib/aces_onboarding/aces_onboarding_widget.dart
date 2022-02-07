import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aces_app_dev/backend/firebase_storage/storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home/home_widget.dart';

class AcesOnboardingWidget extends StatefulWidget {
  const AcesOnboardingWidget({
    Key key,
    this.aceRef,
  }) : super(key: key);

  final DocumentReference aceRef;

  @override
  _AcesOnboardingWidgetState createState() => _AcesOnboardingWidgetState();
}

class _AcesOnboardingWidgetState extends State<AcesOnboardingWidget> {
  AcesRecord aceRecord;
  String radioButtonValue;
  PageController aceOnboardingPageViewController;
  String aceCountryValue;
  TextEditingController aceConfirmPasswordController;
  bool aceConfirmPasswordVisibility;
  TextEditingController aceEmailController;
  TextEditingController aceFirstNameController;
  TextEditingController aceLastNameController;
  TextEditingController aceUsernameController;
  TextEditingController acePasswordController;
  bool acePasswordVisibility;
  TextEditingController aceDateofBirthController;
  TextEditingController aceCityController;
  String aceStateValue;
  TextEditingController aceFavoriteQuoteController;
  TextEditingController aceHobbiesInterestsController;
  TextEditingController acePassionController;
  TextEditingController aceWebsiteController;
  TextEditingController aceInstagramController;
  TextEditingController aceTikTokController;
  String uploadedFileUrl = '';
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Image/Video Picker
  List<Image> _professionalImageListView;
  List<Image> _candidImageListView;
  List<XFile> _professionalImagesUploaded;
  List<XFile> _candidImagesUploaded;
  List<String> _professionalImagePaths;
  List<String> _candidImagePaths;

  dynamic _pickImageError;
  final ImagePicker _picker = ImagePicker();

  void _onImageButtonPressed(
      ImageSource source, int imageIndex, String imageType,
      {BuildContext context, bool isMultiImage = false}) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null) {
        log('No image selected');
      } else {
        final pickedImage = Image.file(
          File(pickedFile.path),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        );
        setState(() {
          if (imageType == 'professional') {
            _professionalImageListView[imageIndex] = pickedImage;
            _professionalImagesUploaded.add(pickedFile);
          } else if (imageType == 'candid') {
            _candidImageListView[imageIndex] = pickedImage;
            _candidImagesUploaded.add(pickedFile);
          }
        });
      }
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  void _uploadApplicationImages() async {
    for (XFile profImg in _professionalImagesUploaded) {
      final imageBytes = await profImg.readAsBytes();
      final downloadUrl = await uploadData(profImg.path, imageBytes);
      _professionalImagePaths.add(downloadUrl);
    }

    for (XFile candImg in _candidImagesUploaded) {
      final imageBytes = await candImg.readAsBytes();
      final downloadUrl = await uploadData(candImg.path, imageBytes);
      _candidImagePaths.add(downloadUrl);
    }
    return;
  }

  @override
  void initState() {
    super.initState();
    aceCityController = TextEditingController();
    aceConfirmPasswordController = TextEditingController();
    aceConfirmPasswordVisibility = false;
    aceEmailController = TextEditingController();
    aceFirstNameController = TextEditingController();
    aceLastNameController = TextEditingController();
    aceUsernameController = TextEditingController();
    acePasswordController = TextEditingController();
    acePasswordVisibility = false;
    radioButtonValue = 'Decline';
    aceDateofBirthController = TextEditingController();
    aceFavoriteQuoteController = TextEditingController();
    aceHobbiesInterestsController = TextEditingController();
    acePassionController = TextEditingController();
    aceWebsiteController = TextEditingController();
    aceInstagramController = TextEditingController();
    aceTikTokController = TextEditingController();
    _professionalImageListView = [
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      )
    ];
    _professionalImagesUploaded = [];
    _professionalImagePaths = [];
    _candidImageListView = [
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/Add-Photo-Square.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      )
    ];
    _candidImagesUploaded = [];
    _candidImagePaths = [];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              // Aces Logo
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                child: Image.asset(
                  'assets/images/ACES_LOGO.png',
                  width: 200,
                  height: 100,
                  fit: BoxFit.fitHeight,
                ),
              ),
              // Ace Onboarding PageView
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Stack(
                            children: [
                              PageView(
                                controller: aceOnboardingPageViewController ??=
                                    PageController(initialPage: 0),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  // AceAccount - Page 1
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 30, 0, 0),
                                          child: Text(
                                            'CREATE ACCOUNT',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.title1
                                                .override(
                                              fontFamily: 'Rubik',
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              fontSize: 32,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Text(
                                            'Create your Aces account.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.subtitle2
                                                .override(
                                              fontFamily: 'Rubik',
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0, -0.8),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 10),
                                          child: Text(
                                            'This information will be hidden from the public.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Rubik',
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16,
                                                    6,
                                                    16,
                                                    MediaQuery.of(context)
                                                        .viewInsets
                                                        .bottom),
                                            child: SingleChildScrollView(
                                                child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 5, 0),
                                                          child: TextFormField(
                                                            controller:
                                                                aceFirstNameController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'First Name',
                                                              labelStyle:
                                                                  FlutterFlowTheme
                                                                      .bodyText1,
                                                              hintText:
                                                                  'First Name',
                                                              hintStyle:
                                                                  FlutterFlowTheme
                                                                      .bodyText1,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme
                                                                      .secondaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme
                                                                      .secondaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                            ),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                            keyboardType:
                                                                TextInputType
                                                                    .name,
                                                            validator: (val) {
                                                              if (val.isEmpty) {
                                                                return 'Field is required';
                                                              }

                                                              return null;
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: TextFormField(
                                                            controller:
                                                                aceLastNameController,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Last Name',
                                                              labelStyle:
                                                                  FlutterFlowTheme
                                                                      .bodyText1,
                                                              hintText:
                                                                  'Last Name',
                                                              hintStyle:
                                                                  FlutterFlowTheme
                                                                      .bodyText1,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme
                                                                      .secondaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme
                                                                      .secondaryColor,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                            ),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                            keyboardType:
                                                                TextInputType
                                                                    .name,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        aceEmailController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Email',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText: 'Email Address',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    validator: (val) {
                                                      if (val.isEmpty) {
                                                        return 'Field is required';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        aceUsernameController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Ace Username',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText: 'Ace Username',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    validator: (val) {
                                                      if (val.isEmpty) {
                                                        return 'Field is required';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        acePasswordController,
                                                    obscureText:
                                                        !acePasswordVisibility,
                                                    decoration: InputDecoration(
                                                      labelText: 'Password',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText:
                                                          'Minimum 8 characters',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      suffixIcon: InkWell(
                                                        onTap: () => setState(
                                                          () => acePasswordVisibility =
                                                              !acePasswordVisibility,
                                                        ),
                                                        child: Icon(
                                                          acePasswordVisibility
                                                              ? Icons
                                                                  .visibility_outlined
                                                              : Icons
                                                                  .visibility_off_outlined,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    validator: (val) {
                                                      if (val.isEmpty) {
                                                        return 'Field is required';
                                                      }
                                                      if (val.length < 8) {
                                                        return 'Requires at least 8 characters.';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        aceConfirmPasswordController,
                                                    obscureText:
                                                        !aceConfirmPasswordVisibility,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Confirm Password',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText:
                                                          'Re-type password',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      suffixIcon: InkWell(
                                                        onTap: () => setState(
                                                          () => aceConfirmPasswordVisibility =
                                                              !aceConfirmPasswordVisibility,
                                                        ),
                                                        child: Icon(
                                                          aceConfirmPasswordVisibility
                                                              ? Icons
                                                                  .visibility_outlined
                                                              : Icons
                                                                  .visibility_off_outlined,
                                                          color:
                                                              Color(0xFF757575),
                                                          size: 22,
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    validator: (val) {
                                                      if (val.isEmpty) {
                                                        return '8';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        aceDateofBirthController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Date of Birth',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText: 'MM/DD/YYYY',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    keyboardType:
                                                        TextInputType.datetime,
                                                    validator: (val) {
                                                      if (val.isEmpty) {
                                                        return 'Field is required';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: FlutterFlowDropDown(
                                                    options: functions
                                                        .getCountries()
                                                        .toList(),
                                                    onChanged: (val) =>
                                                        setState(() =>
                                                            aceCountryValue =
                                                                val),
                                                    width: double.infinity,
                                                    height: 50,
                                                    textStyle: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Rubik',
                                                      color: FlutterFlowTheme
                                                          .secondaryColor,
                                                    ),
                                                    hintText: 'Country',
                                                    fillColor: Colors.white,
                                                    elevation: 4,
                                                    borderColor:
                                                        FlutterFlowTheme
                                                            .secondaryColor,
                                                    borderWidth: 1,
                                                    borderRadius: 12,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 4, 12, 4),
                                                    hidesUnderline: true,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        aceCityController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'City',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText: 'City',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    keyboardType:
                                                        TextInputType.name,
                                                  ),
                                                ),
                                                if ((aceCountryValue) ==
                                                    'United States')
                                                  FlutterFlowDropDown(
                                                    options: functions
                                                        .getStates()
                                                        .toList(),
                                                    onChanged: (val) =>
                                                        setState(() =>
                                                            aceStateValue =
                                                                val),
                                                    width: double.infinity,
                                                    height: 50,
                                                    textStyle: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Rubik',
                                                      color: Colors.black,
                                                    ),
                                                    hintText: 'State',
                                                    fillColor: Colors.white,
                                                    elevation: 4,
                                                    borderColor:
                                                        FlutterFlowTheme
                                                            .secondaryColor,
                                                    borderWidth: 1,
                                                    borderRadius: 12,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 4, 12, 4),
                                                    hidesUnderline: true,
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      if (acePasswordController
                                                              .text !=
                                                          aceConfirmPasswordController
                                                              .text) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            backgroundColor:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                            content: Text(
                                                              "Passwords don't match!",
                                                            ),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      await aceOnboardingPageViewController
                                                          .nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    text: 'CONTINUE',
                                                    options: FFButtonOptions(
                                                      width: 200,
                                                      height: 40,
                                                      color: FlutterFlowTheme
                                                          .secondaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme
                                                              .subtitle1
                                                              .override(
                                                        fontFamily: 'Rubik',
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                      elevation: 2,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 8,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 20.0, width: double.infinity)
                                    ],
                                  ),
                                  // AceProfile - Page 2
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 30, 0, 0),
                                          child: Text(
                                            'ACE PROFILE',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Rubik',
                                              fontSize: 32,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, -1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: Text(
                                            'What makes you an \"Ace\"? ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.subtitle2,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16,
                                                    6,
                                                    16,
                                                    MediaQuery.of(context)
                                                        .viewInsets
                                                        .bottom),
                                            child: SingleChildScrollView(
                                                child: Column(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 2),
                                                    child: Text(
                                                      'Bio',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                          .subtitle2
                                                          .override(
                                                        fontFamily: 'Rubik',
                                                        color: FlutterFlowTheme
                                                            .primaryColor,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Text(
                                                      'This information will be visible to the public on your Ace profile.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Rubik',
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        acePassionController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'What are you passionate about?',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText:
                                                          'i.e. your career, a cause you support, a dream you are pursuing, etc.',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    maxLines: 3,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        aceHobbiesInterestsController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'What are your hobbies or interests?',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText:
                                                          'i.e. traveling, health & fitness, blogging, etc.',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 3,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        aceFavoriteQuoteController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'What is a quote, mantra or saying you live by?',
                                                      labelStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      hintText:
                                                          'i.e. \"My commitment to myself is unbreakable.”',
                                                      hintStyle:
                                                          FlutterFlowTheme
                                                              .bodyText1,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 3,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 2),
                                                    child: Text(
                                                      'Social',
                                                      style: FlutterFlowTheme
                                                          .subtitle2
                                                          .override(
                                                        fontFamily: 'Rubik',
                                                        color: FlutterFlowTheme
                                                            .primaryColor,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Text(
                                                      'This information will be hidden from the public.',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Rubik',
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          controller:
                                                              aceWebsiteController,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Personal Website',
                                                            labelStyle:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                            hintText:
                                                                'i.e. your portfolio, blog, personal business, etc.',
                                                            hintStyle:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme
                                                                    .secondaryColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme
                                                                    .secondaryColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          keyboardType:
                                                              TextInputType.url,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          controller:
                                                              aceInstagramController,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Instagram',
                                                            labelStyle:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                            hintText:
                                                                'Your Instagram username (i.e \"aces_app\")',
                                                            hintStyle:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme
                                                                    .secondaryColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme
                                                                    .secondaryColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          textAlign:
                                                              TextAlign.start,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller:
                                                            aceTikTokController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'TikTok',
                                                          labelStyle:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          hintText:
                                                              'Your TikTok username (i.e \"aces_app\")',
                                                          hintStyle:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .secondaryColor,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                  .secondaryColor,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 20, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await aceOnboardingPageViewController
                                                          .nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    text: 'CONTINUE',
                                                    options: FFButtonOptions(
                                                      width: 200,
                                                      height: 40,
                                                      color: FlutterFlowTheme
                                                          .secondaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme
                                                              .subtitle1
                                                              .override(
                                                        fontFamily: 'Rubik',
                                                        color: FlutterFlowTheme
                                                            .tertiaryColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                      elevation: 2,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius: 8,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: 20.0, width: double.infinity)
                                    ],
                                  ),
                                  // AcePhotos - Page 3
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 50),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'UPLOAD PHOTOS',
                                                style: FlutterFlowTheme.title1
                                                    .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 4, 10, 0),
                                              child: Text(
                                                'Upload at least 5 pictures, including: \n1 professional full body shot, 1 professional head shot, and 1 candid photo. ',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 34, 0, 0),
                                                child: Text(
                                                  'PROFESSIONAL PHOTOS',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .subtitle1
                                                      .override(
                                                    fontFamily: 'Rubik',
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Text(
                                                'Upload at least 1 full body shot and 1 head shot.',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                0,
                                                                'professional',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _professionalImageListView[
                                                                        0]),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                1,
                                                                'professional',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _professionalImageListView[
                                                                        1]),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                2,
                                                                'professional',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _professionalImageListView[
                                                                        2]),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                3,
                                                                'professional',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _professionalImageListView[
                                                                        3]),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                4,
                                                                'professional',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _professionalImageListView[
                                                                        4]),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Text(
                                                  'CANDID PHOTOS',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme
                                                      .subtitle1
                                                      .override(
                                                    fontFamily: 'Rubik',
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Candid photos may be recent photos taken from your mobile device and must be recent, clear, and in color. They may not be selfies or filtered photos.',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(-1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 0),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                0,
                                                                'candid',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _candidImageListView[
                                                                        0]),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                1,
                                                                'candid',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _candidImageListView[
                                                                        1]),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                2,
                                                                'candid',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _candidImageListView[
                                                                        2]),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                3,
                                                                'candid',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _candidImageListView[
                                                                        3]),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            _onImageButtonPressed(
                                                                ImageSource
                                                                    .gallery,
                                                                4,
                                                                'candid',
                                                                context:
                                                                    context,
                                                                isMultiImage:
                                                                    false);
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                  .tertiaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child:
                                                                    _candidImageListView[
                                                                        4]),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0, -0.05),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 1),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_professionalImagesUploaded
                                                                .length <
                                                            2) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              backgroundColor:
                                                                  FlutterFlowTheme
                                                                      .primaryColor,
                                                              content: Text(
                                                                "You must upload at least 2 professional photos.",
                                                              ),
                                                            ),
                                                          );
                                                          return;
                                                        } else if (_candidImagesUploaded
                                                                .length <
                                                            1) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              backgroundColor:
                                                                  FlutterFlowTheme
                                                                      .primaryColor,
                                                              content: Text(
                                                                "You must upload at least 1 candid photo.",
                                                              ),
                                                            ),
                                                          );
                                                          return;
                                                        } else if ((_professionalImagesUploaded
                                                                    .length +
                                                                _candidImagesUploaded
                                                                    .length) <
                                                            5) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              backgroundColor:
                                                                  FlutterFlowTheme
                                                                      .primaryColor,
                                                              content: Text(
                                                                "You must upload at least 5 photos to continue.",
                                                              ),
                                                            ),
                                                          );
                                                          return;
                                                        } else {
                                                          await aceOnboardingPageViewController
                                                              .nextPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        }
                                                      },
                                                      text: 'CONTINUE',
                                                      options: FFButtonOptions(
                                                        width: 200,
                                                        height: 40,
                                                        color: FlutterFlowTheme
                                                            .customColor1,
                                                        textStyle:
                                                            FlutterFlowTheme
                                                                .subtitle2
                                                                .override(
                                                          fontFamily: 'Rubik',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        elevation: 2,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // AceTerms - Page 4
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 50),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'TERMS & CONDITIONS',
                                                style: FlutterFlowTheme.title1
                                                    .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: Text(
                                                'Please read through the terms and conditions below and specify whether you accept/decline at the bottom.',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0, 0.05),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 20, 10, 0),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 1),
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 480,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'These Terms of Use (or \"Terms\") govern your use of Aces, except where we expressly state that separate terms (and not these) apply, and provide information about the Aces Service (the \"Service\"), outlined below. When you create a Aces account or use Aces, you agree to these terms.\n\nARBITRATION NOTICE: YOU AGREE THAT DISPUTES BETWEEN YOU AND US WILL BE RESOLVED BY BINDING, INDIVIDUAL ARBITRATION AND YOU WAIVE YOUR RIGHT TO PARTICIPATE IN A CLASS ACTION LAWSUIT OR CLASS-WIDE ARBITRATION. WE EXPLAIN SOME EXCEPTIONS AND HOW YOU CAN OPT OUT OF ARBITRATION BELOW.\n\nThe Aces Service\nWe agree to provide you with the Aces Service. The Service includes all of the Aces products, features, applications, services, technologies, and software that we provide to advance Instagram\'s mission: To bring you closer to the people and things you love. The Service is made up of the following aspects:\nOffering personalized opportunities to create, connect, communicate, discover, and share.\nPeople are different. We want to strengthen your relationships through shared experiences you actually care about. So we build systems that try to understand who and what you and others care about, and use that information to help you create, find, join, and share in experiences that matter to you. Part of that is highlighting content, features, offers, and accounts you might be interested in, and offering ways for you to experience Instagram, based on things you and others do on and off Instagram.\nFostering a positive, inclusive, and safe environment.\nWe develop and use tools and offer resources to our community members that help to make their experiences positive and inclusive, including when we think they might need help. We also have teams and systems that work to combat abuse and violations of our Terms and policies, as well as harmful and deceptive behavior. We use all the information we have-including your information-to try to keep our platform secure. We also may share information about misuse or harmful content with other Facebook Companies or law enforcement. Learn more in the Data Policy.\nDeveloping and using technologies that help us consistently serve our growing community.\nOrganizing and analyzing information for our growing community is central to our Service. A big part of our Service is creating and using cutting-edge technologies that help us personalize, protect, and improve our Service on an incredibly large scale for a broad global community. Technologies like artificial intelligence and machine learning give us the power to apply complex processes across our Service. Automated technologies also help us ensure the functionality and integrity of our Service.\n\nConnecting you with brands, products, and services in ways you care about.\nWe use data from Aces, as well as from third-party partners, to show you ads, offers, and other sponsored content that we believe will be meaningful to you. And we try to make that content as relevant as all your other experiences on Instagram.\nResearch and innovation.\nWe use the information we have to study our Service and collaborate with others on research to make our Service better and contribute to the well-being of our community.\n',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme
                                                                    .bodyText1,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            90),
                                                                child:
                                                                    FlutterFlowRadioButton(
                                                                  options: [
                                                                    'Accept',
                                                                    'Decline'
                                                                  ],
                                                                  initialValue:
                                                                      'Decline',
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(() =>
                                                                        radioButtonValue =
                                                                            value);
                                                                  },
                                                                  optionHeight:
                                                                      25,
                                                                  textStyle: FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Rubik',
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  buttonPosition:
                                                                      RadioButtonPosition
                                                                          .left,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  radioButtonColor:
                                                                      FlutterFlowTheme
                                                                          .customColor1,
                                                                  inactiveRadioButtonColor:
                                                                      Color(
                                                                          0x8A000000),
                                                                  toggleable:
                                                                      false,
                                                                  horizontalAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 1),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color(
                                                                    0x00FFFFFF),
                                                                Colors.white
                                                              ],
                                                              stops: [0, 0.6],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0, -1),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1),
                                                            ),
                                                          ),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.050000000000000044,
                                                                  0),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (!formKey
                                                                    .currentState
                                                                    .validate()) {
                                                                  return;
                                                                }
                                                                log(radioButtonValue);
                                                                if (radioButtonValue ==
                                                                    'Decline') {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      backgroundColor:
                                                                          FlutterFlowTheme
                                                                              .primaryColor,
                                                                      content:
                                                                          Text(
                                                                        "You must accept the Terms & Conditions.",
                                                                      ),
                                                                    ),
                                                                  );
                                                                  return;
                                                                }
                                                                final user =
                                                                    await createAccountWithEmail(
                                                                  context,
                                                                  aceEmailController
                                                                      .text,
                                                                  acePasswordController
                                                                      .text,
                                                                );
                                                                if (user ==
                                                                    null) {
                                                                  return;
                                                                }

                                                                final usersCreateData =
                                                                    createUsersRecordData(
                                                                  displayName:
                                                                      '${aceFirstNameController.text} ${aceLastNameController.text}',
                                                                  email:
                                                                      aceEmailController
                                                                          .text,
                                                                  username:
                                                                      aceUsernameController
                                                                          .text,
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  dob:
                                                                      aceDateofBirthController
                                                                          .text,
                                                                  city:
                                                                      aceCityController
                                                                          .text,
                                                                  state:
                                                                      aceStateValue,
                                                                  country:
                                                                      aceCountryValue,
                                                                  firstName:
                                                                      aceFirstNameController
                                                                          .text,
                                                                  lastName:
                                                                      aceLastNameController
                                                                          .text,
                                                                );
                                                                await UsersRecord
                                                                    .collection
                                                                    .doc(user
                                                                        .uid)
                                                                    .update(
                                                                        usersCreateData);
                                                                await _uploadApplicationImages();

                                                                final acesCreateData =
                                                                    createAcesRecordData(
                                                                  userRef:
                                                                      currentUserReference,
                                                                  instagram:
                                                                      aceInstagramController
                                                                          .text,
                                                                  tiktok:
                                                                      aceTikTokController
                                                                          .text,
                                                                  applicationStatus:
                                                                      'pending',
                                                                  website:
                                                                      aceWebsiteController
                                                                          .text,
                                                                  hobbiesInterests:
                                                                      aceHobbiesInterestsController
                                                                          .text,
                                                                  photoCount: 0,
                                                                  videoCount: 0,
                                                                  contentCount:
                                                                      0,
                                                                  subscriberCount:
                                                                      0,
                                                                  subscriptionPrice:
                                                                      0.00,
                                                                  favoriteQuote:
                                                                      aceFavoriteQuoteController
                                                                          .text,
                                                                  professionalPhotos:
                                                                      _professionalImagePaths,
                                                                  candidPhotos:
                                                                      _candidImagePaths,
                                                                );
                                                                final acesRecordReference =
                                                                    AcesRecord
                                                                        .collection
                                                                        .doc();
                                                                await acesRecordReference
                                                                    .set(
                                                                        acesCreateData);
                                                                aceRecord = AcesRecord
                                                                    .getDocumentFromData(
                                                                        acesCreateData,
                                                                        acesRecordReference);

                                                                final usersUpdateData =
                                                                    createUsersRecordData(
                                                                  aceRef: aceRecord
                                                                      .reference,
                                                                );
                                                                await currentUserReference
                                                                    .update(
                                                                        usersUpdateData);
                                                                await Navigator
                                                                    .pushAndRemoveUntil(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            HomeWidget(
                                                                      newAce:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                  (r) => false,
                                                                );

                                                                setState(() {});
                                                              },
                                                              text: 'SUBMIT',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 200,
                                                                height: 40,
                                                                color: FlutterFlowTheme
                                                                    .customColor1,
                                                                textStyle:
                                                                    FlutterFlowTheme
                                                                        .subtitle2
                                                                        .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: FlutterFlowTheme
                                                                      .tertiaryColor,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                                elevation: 2,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius: 8,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // PageView Page Indicator
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: SmoothPageIndicator(
                                    controller:
                                        aceOnboardingPageViewController ??=
                                            PageController(initialPage: 0),
                                    count: 4,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      aceOnboardingPageViewController
                                          .animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: ExpandingDotsEffect(
                                      expansionFactor: 2,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 16,
                                      dotHeight: 4,
                                      dotColor: Color(0x8AC6CAD4),
                                      activeDotColor:
                                          FlutterFlowTheme.secondaryColor,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
