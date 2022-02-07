import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({Key key}) : super(key: key);

  @override
  _EventsWidgetState createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Events',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Rubik',
            color: FlutterFlowTheme.secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.tertiaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // TODO: Search bar implementation
            // Row(
            //   mainAxisSize: MainAxisSize.max,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
            //       child: Container(
            //         width: MediaQuery.of(context).size.width * 0.96,
            //         height: 50,
            //         decoration: BoxDecoration(
            //           color: FlutterFlowTheme.tertiaryColor,
            //           borderRadius: BorderRadius.circular(12),
            //           border: Border.all(
            //             color: FlutterFlowTheme.secondaryColor,
            //           ),
            //         ),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             Expanded(
            //               child: Padding(
            //                 padding:
            //                     EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
            //                 child: TextFormField(
            //                   controller: textController,
            //                   obscureText: false,
            //                   decoration: InputDecoration(
            //                     hintText:
            //                         'Search for events, profiles, content...',
            //                     hintStyle: FlutterFlowTheme.bodyText2.override(
            //                       fontFamily: 'Rubik',
            //                       color: Color(0xFF1A1F24),
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w300,
            //                     ),
            //                     enabledBorder: UnderlineInputBorder(
            //                       borderSide: BorderSide(
            //                         color: Color(0x00000000),
            //                         width: 1,
            //                       ),
            //                       borderRadius: const BorderRadius.only(
            //                         topLeft: Radius.circular(4.0),
            //                         topRight: Radius.circular(4.0),
            //                       ),
            //                     ),
            //                     focusedBorder: UnderlineInputBorder(
            //                       borderSide: BorderSide(
            //                         color: Color(0x00000000),
            //                         width: 1,
            //                       ),
            //                       borderRadius: const BorderRadius.only(
            //                         topLeft: Radius.circular(4.0),
            //                         topRight: Radius.circular(4.0),
            //                       ),
            //                     ),
            //                   ),
            //                   style: FlutterFlowTheme.bodyText2.override(
            //                     fontFamily: 'Rubik',
            //                     color: Color(0xFF1A1F24),
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w300,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Card(
            //               clipBehavior: Clip.antiAliasWithSaveLayer,
            //               color: Color(0xFF1E2429),
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(8),
            //               ),
            //               child: FlutterFlowIconButton(
            //                 borderColor: Colors.transparent,
            //                 borderRadius: 30,
            //                 buttonSize: 46,
            //                 icon: Icon(
            //                   Icons.search_outlined,
            //                   color: Colors.white,
            //                   size: 24,
            //                 ),
            //                 onPressed: () {
            //                   print('IconButton pressed ...');
            //                 },
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
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
            StreamBuilder<List<EventsRecord>>(
              stream: queryEventsRecord(
                queryBuilder: (eventsRecord) =>
                    eventsRecord
                        .where('ace_exclusive', isEqualTo: true)
                        .orderBy('event_date'),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      'No upcoming events',
                      style: FlutterFlowTheme.title1.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.secondaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  );
                }
                List<EventsRecord> columnClassesEventsRecordList =
                    snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(columnClassesEventsRecordList.length,
                            (columnClassesIndex) {
                      final columnClassesEventsRecord =
                          columnClassesEventsRecordList[columnClassesIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      columnClassesEventsRecord.eventPhoto,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xB31E2429),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 16, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    columnClassesEventsRecord
                                                        .eventName,
                                                    style: FlutterFlowTheme
                                                        .title2
                                                        .override(
                                                      fontFamily: 'Rubik',
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            dateTimeFormat(
                                                                'jm',
                                                                columnClassesEventsRecord
                                                                    .eventDate),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Rubik',
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Text(
                                                            ' | ',
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Rubik',
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Text(
                                                            dateTimeFormat(
                                                                'yMMMd',
                                                                columnClassesEventsRecord
                                                                    .eventDate),
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Rubik',
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            columnClassesEventsRecord
                                                                .eventLocation,
                                                            style:
                                                                FlutterFlowTheme
                                                                    .bodyText1
                                                                    .override(
                                                              fontFamily:
                                                                  'Rubik',
                                                              color: FlutterFlowTheme
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    print(
                                                        'Button-Reserve pressed ...');
                                                  },
                                                  text: 'Ticket',
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.ticketAlt,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 120,
                                                    height: 40,
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    textStyle:
                                                        GoogleFonts.getFont(
                                                      'Rubik',
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                    elevation: 3,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius: 8,
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
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
