// To parse this JSON data, do
//
//     final storeListResponse = storeListResponseFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

StoreListResponse storeListResponseFromJson(String str) =>
    StoreListResponse.fromJson(json.decode(str));

String storeListResponseToJson(StoreListResponse data) =>
    json.encode(data.toJson());

class StoreListResponse {
  StoreListResponse({
    this.stores,
    this.status,
    this.message,
  });

  List<Store>? stores;
  String? status;
  String? message;

  factory StoreListResponse.fromJson(Map<String, dynamic> json) =>
      StoreListResponse(
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "stores": List<dynamic>.from(stores!.map((x) => x.toJson())),
        "status": status,
        "message": message,
      };
}

class Store {
  Store({
    this.storeId,
    this.storeCode,
    this.storeName,
    this.address,
    this.dcId,
    this.dcName,
    this.accountId,
    this.accountName,
    this.subchannelId,
    this.subchannelName,
    this.channelId,
    this.channelName,
    this.areaId,
    this.areaName,
    this.regionId,
    this.regionName,
    this.latitude,
    this.longitude,
  });

  int? storeId;
  String? storeCode;
  String? storeName;
  String? address;
  String? dcId;
  String? dcName;
  String? accountId;
  String? accountName;
  String? subchannelId;
  String? subchannelName;
  String? channelId;
  String? channelName;
  String? areaId;
  String? areaName;
  String? regionId;
  String? regionName;
  String? latitude;
  String? longitude;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: int.parse(json['store_id'].toString()),
        storeCode: json["store_code"],
        storeName: json["store_name"],
        address: json["address"],
        dcId: json["dc_id"],
        dcName: json["dc_name"],
        accountId: json["account_id"],
        accountName: json["account_name"],
        subchannelId: json["subchannel_id"],
        subchannelName: json["subchannel_name"],
        channelId: json["channel_id"],
        channelName: json["channel_name"],
        areaId: json["area_id"],
        areaName: json["area_name"],
        regionId: json["region_id"],
        regionName: json["region_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "store_code": storeCode,
        "store_name": storeName,
        "address": address,
        "dc_id": dcId,
        "dc_name": dcName,
        "account_id": accountId,
        "account_name": accountName,
        "subchannel_id": subchannelId,
        "subchannel_name": subchannelName,
        "channel_id": channelId,
        "channel_name": channelName,
        "area_id": areaId,
        "area_name": areaName,
        "region_id": regionId,
        "region_name": regionName,
        "latitude": latitude,
        "longitude": longitude,
      };
}
