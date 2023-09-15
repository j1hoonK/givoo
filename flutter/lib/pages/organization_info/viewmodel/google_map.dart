import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NowGoogleMapView extends StatelessWidget {
  NowGoogleMapView(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.orgName});

  final double latitude; // 위도
  final double longitude; // 경도
  final String orgName; // 기관명

  final List<Marker> _marker = []; // 지도상의 건물 이름표 정보

  void setMarker() {
    _marker.add(Marker(
        markerId: MarkerId(orgName),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: orgName), // 이름표
        draggable: false));
  }

  final _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    // 초기위치(중심점)
    final LatLng homeLatLng = LatLng(latitude, longitude);
    final CameraPosition initialPosition = CameraPosition(target: homeLatLng, zoom: 15);
    // 마커 세팅
    setMarker();
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: initialPosition,
      markers: Set.from(_marker),
      onMapCreated: (GoogleMapController controller) =>
          _controller.complete(controller),
    );
  }
}
