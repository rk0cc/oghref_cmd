import 'package:args/command_runner.dart';

final class GetVersionCommand extends Command<void> {
  @override
  final String description = "Get version of oghref_cmd.";

  @override
  final String name = "version";

  @override
  void run() {
    // TODO: PLEASE UPDATE VERSION AND COMMIT BEFORE TAG
    print("0.1.2");
  }
}
