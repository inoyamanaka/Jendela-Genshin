import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_detail_character_body.g.dart';

@JsonSerializable(
  createFactory: false,
  fieldRename: FieldRename.snake,
)
class CharacterDetailBody extends Equatable {
  const CharacterDetailBody({required this.name});

  final String name;

  @override
  List<Object?> get props => [name];
}
