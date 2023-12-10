import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:meta/meta.dart';
import 'package:oghref_model/model.dart';

abstract base class AbstractOgHrefGetterCommand extends Command<void> {
  AbstractOgHrefGetterCommand() {
    argParser.addOption("protocol",
        abbr: 'p',
        help: "Specify one protocol prefix uses for fetching data",
        allowed: ["og", "twitter"],
        allowedHelp: {
          "og": "Fetch Open Graph metadata context",
          "twitter": "Fetch Twitter card metadata context"
        },
        valueHelp: "PREFIX");
  }

  @protected
  void onFetchAll(Map<String, MetaInfo> metaInfos) {
    for (MapEntry<String, MetaInfo> metaEntry in metaInfos.entries) {
      onFetchOnce(metaEntry.value, metaEntry.key);
    }
  }

  @protected
  void onFetchOnce(MetaInfo metaInfo, String protocolName);

  @override
  @nonVirtual
  FutureOr<void> run() async {
    late Uri url;
    try {
      url = Uri.parse(argResults!.rest[0]);
    } on FormatException catch (fe) {
      print(fe);
      exit(1);
    }

    Map<String, MetaInfo> metas = await MetaFetch().fetchAllFromHttp(url);

    if (metas.isNotEmpty) {
      String? specifiedProtocol = argResults!["protocol"];

      if (specifiedProtocol != null) {
        onFetchOnce(metas[specifiedProtocol]!, specifiedProtocol);
      } else {
        onFetchAll(metas);
      }
    } else {
      print("No metadata found in this URL");
    }
  }
}
