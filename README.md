# Command line tools for reviewing parsed rich information link metadata and data exchanges

This package only serves as executable which offers as pub package and complied executable files sperately.

## Setup

### Download executable files

Please download latest version from [releases](https://github.com/rk0cc/oghref_cmd/releases)

### Using `dart pub` command

If Dart has been installed, it can be deployed by running this command:

```console
dart pub global activate oghref_cmd
```

## Usages

```console
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

## License

AGPL v3
