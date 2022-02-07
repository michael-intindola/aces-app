import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FanOnboardingWidget extends StatefulWidget {
  const FanOnboardingWidget({Key key}) : super(key: key);

  @override
  _FanOnboardingWidgetState createState() => _FanOnboardingWidgetState();
}

class _FanOnboardingWidgetState extends State<FanOnboardingWidget> {
  PageController fanOnboardingPageViewController;
  TextEditingController fanConfirmPasswordController;
  bool fanConfirmPasswordVisibility;
  TextEditingController fanEmailController;
  TextEditingController fanNameController;
  TextEditingController fanUsernameController;
  TextEditingController fanPasswordController;
  bool fanPasswordVisibility;
  TextEditingController fanDateofBirthController;
  TextEditingController fanZipCodeController;
  String radioButtonValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fanConfirmPasswordController = TextEditingController();
    fanConfirmPasswordVisibility = false;
    fanEmailController = TextEditingController();
    fanNameController = TextEditingController();
    fanUsernameController = TextEditingController();
    fanPasswordController = TextEditingController();
    fanPasswordVisibility = false;
    fanDateofBirthController = TextEditingController();
    fanZipCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                child: Image.asset(
                  'assets/images/ACES_LOGO.png',
                  width: 200,
                  height: 100,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Stack(
                        children: [
                          PageView(
                            controller: fanOnboardingPageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 50),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Text(
                                              'FAN PROFILE',
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
                                          Text(
                                            'Enter your profile information.',
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
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 1),
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 520,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                              .tertiaryColor,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          10),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        fanNameController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Name',
                                                                      labelStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      hintText:
                                                                          'Full Name',
                                                                      hintStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1,
                                                                    validator:
                                                                        (val) {
                                                                      if (val
                                                                          .isEmpty) {
                                                                        return 'Field is required';
                                                                      }

                                                                      return null;
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        fanEmailController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Email',
                                                                      labelStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      hintText:
                                                                          'Email Address',
                                                                      hintStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1,
                                                                    validator:
                                                                        (val) {
                                                                      if (val
                                                                          .isEmpty) {
                                                                        return 'Field is required';
                                                                      }

                                                                      return null;
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        fanUsernameController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Username',
                                                                      labelStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      hintText:
                                                                          'Username',
                                                                      hintStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1,
                                                                    validator:
                                                                        (val) {
                                                                      if (val
                                                                          .isEmpty) {
                                                                        return 'Field is required';
                                                                      }

                                                                      return null;
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        fanPasswordController,
                                                                    obscureText:
                                                                        !fanPasswordVisibility,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Password',
                                                                      labelStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      hintText:
                                                                          'Password',
                                                                      hintStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      suffixIcon:
                                                                          InkWell(
                                                                        onTap: () =>
                                                                            setState(
                                                                          () => fanPasswordVisibility =
                                                                              !fanPasswordVisibility,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          fanPasswordVisibility
                                                                              ? Icons.visibility_outlined
                                                                              : Icons.visibility_off_outlined,
                                                                          color:
                                                                              Color(0xFF757575),
                                                                          size:
                                                                              22,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1,
                                                                    validator:
                                                                        (val) {
                                                                      if (val
                                                                          .isEmpty) {
                                                                        return 'Field is required';
                                                                      }
                                                                      if (val.length <
                                                                          8) {
                                                                        return 'Requires at least 8 characters.';
                                                                      }
                                                                      return null;
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        fanConfirmPasswordController,
                                                                    obscureText:
                                                                        !fanConfirmPasswordVisibility,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Confirm Password',
                                                                      labelStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      hintText:
                                                                          'Password',
                                                                      hintStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      suffixIcon:
                                                                          InkWell(
                                                                        onTap: () =>
                                                                            setState(
                                                                          () => fanConfirmPasswordVisibility =
                                                                              !fanConfirmPasswordVisibility,
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          fanConfirmPasswordVisibility
                                                                              ? Icons.visibility_outlined
                                                                              : Icons.visibility_off_outlined,
                                                                          color:
                                                                              Color(0xFF757575),
                                                                          size:
                                                                              22,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1,
                                                                    validator:
                                                                        (val) {
                                                                      if (val
                                                                          .isEmpty) {
                                                                        return '8';
                                                                      }

                                                                      return null;
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        fanDateofBirthController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Date of Birth',
                                                                      labelStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      hintText:
                                                                          'Birthday',
                                                                      hintStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .datetime,
                                                                    validator:
                                                                        (val) {
                                                                      if (val
                                                                          .isEmpty) {
                                                                        return 'Field is required';
                                                                      }

                                                                      return null;
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        fanZipCodeController,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelText:
                                                                          'Zip Code',
                                                                      labelStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      hintText:
                                                                          'Zip Code',
                                                                      hintStyle:
                                                                          FlutterFlowTheme
                                                                              .bodyText1,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.secondaryColor,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(4.0),
                                                                          topRight:
                                                                              Radius.circular(4.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText1,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .streetAddress,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
                                                          height: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Color(
                                                                    0x00FFFFFF),
                                                                FlutterFlowTheme
                                                                    .tertiaryColor
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
                                                                  0,
                                                                  -0.050000000000000044),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 1),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          16,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await fanOnboardingPageViewController
                                                                      .nextPage(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                },
                                                                text:
                                                                    'CONTINUE',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 200,
                                                                  height: 40,
                                                                  color: FlutterFlowTheme
                                                                      .secondaryColor,
                                                                  textStyle: FlutterFlowTheme
                                                                      .subtitle1
                                                                      .override(
                                                                    fontFamily:
                                                                        'Rubik',
                                                                    color: FlutterFlowTheme
                                                                        .tertiaryColor,
                                                                    fontSize:
                                                                        16,
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
                                                                  borderRadius:
                                                                      8,
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Text(
                                            'Please read through the terms and conditions below and specify whether you accept/decline at the bottom.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Rubik',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0.05),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 20, 10, 0),
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional(0, 1),
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: 480,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                          .tertiaryColor,
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'These Terms of Use (or \"Terms\") govern your use of Aces, except where we expressly state that separate terms (and not these) apply, and provide information about the Aces Service (the \"Service\"), outlined below. When you create a Aces account or use Aces, you agree to these terms.\n\nARBITRATION NOTICE: YOU AGREE THAT DISPUTES BETWEEN YOU AND US WILL BE RESOLVED BY BINDING, INDIVIDUAL ARBITRATION AND YOU WAIVE YOUR RIGHT TO PARTICIPATE IN A CLASS ACTION LAWSUIT OR CLASS-WIDE ARBITRATION. WE EXPLAIN SOME EXCEPTIONS AND HOW YOU CAN OPT OUT OF ARBITRATION BELOW.\n\nThe Aces Service\nWe agree to provide you with the Aces Service. The Service includes all of the Aces products, features, applications, services, technologies, and software that we provide to advance Instagram\'s mission: To bring you closer to the people and things you love. The Service is made up of the following aspects:\nOffering personalized opportunities to create, connect, communicate, discover, and share.\nPeople are different. We want to strengthen your relationships through shared experiences you actually care about. So we build systems that try to understand who and what you and others care about, and use that information to help you create, find, join, and share in experiences that matter to you. Part of that is highlighting content, features, offers, and accounts you might be interested in, and offering ways for you to experience Instagram, based on things you and others do on and off Instagram.\nFostering a positive, inclusive, and safe environment.\nWe develop and use tools and offer resources to our community members that help to make their experiences positive and inclusive, including when we think they might need help. We also have teams and systems that work to combat abuse and violations of our Terms and policies, as well as harmful and deceptive behavior. We use all the information we have-including your information-to try to keep our platform secure. We also may share information about misuse or harmful content with other Facebook Companies or law enforcement. Learn more in the Data Policy.\nDeveloping and using technologies that help us consistently serve our growing community.\nOrganizing and analyzing information for our growing community is central to our Service. A big part of our Service is creating and using cutting-edge technologies that help us personalize, protect, and improve our Service on an incredibly large scale for a broad global community. Technologies like artificial intelligence and machine learning give us the power to apply complex processes across our Service. Automated technologies also help us ensure the functionality and integrity of our Service.\n\nConnecting you with brands, products, and services in ways you care about.\nWe use data from Aces, as well as from third-party partners, to show you ads, offers, and other sponsored content that we believe will be meaningful to you. And we try to make that content as relevant as all your other experiences on Instagram.\nResearch and innovation.\nWe use the information we have to study our Service and collaborate with others on research to make our Service better and contribute to the well-being of our community.\n',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        80),
                                                            child:
                                                                FlutterFlowRadioButton(
                                                              options: [
                                                                'Accept',
                                                                'Decline'
                                                              ],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() =>
                                                                    radioButtonValue =
                                                                        value);
                                                              },
                                                              optionHeight: 25,
                                                              textStyle:
                                                                  FlutterFlowTheme
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
                                                              toggleable: false,
                                                              horizontalAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 1),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0x00FFFFFF),
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
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            await fanOnboardingPageViewController
                                                                .nextPage(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300),
                                                              curve:
                                                                  Curves.ease,
                                                            );
                                                          },
                                                          text: 'SUBMIT',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 200,
                                                            height: 40,
                                                            color:
                                                                FlutterFlowTheme
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 50),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            'WE\'RE ON IT!',
                                            style: FlutterFlowTheme.title1
                                                .override(
                                              fontFamily: 'Rubik',
                                              fontSize: 32,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'You have successfully completed your application! We will contact you soon if you are approved.',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Image.network(
                                                '',
                                                width: 160,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NavBarPage(
                                                                initialPage:
                                                                    'Home'),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  },
                                                  text: 'HOME',
                                                  options: FFButtonOptions(
                                                    width: 160,
                                                    height: 48,
                                                    color: FlutterFlowTheme
                                                        .customColor1,
                                                    textStyle: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Rubik',
                                                      color: Colors.white,
                                                    ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 8,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0.95),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: SmoothPageIndicator(
                                controller: fanOnboardingPageViewController ??=
                                    PageController(initialPage: 0),
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) {
                                  fanOnboardingPageViewController.animateToPage(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
