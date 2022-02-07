import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:aces_app_dev/add_content/add_content_widget.dart';
import 'package:aces_app_dev/backend/firebase_storage/storage.dart';
import 'package:aces_app_dev/backend/schema/engagements_record.dart';
import 'package:aces_app_dev/flutter_flow/flutter_flow_toggle_icon.dart';
import 'package:aces_app_dev/flutter_flow/video_player.dart';
import 'package:aces_app_dev/support/support_widget.dart';
import 'package:video_player/video_player.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../event_details/event_details_widget.dart';
import '../flutter_flow/custom_expandable_fab.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

import '../main.dart';
import '../profile_details/profile_details_widget.dart';
import '../register_login/register_login_widget.dart';
import '../support/support_widget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key key,
    this.newAce,
  }) : super(key: key);

  final bool newAce;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final navigatorKey = GlobalKey<NavigatorState>();
  String upcomingEventsFiltersValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  // Image/Video Picker
  List<XFile> _imageFileList;
  set _imageFile(XFile value) {
    _imageFileList = value == null ? null : [value];
  }

  XFile _videoFile;
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  VideoPlayerController _toBeDisposed;
  String _retrieveDataError;
  final ImagePicker _picker = ImagePicker();


  void _onImageButtonPressed(ImageSource source,
      {BuildContext context, bool isMultiImage = false}) async {
    if (_controller != null) {
      await _controller.setVolume(0.0);
    }
    if (isVideo) {
      final XFile videoFile = await _picker.pickVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      if (videoFile == null) {
        log('No video selected');
      } else {
        setState(() {
          _videoFile = videoFile;
        });
        await _playVideo(videoFile);
        await _showContentDialog(context);
      }
    } else if (isMultiImage) {
      try {
        final pickedFileList = await _picker.pickMultiImage();
        setState(() {
          _imageFileList = pickedFileList;
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    } else {
      try {
        final pickedFile = await _picker.pickImage(source: source);
        if (pickedFile == null) {
          log('No image selected');
        } else {
          setState(() {
            _imageFile = pickedFile;
          });
          await _showContentDialog(context);
        }
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    }
  }

  Future<void> _playVideo(XFile file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      // In web, most browsers won't honor a programmatic call to .play
      // if the video has a sound track (and is not muted).
      // Mute the video so it auto-plays in web!
      // This is not needed if the call to .play is the result of user
      // interaction (clicking on a "play" button, for example).
      final double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        setState(() {
          _videoFile = response.file;
        });
        //await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
          _imageFileList = response.files;
        });
      }
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  Future<void> _showContentDialog(BuildContext context) async {
    TextEditingController contentCaptionController = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.all(20.0),
        elevation: 0.0,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Color(0xFF1e2429),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: isVideo
                    ? AspectRatioVideo(_controller)
                    : Image.file(
                        File(_imageFileList[0].path),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20,
                  borderWidth: 1,
                  buttonSize: 30,
                  fillColor: FlutterFlowTheme.tertiaryColor,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.secondaryColor,
                    size: 12,
                  ),
                  onPressed: () async {
                    if (isVideo == true) {
                      await _controller.pause();
                      setState(() {
                        _videoFile = null;
                      });
                    } else {
                      setState(() {
                        _imageFileList = null;
                      });
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0, 0.95),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 20, 5, 0),
                          child: TextFormField(
                            controller: contentCaptionController,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Caption',
                              labelStyle: FlutterFlowTheme.bodyText1,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.tertiaryColor,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.tertiaryColor,
                            ),
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.95),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 20, 10, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (isVideo == true) {
                              final videoBytes = await _videoFile.readAsBytes();
                              final downloadUrl =
                                  await uploadData(_videoFile.path, videoBytes);
                              final contentCreateData = createContentRecordData(
                                video: downloadUrl,
                                videoCaption: contentCaptionController.text,
                                createdTime: getCurrentTimestamp,
                                heartCount: 0,
                                userRef: currentUserReference,
                                contentType: 'video',
                              );
                              await ContentRecord.collection
                                  .doc()
                                  .set(contentCreateData);
                              final aceProfile = await _fetchAceProfile();
                              final acesUpdateData = createAcesRecordData(
                                videoCount: aceProfile.videoCount + 1
                              );
                              await aceProfile.reference.update(acesUpdateData);
                              deactivate();
                              Navigator.of(context).pop();
                            } else if (isVideo == false) {
                              final imageBytes =
                                  await _imageFileList[0].readAsBytes();
                              final downloadUrl = await uploadData(
                                  _imageFileList[0].path, imageBytes);
                              final contentCreateData = createContentRecordData(
                                photo: downloadUrl,
                                photoCaption: contentCaptionController.text,
                                createdTime: getCurrentTimestamp,
                                heartCount: 0,
                                userRef: currentUserReference,
                                contentType: 'photo',
                              );
                              await ContentRecord.collection
                                  .doc()
                                  .set(contentCreateData);
                              final aceProfile = await _fetchAceProfile();
                              final acesUpdateData = createAcesRecordData(
                                  photoCount: aceProfile.photoCount + 1
                              );
                              await aceProfile.reference.update(acesUpdateData);
                              Navigator.of(context).pop();
                            }
                          },
                          text: 'POST',
                          options: FFButtonOptions(
                            width: 80,
                            height: 50,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              color: FlutterFlowTheme.tertiaryColor,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0x00FFFFF),
      ),
    );
  }

  Future<AcesRecord> _fetchAceProfile() async {
    List<AcesRecord> acesRecordList = await queryAcesRecordOnce(
      queryBuilder: (acesRecord) => acesRecord.where('user_ref',
          isEqualTo: currentUserReference),
      singleRecord: true,
    );
    AcesRecord acesRecord = acesRecordList.isNotEmpty
        ? acesRecordList.first
        : null;
    return acesRecord;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Color(0xFFC10207),
              ),
            ),
          );
        }
        final homeUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0x00FFFFFF),
            iconTheme: IconThemeData(color: FlutterFlowTheme.secondaryColor),
            automaticallyImplyLeading: true,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.menu,
                color: FlutterFlowTheme.secondaryColor,
                size: 30,
              ),
              onPressed: () async {
                scaffoldKey.currentState.openDrawer();
              },
            ),
            title: Image.asset(
              'assets/images/ACES_LOGO.png',
              width: 100,
              height: 100,
              fit: BoxFit.fitWidth,
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.help_outline_sharp,
                  color: FlutterFlowTheme.secondaryColor,
                  size: 30,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SupportWidget(),
                    ),
                  );
                },
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          drawer: Drawer(
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            elevation: 20,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () async {
                    await Navigator.pushAndRemoveUntil(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                        reverseDuration: Duration(milliseconds: 0),
                        child: NavBarPage(initialPage: 'MyProfile'),
                      ),
                          (r) => false,
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                    ),
                    title: Text(
                      'Profile',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.customColor1,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.tertiaryColor,
                    dense: false,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await signOut();
                    await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterLoginWidget(),
                      ),
                          (r) => false,
                    );
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.sensor_door,
                    ),
                    title: Text(
                      'Sign Out',
                      style: FlutterFlowTheme.title3.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.customColor1,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.tertiaryColor,
                    dense: false,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Welcome message and approval status
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.transparent,
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Welcome',
                                        style:
                                            FlutterFlowTheme.bodyText2.override(
                                          fontFamily: 'Rubik',
                                          color: FlutterFlowTheme.customColor1,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: Text(
                                          homeUsersRecord.displayName,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Rubik',
                                            color:
                                                FlutterFlowTheme.secondaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '!',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Rubik',
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (homeUsersRecord.aceApproved == false)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0x3D5A5A5A),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Icon(
                                                Icons.access_time_sharp,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 4, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Your Ace profile application is being reviewed.',
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 4),
                                                    child: AutoSizeText(
                                                      'You may still use the mobile app with limited \nfeatures until you are approved.',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
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
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Upcoming Events',
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: FlutterFlowChoiceChips(
                          initialOption: upcomingEventsFiltersValue ??=
                              'Popular',
                          options: [
                            ChipData('Popular'),
                            ChipData('Nearby'),
                            ChipData('Happening Now')
                          ],
                          onChanged: (val) =>
                              setState(() => upcomingEventsFiltersValue = val),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            iconColor: Colors.white,
                            iconSize: 18,
                            elevation: 4,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: FlutterFlowTheme.customColor1,
                            textStyle: FlutterFlowTheme.bodyText2.override(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            iconColor: Color(0xFF262D34),
                            iconSize: 18,
                            elevation: 0,
                          ),
                          chipSpacing: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: StreamBuilder<List<EventsRecord>>(
                          stream: queryEventsRecord(
                            queryBuilder: (eventsRecord) =>
                                (homeUsersRecord.aceApproved == true)
                                    ? eventsRecord
                                        .where('featured', isEqualTo: true)
                                        .where('ace_exclusive', isEqualTo: true)
                                        .orderBy('event_date')
                                    : eventsRecord
                                        .where('featured', isEqualTo: true)
                                        .where('open_to_fans', isEqualTo: true)
                                        .orderBy('event_date'),
                            limit: 5,
                          ),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                {
                                  return Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    child: Center(
                                      child: Text('No Upcoming Events',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'Rubik',
                                              fontWeight: FontWeight.w300)),
                                    ),
                                  );
                                }
                                break;
                              case ConnectionState.waiting:
                                {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: Color(0xFFC10207),
                                      ),
                                    ),
                                  );
                                }
                                break;
                              case ConnectionState.active:
                                {
                                  if (snapshot.hasData) {
                                    List<EventsRecord>
                                        upcomingEventsListEventsRecordList =
                                        snapshot.data;
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            upcomingEventsListEventsRecordList
                                                .length,
                                            (upcomingEventsListIndex) {
                                          final upcomingEventsListEventsRecord =
                                              upcomingEventsListEventsRecordList[
                                                  upcomingEventsListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 16, 8),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EventDetailsWidget(
                                                      eventRef:
                                                          upcomingEventsListEventsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 250,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3,
                                                      color: Color(0x64000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            upcomingEventsListEventsRecord
                                                                .eventPhoto,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      4, 8, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: Color(
                                                                    0xFFE6E6E6),
                                                                elevation: 2,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                                  child: Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 250,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x88090F13),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(8),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8),
                                                              topLeft: Radius
                                                                  .circular(0),
                                                              topRight: Radius
                                                                  .circular(0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 60,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .extractAbbreviatedMonth(upcomingEventsListEventsRecord.eventDate),
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Rubik',
                                                                          color:
                                                                              FlutterFlowTheme.tertiaryColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              2,
                                                                              4,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .extractDayFromDate(upcomingEventsListEventsRecord.eventDate)
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme
                                                                            .title3
                                                                            .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      upcomingEventsListEventsRecord
                                                                          .eventName
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            22,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme
                                                                          .bodyText1
                                                                          .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      upcomingEventsListEventsRecord
                                                                          .eventLocation
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            22,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme
                                                                          .bodyText1
                                                                          .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      child: Center(
                                        child: Text('No Upcoming Events',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300)),
                                      ),
                                    );
                                  }
                                }
                                break;
                              default:
                                {
                                  if (snapshot.hasData) {
                                    List<EventsRecord>
                                        upcomingEventsListEventsRecordList =
                                        snapshot.data;
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            upcomingEventsListEventsRecordList
                                                .length,
                                            (upcomingEventsListIndex) {
                                          final upcomingEventsListEventsRecord =
                                              upcomingEventsListEventsRecordList[
                                                  upcomingEventsListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 16, 8),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        EventDetailsWidget(
                                                      eventRef:
                                                          upcomingEventsListEventsRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 250,
                                                height: 170,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 3,
                                                      color: Color(0x64000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            upcomingEventsListEventsRecord
                                                                .eventPhoto,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      4, 8, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: Color(
                                                                    0xFFE6E6E6),
                                                                elevation: 2,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                                  child: Icon(
                                                                    Icons
                                                                        .calendar_today,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 250,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x88090F13),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(8),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8),
                                                              topLeft: Radius
                                                                  .circular(0),
                                                              topRight: Radius
                                                                  .circular(0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 60,
                                                                height: 100,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              2,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .extractAbbreviatedMonth(upcomingEventsListEventsRecord.eventDate),
                                                                        style: FlutterFlowTheme
                                                                            .bodyText1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Rubik',
                                                                          color:
                                                                              FlutterFlowTheme.tertiaryColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              2,
                                                                              4,
                                                                              4),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .extractDayFromDate(upcomingEventsListEventsRecord.eventDate)
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme
                                                                            .title3
                                                                            .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      upcomingEventsListEventsRecord
                                                                          .eventName
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            22,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme
                                                                          .bodyText1
                                                                          .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      upcomingEventsListEventsRecord
                                                                          .eventLocation
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            22,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme
                                                                          .bodyText1
                                                                          .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      child: Center(
                                        child: Text('No Upcoming Events',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w300)),
                                      ),
                                    );
                                  }
                                }
                                break;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Featured Profiles',
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 0, 0),
                        child: StreamBuilder<List<AcesRecord>>(
                          stream: queryAcesRecord(
                            queryBuilder: (acesRecord) =>
                                acesRecord.where('featured', isEqualTo: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: Color(0xFFC10207),
                                  ),
                                ),
                              );
                            }
                            List<AcesRecord>
                                featuredProfilesListAcesRecordList =
                                snapshot.data;
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    featuredProfilesListAcesRecordList.length,
                                    (featuredProfilesListIndex) {
                                  final featuredProfilesListAcesRecord =
                                      featuredProfilesListAcesRecordList[
                                          featuredProfilesListIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 16, 8),
                                    child: FutureBuilder<UsersRecord>(
                                      future: UsersRecord.getDocumentOnce(
                                          featuredProfilesListAcesRecord
                                              .userRef),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color: Color(0xFFC10207),
                                              ),
                                            ),
                                          );
                                        }
                                        final profileCardUsersRecord =
                                            snapshot.data;
                                        return InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileDetailsWidget(
                                                  aceProfileRef:
                                                      featuredProfilesListAcesRecord
                                                          .reference,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 130,
                                            height: 170,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3,
                                                  color: Color(0x64000000),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    profileCardUsersRecord
                                                        .photoUrl,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 250,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x88090F13),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 0, 0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              profileCardUsersRecord
                                                                  .displayName,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: FlutterFlowTheme
                                                                    .tertiaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                            ),
                                                            Text(
                                                              (profileCardUsersRecord
                                                                          .country ==
                                                                      'United States')
                                                                  ? '${profileCardUsersRecord.city}, ${profileCardUsersRecord.state}'
                                                                  : '${profileCardUsersRecord.city}, ${profileCardUsersRecord.country}',
                                                              style:
                                                                  FlutterFlowTheme
                                                                      .bodyText1
                                                                      .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                color: FlutterFlowTheme
                                                                    .tertiaryColor,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                        );
                                      },
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Featured Content',
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder<List<ContentRecord>>(
                        stream: queryContentRecord(
                          queryBuilder: (contentRecord) => contentRecord
                              .where('featured', isEqualTo: true)
                              .orderBy('created_time', descending: true),
                          limit: 10,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: Color(0xFFC10207),
                                ),
                              ),
                            );
                          }
                          List<ContentRecord>
                              featuredContentListContentRecordList =
                              snapshot.data;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                featuredContentListContentRecordList.length,
                                (featuredContentListIndex) {
                              final featuredContentListContentRecord =
                                  featuredContentListContentRecordList[
                                      featuredContentListIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 16),
                                child: StreamBuilder<ContentRecord>(
                                  stream: ContentRecord.getDocument(
                                      featuredContentListContentRecord
                                          .reference),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: Color(0xFFC10207),
                                          ),
                                        ),
                                      );
                                    }
                                    final contentCardContentRecord =
                                        snapshot.data;
                                    return Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.96,
                                      height: 500,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x2E000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(8),
                                                        topRight:
                                                            Radius.circular(8),
                                                      ),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            contentCardContentRecord
                                                                .contentPhoto,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 300,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 8, 12, 0),
                                                      child: StreamBuilder<
                                                          UsersRecord>(
                                                        stream: UsersRecord
                                                            .getDocument(
                                                                contentCardContentRecord
                                                                    .userRef),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: Color(
                                                                      0xFFC10207),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final titleSectionUsersRecord =
                                                              snapshot.data;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 50,
                                                                height: 50,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      titleSectionUsersRecord
                                                                          .photoUrl,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        contentCardContentRecord
                                                                            .contentTitle
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              60,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme
                                                                            .subtitle1
                                                                            .override(
                                                                          fontFamily:
                                                                              'Rubik',
                                                                          color:
                                                                              Color(0xFF151B1E),
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child: Row(
                                                                          mainAxisSize: MainAxisSize
                                                                              .max,
                                                                          mainAxisAlignment: MainAxisAlignment
                                                                              .start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 2, 0, 0),
                                                                              child: Text(
                                                                                titleSectionUsersRecord.username,
                                                                                style: FlutterFlowTheme.bodyText1.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  fontSize: 14,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                                                                              child: Text(
                                                                                '·',
                                                                                style: FlutterFlowTheme.bodyText1.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  fontSize: 14,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                                                                              child: Text(
                                                                                functions.durationSinceCreated(contentCardContentRecord.createdTime),
                                                                                style: FlutterFlowTheme.bodyText1.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  fontSize: 14,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ]),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(12, 12,
                                                                  12, 0),
                                                      child: Text(
                                                        contentCardContentRecord
                                                            .content
                                                            .maybeHandleOverflow(
                                                          maxChars: 240,
                                                          replacement: '…',
                                                        ),
                                                        style: FlutterFlowTheme
                                                            .bodyText2
                                                            .override(
                                                          fontFamily: 'Rubik',
                                                          color: FlutterFlowTheme
                                                              .secondaryColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 3,
                                            thickness: 1,
                                            color: Color(0xFFE1E4E5),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0.05),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 16, 4),
                                              child: StreamBuilder<
                                                  List<EngagementsRecord>>(
                                                stream: queryEngagementsRecord(
                                                  queryBuilder: (engagementsRecord) =>
                                                      engagementsRecord
                                                          .where('content_ref',
                                                              isEqualTo:
                                                                  contentCardContentRecord
                                                                      .reference)
                                                          .where('user_ref',
                                                              isEqualTo:
                                                                  currentUserReference),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              Color(0xFFC10207),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<EngagementsRecord>
                                                      rowEngagementsRecordList =
                                                      snapshot.data;
                                                  final rowEngagementsRecord =
                                                      rowEngagementsRecordList
                                                              .isNotEmpty
                                                          ? rowEngagementsRecordList
                                                              .first
                                                          : null;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        16,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    Map<String,
                                                                            dynamic>
                                                                        contentUpdateData;

                                                                    if (rowEngagementsRecord ==
                                                                        null) {
                                                                      Map<String,
                                                                              dynamic>
                                                                          engagementsCreateData =
                                                                          createEngagementsRecordData(
                                                                        userRef:
                                                                            currentUserReference,
                                                                        contentRef:
                                                                            contentCardContentRecord.reference,
                                                                        isFavorite:
                                                                            true,
                                                                      );
                                                                      contentUpdateData =
                                                                          createContentRecordData(
                                                                              heartCount: contentCardContentRecord.heartCount + 1);
                                                                      await EngagementsRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              engagementsCreateData);
                                                                    } else {
                                                                      Map<String,
                                                                              dynamic>
                                                                          engagementsUpdateData =
                                                                          createEngagementsRecordData(
                                                                              isFavorite: !rowEngagementsRecord.isFavorite);
                                                                      if (!rowEngagementsRecord
                                                                              .isFavorite ==
                                                                          true) {
                                                                        contentUpdateData =
                                                                            createContentRecordData(heartCount: contentCardContentRecord.heartCount + 1);
                                                                      } else {
                                                                        contentUpdateData =
                                                                            createContentRecordData(heartCount: contentCardContentRecord.heartCount - 1);
                                                                      }
                                                                      await rowEngagementsRecord
                                                                          .reference
                                                                          .update(
                                                                              engagementsUpdateData);
                                                                    }

                                                                    await contentCardContentRecord
                                                                        .reference
                                                                        .update(
                                                                            contentUpdateData);
                                                                  },
                                                                  value: (rowEngagementsRecord ==
                                                                          null)
                                                                      ? false
                                                                      : rowEngagementsRecord
                                                                          .isFavorite,
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color: FlutterFlowTheme
                                                                        .primaryColor,
                                                                    size: 25,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: FlutterFlowTheme
                                                                        .secondaryColor,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    formatNumber(
                                                                      contentCardContentRecord
                                                                          .heartCount,
                                                                      formatType:
                                                                          FormatType
                                                                              .compact,
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .bodyText2
                                                                        .override(
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      color: FlutterFlowTheme
                                                                          .secondaryColor,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            onTap: () async {},
                                                            child: Icon(
                                                              Icons.ios_share,
                                                              color: FlutterFlowTheme
                                                                  .secondaryColor,
                                                              size: 24,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.tertiaryColor,
                        Color(0x00FFFFFF)
                      ],
                      stops: [0.3, 0.7],
                      begin: AlignmentDirectional(0, -1),
                      end: AlignmentDirectional(0, 1),
                    ),
                  ),
                ),
                if ((widget.newAce) == true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.tertiaryColor,
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Text(
                                'WE\'RE ON IT!',
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Rubik',
                                  fontSize: 32,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Lottie.asset(
                              'assets/lottie_animations/lf30_editor_czlp1pzd.json',
                              width: 150,
                              height: 130,
                              fit: BoxFit.cover,
                              repeat: false,
                              animate: true,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Text(
                                    'You have successfully completed your application! We will contact you soon if you are approved.',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Rubik',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'assets/images/instagram-button.png',
                                      width: 160,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 6),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await Navigator.pushAndRemoveUntil(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                              reverseDuration:
                                                  Duration(milliseconds: 0),
                                              child: NavBarPage(
                                                  initialPage: 'Home'),
                                            ),
                                            (r) => false,
                                          );
                                        },
                                        text: 'HOME',
                                        options: FFButtonOptions(
                                          width: 160,
                                          height: 48,
                                          color: FlutterFlowTheme.customColor1,
                                          textStyle: FlutterFlowTheme.subtitle2
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                //_handlePreview(),
                // !kIsWeb && defaultTargetPlatform == TargetPlatform.android
                //     ? FutureBuilder<void>(
                //         future: retrieveLostData(),
                //         builder: (BuildContext context,
                //             AsyncSnapshot<void> snapshot) {
                //           if (snapshot.connectionState ==
                //               ConnectionState.done) {
                //             return _handlePreview();
                //           } else {
                //             return Container(width: 1, height: 1);
                //           }
                //         },
                //       )
                //     : _handlePreview(),
              ],
            ),
          ),
          floatingActionButton: ExpandableFab(
            distance: 90.0,
            children: [
              ActionButton(
                onPressed: () {
                  isVideo = false;
                  _onImageButtonPressed(ImageSource.camera, context: context);
                },
                icon: const Icon(Icons.camera_alt_outlined),
              ),
              ActionButton(
                onPressed: () {
                  isVideo = true;
                  _onImageButtonPressed(ImageSource.camera, context: context);
                },
                icon: const Icon(Icons.videocam_outlined),
              ),
              ActionButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddContentWidget(),
                  ),
                ),
                icon: const Icon(Icons.article_outlined),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    super.dispose();
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);
