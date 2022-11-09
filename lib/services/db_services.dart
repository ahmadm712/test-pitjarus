import 'dart:developer';

import 'package:pitjarus_test/data/models/list_store_model.dart';
import 'package:pitjarus_test/helpers/db_helper.dart';
import 'package:pitjarus_test/utils/failure.dart';

DatabasesHelper databasesHelper = DatabasesHelper();
Future<String> insertWatchlist(Store store) async {
  try {
    await databasesHelper.insertStores(store);
    return 'Added to Watchlist';
  } catch (e) {
    throw DatabaseException(error: e.toString());
  }
}

Future<List<Store>> getListStore() async {
  final result = await databasesHelper.getStoreList();
  try {
    if (result.isNotEmpty) {
      // log(result.first['data'].message);
      return result.map((e) => Store.fromJson(e)).toList();
    } else {
      log('Tidak  ada data');
      throw 'Data tidak ada';
    }
  } catch (e) {
    throw e;
  }
}
