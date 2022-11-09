import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:pitjarus_test/services/location_services.dart';
import 'package:pitjarus_test/ui/cubit/list_store_cubit/list_store_cubit.dart';
import 'package:pitjarus_test/ui/cubit/location_cubit/location_home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? userPosition;
  @override
  void initState() {
    super.initState();
    context.read<ListStoreCubit>().fetchStore();
    context.read<LocationHomeCubit>().fetchLocation();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('List Store'),
                          Text('userA'),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x267b88a8),
                                  offset: Offset(10, 0),
                                  blurRadius: 10,
                                  spreadRadius: 10)
                            ],
                          ),
                          child: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white54,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x267b88a8),
                          offset: Offset(2, 0),
                          blurRadius: 2,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Map
              const MapWidget(),
              const SizedBox(
                height: 6,
              ),
              const Text('List Kunjungan'),
              const SizedBox(
                height: 10,
              ),
              const ListStoreWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      height: MediaQuery.of(context).size.height * 0.4,
      child: BlocConsumer<LocationHomeCubit, LocationHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LocationHomeSucces) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FlutterMap(
                options: MapOptions(
                  center:
                      // ? LatLng(-6.2010575, 106.8094093)
                      LatLng(state.data.latitude, state.data.longitude),
                  zoom: 15,
                  slideOnBoundaries: true,
                  screenSize: const Size(double.infinity, 300),
                  onMapReady: () {},
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                ],
              ),
            );
          } else if (state is LocationHomeFail) {}

          return Container();
        },
      ),
    );
  }
}

class ListStoreWidget extends StatelessWidget {
  const ListStoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListStoreCubit, ListStoreState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ListStoreHasData) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                final data = state.data[index];
                log(state.data.length.toString());
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(6),
                    child: Text(data.storeName!.toString() ?? ""),
                  ),
                );
              },
            ),
          );
        } else if (state is ListStoreFailed) {
          return Text(state.error);
        }
        return Container();
      },
    );
  }
}
