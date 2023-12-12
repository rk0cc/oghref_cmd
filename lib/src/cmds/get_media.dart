import 'package:ansix/ansix.dart';
import 'package:oghref_model/model.dart';

import '../media_map.dart';
import 'abstract_getter.dart';

base class OgHrefGetMediaCommand extends AbstractOgHrefGetterCommand {
  @override
  final String description = "Print media informations of given URL";

  @override
  final String name = "media";

  @override
  void onFetchOnce(MetaInfo metaInfo, String protocolName) {
    bool hasImage = metaInfo.images.isNotEmpty,
        hasVideo = metaInfo.videos.isNotEmpty,
        hasAudio = metaInfo.audios.isNotEmpty;

    if (!hasImage && !hasVideo && !hasAudio) {
      print("No media metadata declared");
    } else {
      print("Media found in $protocolName:");

      if (hasImage) {
        AnsiX.printTreeView(metaInfo.images.map((e) => e.toMap()).toList(),
            theme: AnsiTreeViewTheme.$default().copyWith(
                headerTheme: AnsiTreeHeaderTheme(customHeader: "Images")));
      }

      if (hasVideo) {
        AnsiX.printTreeView(metaInfo.videos.map((e) => e.toMap()).toList(),
            theme: AnsiTreeViewTheme.$default().copyWith(
                headerTheme: AnsiTreeHeaderTheme(customHeader: "Videos")));
      }

      if (hasAudio) {
        AnsiX.printTreeView(metaInfo.audios.map((e) => e.toMap()).toList(),
            theme: AnsiTreeViewTheme.$default().copyWith(
                headerTheme: AnsiTreeHeaderTheme(customHeader: "Audios")));
      }
    }
  }
}
