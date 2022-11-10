import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pitjarus_test/data/models/list_store_model.dart';
import 'package:pitjarus_test/ui/cubit/cubit/auth_cubit.dart';
import 'package:pitjarus_test/ui/cubit/list_store_cubit/list_store_cubit.dart';
import 'package:pitjarus_test/ui/cubit/location_cubit/location_home_cubit.dart';
import 'package:pitjarus_test/ui/pages/detail_store_page.dart';
import 'package:pitjarus_test/ui/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Store> listStores = [];
  List<Marker> listAllMarker = [];
  @override
  void initState() {
    super.initState();
    context.read<ListStoreCubit>().fetchStore();
    context.read<LocationHomeCubit>().fetchLocation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    listStores = context.read<AuthCubit>().stores;
    listAllMarker = context.read<AuthCubit>().markers;
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
                        onTap: () {
                          context.read<AuthCubit>().logout();
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginPage.routeName, (route) => false);
                        },
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
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    listStores = context.read<AuthCubit>().stores;
                    listAllMarker = context.read<AuthCubit>().markers;
                    return MapWidget(allMarkers: listAllMarker);
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 6,
              ),
              const Text('List Kunjungan'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          height: 3,
                          thickness: 1,
                        ),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.storeListResponse.stores!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final data = state.storeListResponse.stores![index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DetailStorePage.routeName,
                                arguments: {"data": data, "index": index},
                              ).then((value) {
                                setState(() {});
                              });
                            },
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.all(6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data.storeName!.toString()),
                                      Text(
                                        data.address!,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                      Text(
                                        '${data.channelName} ${data.areaName}',
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (data.isVisited!)
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.check,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text('Visited')
                                          ],
                                        )
                                      else
                                        Container(),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.green,
                                          ),
                                          Text('1m')
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  MapWidget({
    Key? key,
    required this.allMarkers,
  }) : super(key: key);
  List<Marker> allMarkers;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      height: MediaQuery.of(context).size.height * 0.4,
      child: BlocConsumer<LocationHomeCubit, LocationHomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LocationHomeSucces) {
            allMarkers.add(Marker(
              point: LatLng(state.data.latitude, state.data.longitude),
              builder: (context) => const Icon(
                Icons.location_on,
                color: Colors.red,
                size: 15,
              ),
            ));
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FlutterMap(
                options: MapOptions(
                  center:
                      // ? LatLng(-6.2010575, 106.8094093)
                      LatLng(state.data.latitude, state.data.longitude),
                  zoom: 17,
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
                  MarkerLayer(
                    markers: allMarkers,
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
