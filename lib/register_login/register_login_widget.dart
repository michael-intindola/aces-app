import 'package:aces_app_dev/flutter_flow/upload_content.dart';
import 'package:flutter/material.dart';

import '../aces_onboarding/aces_onboarding_widget.dart';
import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';

class RegisterLoginWidget extends StatefulWidget {
  const RegisterLoginWidget({
    Key key,
    this.authMode,
  }) : super(key: key);

  final String authMode;

  @override
  _RegisterLoginWidgetState createState() => _RegisterLoginWidgetState();
}

class _RegisterLoginWidgetState extends State<RegisterLoginWidget> {
  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordVisibility;
  bool forgotPassword;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    forgotPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/ACES_HOME.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 340, 16, 0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  // new line
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.primaryColor,
                          unselectedLabelColor: FlutterFlowTheme.customColor1,
                          labelStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Rubik',
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                          indicatorColor: FlutterFlowTheme.secondaryColor,
                          tabs: [
                            Tab(
                              text: 'REGISTER',
                            ),
                            Tab(
                              text: 'LOGIN',
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 400.0,
                          child: TabBarView(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0.05),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-0.3, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 30, 0, 0),
                                        child: Text(
                                          'For models, influencers, and content creators...',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Rubik',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: AcesOnboardingWidget(),
                                            ),
                                          );
                                        },
                                        text: 'REGISTER AS AN \"ACE\"',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color: Color(0xFFC10207),
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Rubik',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          elevation: 3,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 8,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 30, 0, 0),
                                        child: Text(
                                          'For the fans and general crowd...',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Rubik',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              reverseDuration:
                                                  Duration(milliseconds: 300),
                                              child: UploadContent(),
                                            ),
                                          );
                                        },
                                        text: 'REGISTER AS A \"FAN\"',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color: FlutterFlowTheme.customColor1,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Rubik',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          elevation: 3,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 0),
                                    child: TextFormField(
                                      controller: emailController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: FlutterFlowTheme.bodyText1,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                FlutterFlowTheme.secondaryColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                FlutterFlowTheme.secondaryColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.bodyText1,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Please enter the email address you registered with.';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: !passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: FlutterFlowTheme.bodyText1,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                FlutterFlowTheme.secondaryColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                FlutterFlowTheme.secondaryColor,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                            () => passwordVisibility =
                                                !passwordVisibility,
                                          ),
                                          child: Icon(
                                            passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.bodyText1,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Please enter the correct password.';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (!formKey.currentState.validate()) {
                                          return;
                                        }
                                        final user = await signInWithEmail(
                                          context,
                                          emailController.text,
                                          passwordController.text,
                                        );
                                        if (user == null) {
                                          return;
                                        }

                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NavBarPage(initialPage: 'Home'),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      text: 'LOGIN',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 40,
                                        color: FlutterFlowTheme.customColor1,
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Rubik',
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 12,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 14, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            // if (!formKey.currentState
                                            //     .validate()) {
                                            //   return;
                                            // }
                                            passwordController.clear();
                                            if (emailController.text.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Email required!',
                                                  ),
                                                ),
                                              );
                                              return;
                                            }
                                            await resetPassword(
                                              email: emailController.text,
                                              context: context,
                                            );
                                          },
                                          child: Text(
                                            'Forgot your password?',
                                            style: FlutterFlowTheme.subtitle2
                                                .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
    );
  }
}
