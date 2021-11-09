import 'package:equatable/equatable.dart';

class CharacterImage extends Equatable {
  final String path;
  final String extension;

  const CharacterImage({
    required this.path,
    required this.extension,
  });
  @override
  List<Object?> get props => [path, extension];
}
