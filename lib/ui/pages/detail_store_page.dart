import 'package:flutter/material.dart';

import 'package:pitjarus_test/data/models/list_store_model.dart';
import 'package:pitjarus_test/shared/styles.dart';
import 'package:pitjarus_test/ui/cubit/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pitjarus_test/utils/constanst.dart';

class DetailStorePage extends StatefulWidget {
  const DetailStorePage({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<String, dynamic> data;
  static const String routeName = '/detail-store';

  @override
  State<DetailStorePage> createState() => _DetailStorePageState();
}

class _DetailStorePageState extends State<DetailStorePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var store = widget.data['data'] as Store;
    var index = widget.data['index'] as int;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageUrl,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.navigate_before,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 285, left: 8, right: 8, bottom: 20),
            height: 350,
            padding: const EdgeInsets.all(20),
            width: double.infinity * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x267b88a8),
                  offset: Offset(2, 0),
                  blurRadius: 6,
                  spreadRadius: 6,
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.store,
                      size: 30,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${store.storeName}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${store.address}',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Tipe Outlet',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Tipe Display',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Sub Tipe Display',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'ERTM',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Pareto',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'E-Merchandising',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store.accountName!,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  store.channelName!,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  store.subchannelName!,
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Ya',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Ya',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Ya',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.online_prediction_rounded,
                      size: 30,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Last Visited',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${DateTime.now().toLocal()}',
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ButtonWidgets(size: size, index: index)
        ],
      )),
    );
  }
}

class ButtonWidgets extends StatelessWidget {
  const ButtonWidgets({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 8, bottom: 20),
            height: 60,
            width: size.width * 0.46,
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().setVisited(index: index, val: false);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'No Visit',
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 8, bottom: 20),
            height: 60,
            width: size.width * 0.46,
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().setVisited(index: index, val: true);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kBlueColor,
              ),
              child: const Text(
                'Visit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
