import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:oghref_cmd/src/cmds/current_version.dart';
import 'package:oghref_cmd/src/cmds/get_info.dart';
import 'package:oghref_cmd/src/cmds/get_media.dart';
import 'package:oghref_cmd/src/cmds/json_export.dart';
import 'package:oghref_model/model.dart';

Future<void> main(List<String> args) async {
  MetaFetch()
    ..register(const OpenGraphPropertyParser())
    ..register(const TwitterCardPropertyParser());

  CommandRunner<void> runner = CommandRunner("oghref_cmd",
      "Command line tools for retriving rich information link in URL")
    ..addCommand(OgHrefGetInfoCommand())
    ..addCommand(OgHrefGetMediaCommand())
    ..addCommand(JsonExportCommand())
    ..addCommand(GetVersionCommand());

  await runner.run(args).onError((error, stackTrace) {
    print(error);
    runner.printUsage();

    exit(1);
  });

  exit(0);
}
