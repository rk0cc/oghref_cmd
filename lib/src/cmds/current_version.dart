import 'dart:io' show stdout;

import 'package:args/command_runner.dart';

final class GetVersionCommand extends Command<void> {
  @override
  final String description = "Get version of oghref_cmd.";

  @override
  final String name = "version";

  @override
  void run() {
    // TODO: PLEASE UPDATE VERSION AND COMMIT BEFORE TAG
    stdout.write("1.0.0");
  }
}
