import 'dart:convert';

import 'package:oghref_model/model.dart';

import 'abstract_getter.dart';

base class JsonExportCommand extends AbstractOgHrefGetterCommand {
  @override
  final String description = "Export fetched content in JSON format";

  @override
  final String name = "json";

  JsonExportCommand() {
    argParser.addOption("indent",
        help: "Define indent of JSON format.",
        valueHelp: "INDENT SIZE",
        allowed: const <String>["2", "4", "8"]);
  }

  static MapEntry<String, dynamic> _convertMetaInfoToJson(
      String protocol, MetaInfo metaInfo) {
    return MapEntry(protocol, {
      "site_name": metaInfo.siteName,
      "title": metaInfo.title,
      "description": metaInfo.description,
      "url": metaInfo.url?.toString(),
      "images": metaInfo.images
          .map((e) => {
                "url": e.url?.toString(),
                "secure_url": e.secureUrl?.toString(),
                "type": e.type,
                "width": e.width,
                "height": e.height,
                "alt": e.alt
              })
          .toList(),
      "videos": metaInfo.videos
          .map((e) => {
                "url": e.url?.toString(),
                "secure_url": e.secureUrl?.toString(),
                "type": e.type,
                "width": e.width,
                "height": e.height
              })
          .toList(),
      "audios": metaInfo.audios
          .map((e) => {
                "url": e.url?.toString(),
                "secure_url": e.secureUrl?.toString(),
                "type": e.type
              })
          .toList()
    });
  }

  void _handlePrint(Map<String, dynamic> json) {
    String? indent = argResults!["indent"];

    late JsonEncoder jsonEncoder;

    if (indent != null) {
      jsonEncoder = JsonEncoder.withIndent(" " * int.parse(indent));
    } else {
      jsonEncoder = const JsonEncoder();
    }

    print(jsonEncoder.convert(json));
  }

  @override
  void onFetchOnce(MetaInfo metaInfo, String protocolName) {
    _handlePrint(
        Map.fromEntries([_convertMetaInfoToJson(protocolName, metaInfo)]));
  }

  @override
  void onFetchAll(Map<String, MetaInfo> metaInfos) {
    _handlePrint(metaInfos.map(_convertMetaInfoToJson));
  }
}
