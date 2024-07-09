import 'dart:io';
import 'package:yaml/yaml.dart';

void main() {
  // Abrir el archivo pubspec.yaml
  final file = File('pubspec.yaml');
  final yamlString = file.readAsStringSync();
  final yaml = loadYaml(yamlString);

  final int version =
      int.parse(yaml['version'].split('+')[1].replaceAll('.', ''));

  final String versionString =
      yaml['version'].split('+')[0] + '+' + (version + 1).toString();

  final stringYaml = yamlString.replaceAll(
    'version: ${yaml['version']}',
    'version: $versionString',
  );

  // guardar el archivo
  file.writeAsStringSync(stringYaml);
}
