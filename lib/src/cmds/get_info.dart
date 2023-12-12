import 'package:ansix/ansix.dart';
import 'package:dolumns/dolumns.dart';
import 'package:oghref_model/model.dart';

import 'abstract_getter.dart';

base class OgHrefGetInfoCommand extends AbstractOgHrefGetterCommand {
  @override
  final String description = "Get metadata information found in given URL";

  @override
  final String name = "info";

  @override
  void onFetchOnce(MetaInfo metaInfo, String protocolName) {
    print("Data found using $protocolName:");

    print(metaInfo.url);

    AnsiX.printTreeView(
        {
          "site_name": metaInfo.siteName,
          "title": metaInfo.title,
          "description": metaInfo.description,
          "url": metaInfo.url?.toString()
        }..removeWhere((key, value) => value == null),
        theme: AnsiTreeViewTheme.$default().copyWith(
            headerTheme:
                AnsiTreeHeaderTheme(customHeader: "$protocolName context")));

    if ([metaInfo.images, metaInfo.audios, metaInfo.videos]
        .any((element) => element.isNotEmpty)) {
      print("Media summary:");
      print(dolumnify([
        ["Category", "Counts"],
        if (metaInfo.images.isNotEmpty) ["Images:", metaInfo.images.length],
        if (metaInfo.videos.isNotEmpty) ["Videos:", metaInfo.videos.length],
        if (metaInfo.audios.isNotEmpty) ["Audios:", metaInfo.audios.length]
      ]));
    }

    print("");
  }
}
