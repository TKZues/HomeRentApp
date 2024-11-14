import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/utils/config/size_config.dart';
import 'package:flutter_application_1/utils/text/textcustom.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeDetail extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final String bedroom;
  final String bathroom;
  final String address;
  final String price;

  const HomeDetail({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.bedroom,
    required this.bathroom,
    required this.address,
    required this.price,
  });

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  late GoogleMapController googleMapController;
  // ignore: unused_field
  bool _makelocation = false;

  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};
  String address = "Chưa có địa chỉ";
  double latitude = 37.42796133580664;
  double longitude = -122.085749655962;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  Future<void> _updateLocation() async {
    try {
      Position position = await _determinePosition();
      setState(() {
        address = "${position.latitude} - ${position.longitude}";
        latitude = position.latitude;
        longitude = position.longitude;
        markers.clear();
        markers.add(Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude),
        ));
      });

      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 14,
          ),
        ),
      );
      setState(() {
        _makelocation = true;
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  final List<String> items = [
    "assets/images/avatar.jpg",
    "assets/images/avatar.jpg",
    "assets/images/avatar.jpg",
    "assets/images/avatar.jpg",
    "assets/images/avatar.jpg",
    "assets/images/avatar.jpg"
  ];
  @override
  void initState() {
    super.initState();
    _updateLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                initializeHeader(),
                SizedBox(height: psHeight(20)),
                Text(
                  "Description",
                  style: TextStyle(
                      fontSize: psHeight(16), fontWeight: FontWeight.w500),
                ),
                SizedBox(height: psHeight(20)),
                RichText(
                  text: TextSpan(
                    text: widget.description,
                    style: TextStyle(
                        fontSize: psHeight(12),
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontFamily: 'Raleway'),
                    children: <TextSpan>[
                      TextSpan(
                        text: " Show more",
                        style: TextStyle(
                          fontSize: psHeight(12),
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(height:  psHeight(20)),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular( psHeight(20)),
                      child: Image.asset(
                        "assets/images/avatar.jpg",
                        width:  psHeight(40),
                        height:  psHeight(40),
                      ),
                    ),
                     SizedBox(width:  psWidth(20)),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Garry Allen",
                          style: TextStyle(
                              fontSize:  psHeight(16), fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Owner",
                          style: TextStyle(
                              fontSize:  psHeight(12),
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(psHeight(8)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(psHeight(5)),
                           color: AppColor.blueMain.withOpacity(0.5),
                      ),
                      child: Icon(Icons.call, color: Colors.white, size: psHeight(16)),
                     
                    ),
                    SizedBox(width: psWidth(10),),
                    Container(

                       padding: EdgeInsets.all(psHeight(8)),
                      // ignore: sort_child_properties_last
                      child: Icon(Icons.chat_bubble,
                          color: Colors.white, size: psHeight(16)),
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(psHeight(5)),
                         color: AppColor.blueMain.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: psHeight(20)),
                 Text(
                  "Gallery",
                  style: TextStyle(fontSize: psHeight(16), fontWeight: FontWeight.w500),
                ),
                 SizedBox(height: psHeight(20)),
                buildGallery(),
                 SizedBox(height: psHeight(20)),
                Stack(
                  children: [
                    SizedBox(
                      height: psHeight(200),
                      child: GoogleMap(
                        initialCameraPosition: initialCameraPosition,
                        markers: markers,
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        onMapCreated: (GoogleMapController controller) {
                          googleMapController = controller;
                        },
                      ),
                    ),
                    Positioned(
                      left: psWidth(20),
                      right: psWidth(20),
                      bottom: psHeight(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                text: "Price",
                                fontSize: psHeight(12),
                                fontWeight: FontWeight.w400,
                                color: AppColor.greyfind,
                              ),
                              TextCustom(
                                text: "Rp. 2.500.000.000 / Year",
                                fontSize: psHeight(14),
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: psWidth(12),
                                  vertical: psHeight(12)),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment(0.8, 1),
                                    colors: <Color>[
                                      Color(0xffA0DAFB),
                                      Color(0xff0A8ED9),
                                    ],
                                    tileMode: TileMode.mirror,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(psHeight(10))),
                              child: Padding(
                                  padding: EdgeInsets.all(psHeight(4)),
                                  child: const TextCustom(
                                    text: "Rent now",
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGallery() {
    return SizedBox(
      height: psHeight(72),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length > 4 ? 4 : items.length,
        itemBuilder: (context, index) {
          if (index < 3 || items.length <= 4) {
            return Padding(
              padding: EdgeInsets.only(right: psWidth(18)),
              child: Container(
                width: psHeight(72),
                height: psHeight(72),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(psHeight(10))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(psHeight(10)),
                  child: Image.asset(
                    items[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(right: psWidth(15)),
              child: Container(
                width: psHeight(72),
                height: psHeight(72),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(psHeight(10)),
                  
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(psHeight(10)),
                      child: Image.asset(
                                        items[index],
                                        fit: BoxFit.cover,
                                      ),
                    ),
                    Positioned(bottom: psHeight(20), top: psHeight(20), left: psWidth(20), right: psWidth(20),child: Center(
                  child: Text(
                    '+${items.length - 3}',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),)
                  ],
                )
              ),
            );
          }
        },
      ),
    );
  }

  Stack initializeHeader() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(psHeight(20)),
          child: Image.asset(
            widget.image,
            height: psHeight(304),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: psHeight(75),
          left: psHeight(10),
          child: Text(
            widget.title,
            style: TextStyle(
                fontSize: psHeight(20),
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          bottom: psHeight(50),
          left: psHeight(10),
          child: Text(
            widget.address,
            style: TextStyle(fontSize: psHeight(12), color: Colors.white),
          ),
        ),
        Positioned(
          bottom: psHeight(20),
          left: psHeight(10),
          child: Row(
            children: [
              buildFeatureIcon(Icons.bed_outlined, widget.bedroom),
              SizedBox(width: psHeight(30)),
              buildFeatureIcon(Icons.bathtub_outlined, widget.bathroom),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFeatureIcon(IconData icon, String text) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(psHeight(5)),
          ),
          padding: EdgeInsets.all(psHeight(4)),
          child: Icon(
            icon,
            size: psHeight(16),
            color: Colors.white,
          ),
        ),
        SizedBox(width: psHeight(10)),
        Text(
          text,
          style: TextStyle(fontSize: psHeight(12), color: Colors.white),
        ),
      ],
    );
  }
}
