# Example of operating `oghref_cmd` command

This examples will list three functional subcommands which are `info`, `media` and `json` along with execution result and documentations of output (for `json` subcommand only).

In this example, it will refer to metadata found in [official Flutter website](https://flutter.dev).

## Get metadata info

```bash
oghref_cmd info https://flutter.dev
```

```plain
Data found using og:
┌──────────┐
│og context│
└────┬─────┘
     ├── title: Flutter - Build apps for any screen
     ├── description: Flutter transforms the entire app development process. Build, test, and deploy beautiful mobile, web
     │                , desktop, and embedded apps from a single codebase.
     └── url: //flutter.dev/

Media summary:
Category  Counts
Images:   1



```

## Get media information in metadata

```bash
oghref_cmd media https://flutter.dev
```

```plain
Media found in og:
┌──────┐
│Images│
└──┬───┘
   └── 0
       └── url: https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png
```

## Export metadata into JSON format (with indent)

```bash
oghref_cmd json --indent=4 https://flutter.dev
```

```json
{
    "og": {
        "site_name": null,
        "title": "Flutter - Build apps for any screen",
        "description": "Flutter transforms the entire app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase.",
        "url": "//flutter.dev/",
        "images": [
            {
                "url": "https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png",
                "secure_url": null,
                "type": null,
                "width": null,
                "height": null,
                "alt": null
            }
        ],
        "videos": [],
        "audios": []
    }
}
```

### Documentation of JSON output

#### (Root object)

|Name|Type|Description|
|:---:|:---:|:---|
|(Name of protocol prefix)|[`MetaInfo`](#metainfo)|Contains metadta information found in specific protocol|

#### MetaInfo

> [!INFO]
> All type are nullable

|Name|Type|Description|
|:---:|:---:|:---|
|`site_name`|`string`|Name of website|
|`title`|`string`|Title of webpage|
|`description`|`string`|Explain the website information briefly|
|`url`|`string`|URL of this website|
|`images`|`list`|A list of [image information](#imageinfo) obtained|
|`videos`|`list`|A list of [video information](#videoinfo) obtained|
|`audios`|`list`|A list of [audio information](#audioinfo) obtained|

#### ImageInfo

> [!INFO]
> All type are nullable, but all nulled values in ImageInfo is forbidden.

|Name|Type|Description|
|:---:|:---:|:---|
|`url`|`string`|URL of image resources|
|`secure_url`|`string`|URL of image resources which uses `HTTPS` strictly|
|`type`|`string`|MIME type of resources|
|`width`|`number`|Width of the image|
|`height`|`number`|Height of the image|
|`alt`|`string`|A sematic message of describing image content in textual|

#### VideoInfo

> [!INFO]
> All type are nullable, but all nulled values in VideoInfo is forbidden.

|Name|Type|Description|
|:---:|:---:|:---|
|`url`|`string`|URL of video resources|
|`secure_url`|`string`|URL of video resources which uses `HTTPS` strictly|
|`type`|`string`|MIME type of resources|
|`width`|`number`|Width of the video|
|`height`|`number`|Height of the video|

#### AudioInfo

> [!INFO]
> All type are nullable, but all nulled values in AudeoInfo is forbidden.

|Name|Type|Description|
|:---:|:---:|:---|
|`url`|`string`|URL of audio resources|
|`secure_url`|`string`|URL of audio resources which uses `HTTPS` strictly|
|`type`|`string`|MIME type of resources|
