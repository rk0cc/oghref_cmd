# Command line tools for reviewing parsed rich information link metadata and data exchanges

This package only serves as executable which offers as pub package and complied executable files sperately.

## Setup

### Download executable files

> [!WARNING]
> It only provides under AMD64 CPU architecture and Apple Silicon (since `0.1.1`) only, for those who uses other Dart supported CPU architecture, please consider [compile yourself](#build).

> [!NOTE]
> macOS running in ARM64 (Apple silicon) version is compiled via Codemagic.

Please download latest version from [releases](https://github.com/rk0cc/oghref_cmd/releases)

### Using `dart pub` command

If Dart has been installed, it can be deployed by running this command:

```console
dart pub global activate oghref_cmd
```

### Edit `pubspec.yaml`

Please add `oghref_cmd` into `dev_dependencies`, **NOT `dependencies`**

```yaml
dev_dependencies:
  oghref_cmd: # Copy version constraints from pub.dev
```

### Build

Please get Dart SDK first and execute this commands below:

```bash
# Assume Dart binaries is defined into PATH

git clone --depth 1 --branch release https://github.com/rk0cc/oghref_cmd.git
mkdir dist
dart pub get
dart compile exe bin/oghref_cmd.dart -o dist/oghref_cmd
```

## Usages

```plain
Usage: oghref_cmd <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  info      Get metadata information found in given URL
  json      Export fetched content in JSON format
  media     Print media informations of given URL
  version   Get version of oghref_cmd.
```

For each command's usages, please type:

```console
oghref_cmd <command name> -h
```

or visit [readme page in example](example/README.md).

## License

AGPL v3
