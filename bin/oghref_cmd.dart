import 'package:args/command_runner.dart';
import 'package:oghref_model/model.dart';

import 'package:oghref_cmd/src/cmds/get_info.dart';

Future<void> main(List<String> args) async {
  MetaFetch()
    ..register(const OpenGraphPropertyParser())
    ..register(const TwitterCardPropertyParser());

  CommandRunner<void> runner = CommandRunner("oghref_cmd",
      "Command line tools for retriving rich information link in URL")
      ..addCommand(OgHrefGetInfoCommand());

  await runner.run(args);
}
