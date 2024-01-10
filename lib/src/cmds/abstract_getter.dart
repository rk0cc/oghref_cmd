import 'dart:async';
import 'dart:io' show stdout, stderr;

import 'package:args/command_runner.dart';
import 'package:meta/meta.dart';
import 'package:oghref_model/model.dart';

abstract base class AbstractOgHrefGetterCommand extends Command<void> {
  static const Map<String, String> _protocolsDescs = {
    "og": "Fetch Open Graph metadata context",
    "twitter": "Fetch Twitter card metadata context"
  };

  static final MetaFetch _cmdFetchInstance = MetaFetch()
    ..register(const OpenGraphPropertyParser())
    ..register(const TwitterCardPropertyParser());

  AbstractOgHrefGetterCommand() {
    argParser
      ..addOption("protocol",
          abbr: 'p',
          help: "Specify one protocol prefix uses for fetching data",
          allowed: _protocolsDescs.keys,
          allowedHelp: _protocolsDescs,
          valueHelp: "PREFIX")
      ..addSeparator("The first arguments must be an URL of website.");
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
    Uri url = Uri.parse(argResults!.rest[0]);

    stdout.write("Fetching data...");

    try {
      await _cmdFetchInstance.fetchAllFromHttp(url).then((metas) {
        stdout
          ..writeCharCode(13)
          ..write(List.filled(40, " ").join())
          ..writeCharCode(13);

        if (metas.isNotEmpty) {
          String? specifiedProtocol = argResults!["protocol"];

          if (specifiedProtocol != null) {
            onFetchOnce(metas[specifiedProtocol]!, specifiedProtocol);
          } else {
            onFetchAll(metas);
          }
        } else {
          stderr
            ..writeln()
            ..writeln("No metadata found in this URL");
        }
      });
    } catch (err) {
      stdout.writeln();
      rethrow;
    }
  }
}
