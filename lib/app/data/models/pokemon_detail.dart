import 'dart:convert';

import 'models.dart';

class PokemonDetail {
  PokemonDetail({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  final List<Ability> abilities;
  final int baseExperience;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<HeldItem> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  PokemonDetail copyWith({
    List<Ability> abilities,
    int baseExperience,
    List<Species> forms,
    List<GameIndex> gameIndices,
    int height,
    List<HeldItem> heldItems,
    int id,
    bool isDefault,
    String locationAreaEncounters,
    List<Move> moves,
    String name,
    int order,
    List<dynamic> pastTypes,
    Species species,
    Sprites sprites,
    List<Stat> stats,
    List<Type> types,
    int weight,
  }) =>
      PokemonDetail(
        abilities: abilities ?? this.abilities,
        baseExperience: baseExperience ?? this.baseExperience,
        forms: forms ?? this.forms,
        gameIndices: gameIndices ?? this.gameIndices,
        height: height ?? this.height,
        heldItems: heldItems ?? this.heldItems,
        id: id ?? this.id,
        isDefault: isDefault ?? this.isDefault,
        locationAreaEncounters: locationAreaEncounters ?? this.locationAreaEncounters,
        moves: moves ?? this.moves,
        name: name ?? this.name,
        order: order ?? this.order,
        pastTypes: pastTypes ?? this.pastTypes,
        species: species ?? this.species,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
        weight: weight ?? this.weight,
      );

  factory PokemonDetail.fromRawJson(String str) => PokemonDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonDetail.fromJson(Map<String, dynamic> json) => PokemonDetail(
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
    baseExperience: json["base_experience"],
    forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
    gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
    height: json["height"],
    heldItems: List<HeldItem>.from(json["held_items"].map((x) => HeldItem.fromJson(x))),
    id: json["id"],
    isDefault: json["is_default"],
    locationAreaEncounters: json["location_area_encounters"],
    moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
    name: json["name"],
    order: json["order"],
    pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
    species: Species.fromJson(json["species"]),
    sprites: Sprites.fromJson(json["sprites"]),
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "base_experience": baseExperience,
    "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
    "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
    "height": height,
    "held_items": List<dynamic>.from(heldItems.map((x) => x.toJson())),
    "id": id,
    "is_default": isDefault,
    "location_area_encounters": locationAreaEncounters,
    "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
    "name": name,
    "order": order,
    "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
    "species": species.toJson(),
    "sprites": sprites.toJson(),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "weight": weight,
  };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  final Species ability;
  final bool isHidden;
  final int slot;

  Ability copyWith({
    Species ability,
    bool isHidden,
    int slot,
  }) =>
      Ability(
        ability: ability ?? this.ability,
        isHidden: isHidden ?? this.isHidden,
        slot: slot ?? this.slot,
      );

  factory Ability.fromRawJson(String str) => Ability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    ability: Species.fromJson(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

  Map<String, dynamic> toJson() => {
    "ability": ability.toJson(),
    "is_hidden": isHidden,
    "slot": slot,
  };
}


class GameIndex {
  GameIndex({
    this.gameIndex,
    this.version,
  });

  final int gameIndex;
  final Species version;

  GameIndex copyWith({
    int gameIndex,
    Species version,
  }) =>
      GameIndex(
        gameIndex: gameIndex ?? this.gameIndex,
        version: version ?? this.version,
      );

  factory GameIndex.fromRawJson(String str) => GameIndex.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
    gameIndex: json["game_index"],
    version: Species.fromJson(json["version"]),
  );

  Map<String, dynamic> toJson() => {
    "game_index": gameIndex,
    "version": version.toJson(),
  };
}

class HeldItem {
  HeldItem({
    this.item,
    this.versionDetails,
  });

  final Species item;
  final List<VersionDetail> versionDetails;

  HeldItem copyWith({
    Species item,
    List<VersionDetail> versionDetails,
  }) =>
      HeldItem(
        item: item ?? this.item,
        versionDetails: versionDetails ?? this.versionDetails,
      );

  factory HeldItem.fromRawJson(String str) => HeldItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
    item: Species.fromJson(json["item"]),
    versionDetails: List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "item": item.toJson(),
    "version_details": List<dynamic>.from(versionDetails.map((x) => x.toJson())),
  };
}

class VersionDetail {
  VersionDetail({
    this.rarity,
    this.version,
  });

  final int rarity;
  final Species version;

  VersionDetail copyWith({
    int rarity,
    Species version,
  }) =>
      VersionDetail(
        rarity: rarity ?? this.rarity,
        version: version ?? this.version,
      );

  factory VersionDetail.fromRawJson(String str) => VersionDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
    rarity: json["rarity"],
    version: Species.fromJson(json["version"]),
  );

  Map<String, dynamic> toJson() => {
    "rarity": rarity,
    "version": version.toJson(),
  };
}

class Move {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  Move copyWith({
    Species move,
    List<VersionGroupDetail> versionGroupDetails,
  }) =>
      Move(
        move: move ?? this.move,
        versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
      );

  factory Move.fromRawJson(String str) => Move.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Move.fromJson(Map<String, dynamic> json) => Move(
    move: Species.fromJson(json["move"]),
    versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "move": move.toJson(),
    "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
  };
}

class VersionGroupDetail {
  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  final int levelLearnedAt;
  final Species moveLearnMethod;
  final Species versionGroup;

  VersionGroupDetail copyWith({
    int levelLearnedAt,
    Species moveLearnMethod,
    Species versionGroup,
  }) =>
      VersionGroupDetail(
        levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
        moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
        versionGroup: versionGroup ?? this.versionGroup,
      );

  factory VersionGroupDetail.fromRawJson(String str) => VersionGroupDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => VersionGroupDetail(
    levelLearnedAt: json["level_learned_at"],
    moveLearnMethod: Species.fromJson(json["move_learn_method"]),
    versionGroup: Species.fromJson(json["version_group"]),
  );

  Map<String, dynamic> toJson() => {
    "level_learned_at": levelLearnedAt,
    "move_learn_method": moveLearnMethod.toJson(),
    "version_group": versionGroup.toJson(),
  };
}

class GenerationV {
  GenerationV({
    this.blackWhite,
  });

  final Sprites blackWhite;

  GenerationV copyWith({
    Sprites blackWhite,
  }) =>
      GenerationV(
        blackWhite: blackWhite ?? this.blackWhite,
      );

  factory GenerationV.fromRawJson(String str) => GenerationV.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
    blackWhite: Sprites.fromJson(json["black-white"]),
  );

  Map<String, dynamic> toJson() => {
    "black-white": blackWhite.toJson(),
  };
}

class GenerationIv {
  GenerationIv({
    this.diamondPearl,
    this.heartgoldSoulsilver,
    this.platinum,
  });

  final Sprites diamondPearl;
  final Sprites heartgoldSoulsilver;
  final Sprites platinum;

  GenerationIv copyWith({
    Sprites diamondPearl,
    Sprites heartgoldSoulsilver,
    Sprites platinum,
  }) =>
      GenerationIv(
        diamondPearl: diamondPearl ?? this.diamondPearl,
        heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
        platinum: platinum ?? this.platinum,
      );

  factory GenerationIv.fromRawJson(String str) => GenerationIv.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
    diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
    heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
    platinum: Sprites.fromJson(json["platinum"]),
  );

  Map<String, dynamic> toJson() => {
    "diamond-pearl": diamondPearl.toJson(),
    "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
    "platinum": platinum.toJson(),
  };
}

class Versions {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final GenerationVi generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  Versions copyWith({
    GenerationI generationI,
    GenerationIi generationIi,
    GenerationIii generationIii,
    GenerationIv generationIv,
    GenerationV generationV,
    GenerationVi generationVi,
    GenerationVii generationVii,
    GenerationViii generationViii,
  }) =>
      Versions(
        generationI: generationI ?? this.generationI,
        generationIi: generationIi ?? this.generationIi,
        generationIii: generationIii ?? this.generationIii,
        generationIv: generationIv ?? this.generationIv,
        generationV: generationV ?? this.generationV,
        generationVi: generationVi ?? this.generationVi,
        generationVii: generationVii ?? this.generationVii,
        generationViii: generationViii ?? this.generationViii,
      );

  factory Versions.fromRawJson(String str) => Versions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
    generationI: GenerationI.fromJson(json["generation-i"]),
    generationIi: GenerationIi.fromJson(json["generation-ii"]),
    generationIii: GenerationIii.fromJson(json["generation-iii"]),
    generationIv: GenerationIv.fromJson(json["generation-iv"]),
    generationV: GenerationV.fromJson(json["generation-v"]),
    generationVi: GenerationVi.fromJson(json["generation-vi"]),
    generationVii: GenerationVii.fromJson(json["generation-vii"]),
    generationViii: GenerationViii.fromJson(json["generation-viii"]),
  );

  Map<String, dynamic> toJson() => {
    "generation-i": generationI.toJson(),
    "generation-ii": generationIi.toJson(),
    "generation-iii": generationIii.toJson(),
    "generation-iv": generationIv.toJson(),
    "generation-v": generationV.toJson(),
    "generation-vi": generationVi.toJson(),
    "generation-vii": generationVii.toJson(),
    "generation-viii": generationViii.toJson(),
  };
}

class Sprites {
  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;
  final Other other;
  final Versions versions;
  final Sprites animated;

  Sprites copyWith({
    String backDefault,
    String backFemale,
    String backShiny,
    String backShinyFemale,
    String frontDefault,
    String frontFemale,
    String frontShiny,
    String frontShinyFemale,
    Other other,
    Versions versions,
    Sprites animated,
  }) =>
      Sprites(
        backDefault: backDefault ?? this.backDefault,
        backFemale: backFemale ?? this.backFemale,
        backShiny: backShiny ?? this.backShiny,
        backShinyFemale: backShinyFemale ?? this.backShinyFemale,
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
        other: other ?? this.other,
        versions: versions ?? this.versions,
        animated: animated ?? this.animated,
      );

  factory Sprites.fromRawJson(String str) => Sprites.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    backDefault: json["back_default"],
    backFemale: json["back_female"],
    backShiny: json["back_shiny"],
    backShinyFemale: json["back_shiny_female"],
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
    other: json["other"] == null ? null : Other.fromJson(json["other"]),
    versions: json["versions"] == null ? null : Versions.fromJson(json["versions"]),
    animated: json["animated"] == null ? null : Sprites.fromJson(json["animated"]),
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_female": backFemale,
    "back_shiny": backShiny,
    "back_shiny_female": backShinyFemale,
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
    'other': other?.toJson(),
    'versions': versions?.toJson(),
    'animated': animated?.toJson(),
  };
}

class GenerationI {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  final RedBlue redBlue;
  final RedBlue yellow;

  GenerationI copyWith({
    RedBlue redBlue,
    RedBlue yellow,
  }) =>
      GenerationI(
        redBlue: redBlue ?? this.redBlue,
        yellow: yellow ?? this.yellow,
      );

  factory GenerationI.fromRawJson(String str) => GenerationI.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
    redBlue: RedBlue.fromJson(json["red-blue"]),
    yellow: RedBlue.fromJson(json["yellow"]),
  );

  Map<String, dynamic> toJson() => {
    "red-blue": redBlue.toJson(),
    "yellow": yellow.toJson(),
  };
}

class RedBlue {
  RedBlue({
    this.backDefault,
    this.backGray,
    this.frontDefault,
    this.frontGray,
  });

  final String backDefault;
  final String backGray;
  final String frontDefault;
  final String frontGray;

  RedBlue copyWith({
    String backDefault,
    String backGray,
    String frontDefault,
    String frontGray,
  }) =>
      RedBlue(
        backDefault: backDefault ?? this.backDefault,
        backGray: backGray ?? this.backGray,
        frontDefault: frontDefault ?? this.frontDefault,
        frontGray: frontGray ?? this.frontGray,
      );

  factory RedBlue.fromRawJson(String str) => RedBlue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
    backDefault: json["back_default"],
    backGray: json["back_gray"],
    frontDefault: json["front_default"],
    frontGray: json["front_gray"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_gray": backGray,
    "front_default": frontDefault,
    "front_gray": frontGray,
  };
}

class GenerationIi {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  final Crystal crystal;
  final Crystal gold;
  final Crystal silver;

  GenerationIi copyWith({
    Crystal crystal,
    Crystal gold,
    Crystal silver,
  }) =>
      GenerationIi(
        crystal: crystal ?? this.crystal,
        gold: gold ?? this.gold,
        silver: silver ?? this.silver,
      );

  factory GenerationIi.fromRawJson(String str) => GenerationIi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
    crystal: Crystal.fromJson(json["crystal"]),
    gold: Crystal.fromJson(json["gold"]),
    silver: Crystal.fromJson(json["silver"]),
  );

  Map<String, dynamic> toJson() => {
    "crystal": crystal.toJson(),
    "gold": gold.toJson(),
    "silver": silver.toJson(),
  };
}

class Crystal {
  Crystal({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;

  Crystal copyWith({
    String backDefault,
    String backShiny,
    String frontDefault,
    String frontShiny,
  }) =>
      Crystal(
        backDefault: backDefault ?? this.backDefault,
        backShiny: backShiny ?? this.backShiny,
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
      );

  factory Crystal.fromRawJson(String str) => Crystal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
    backDefault: json["back_default"],
    backShiny: json["back_shiny"],
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
  );

  Map<String, dynamic> toJson() => {
    "back_default": backDefault,
    "back_shiny": backShiny,
    "front_default": frontDefault,
    "front_shiny": frontShiny,
  };
}

class GenerationIii {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  final Emerald emerald;
  final Crystal fireredLeafgreen;
  final Crystal rubySapphire;

  GenerationIii copyWith({
    Emerald emerald,
    Crystal fireredLeafgreen,
    Crystal rubySapphire,
  }) =>
      GenerationIii(
        emerald: emerald ?? this.emerald,
        fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
        rubySapphire: rubySapphire ?? this.rubySapphire,
      );

  factory GenerationIii.fromRawJson(String str) => GenerationIii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
    emerald: Emerald.fromJson(json["emerald"]),
    fireredLeafgreen: Crystal.fromJson(json["firered-leafgreen"]),
    rubySapphire: Crystal.fromJson(json["ruby-sapphire"]),
  );

  Map<String, dynamic> toJson() => {
    "emerald": emerald.toJson(),
    "firered-leafgreen": fireredLeafgreen.toJson(),
    "ruby-sapphire": rubySapphire.toJson(),
  };
}

class Emerald {
  Emerald({
    this.frontDefault,
    this.frontShiny,
  });

  final String frontDefault;
  final String frontShiny;

  Emerald copyWith({
    String frontDefault,
    String frontShiny,
  }) =>
      Emerald(
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
      );

  factory Emerald.fromRawJson(String str) => Emerald.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_shiny": frontShiny,
  };
}

class GenerationVi {
  GenerationVi({
    this.omegarubyAlphasapphire,
    this.xY,
  });

  final OmegarubyAlphasapphire omegarubyAlphasapphire;
  final OmegarubyAlphasapphire xY;

  GenerationVi copyWith({
    OmegarubyAlphasapphire omegarubyAlphasapphire,
    OmegarubyAlphasapphire xY,
  }) =>
      GenerationVi(
        omegarubyAlphasapphire: omegarubyAlphasapphire ?? this.omegarubyAlphasapphire,
        xY: xY ?? this.xY,
      );

  factory GenerationVi.fromRawJson(String str) => GenerationVi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationVi.fromJson(Map<String, dynamic> json) => GenerationVi(
    omegarubyAlphasapphire: OmegarubyAlphasapphire.fromJson(json["omegaruby-alphasapphire"]),
    xY: OmegarubyAlphasapphire.fromJson(json["x-y"]),
  );

  Map<String, dynamic> toJson() => {
    "omegaruby-alphasapphire": omegarubyAlphasapphire.toJson(),
    "x-y": xY.toJson(),
  };
}

class OmegarubyAlphasapphire {
  OmegarubyAlphasapphire({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  OmegarubyAlphasapphire copyWith({
    String frontDefault,
    String frontFemale,
    String frontShiny,
    String frontShinyFemale,
  }) =>
      OmegarubyAlphasapphire(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      );

  factory OmegarubyAlphasapphire.fromRawJson(String str) => OmegarubyAlphasapphire.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OmegarubyAlphasapphire.fromJson(Map<String, dynamic> json) => OmegarubyAlphasapphire(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

class GenerationVii {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  final DreamWorld icons;
  final OmegarubyAlphasapphire ultraSunUltraMoon;

  GenerationVii copyWith({
    DreamWorld icons,
    OmegarubyAlphasapphire ultraSunUltraMoon,
  }) =>
      GenerationVii(
        icons: icons ?? this.icons,
        ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
      );

  factory GenerationVii.fromRawJson(String str) => GenerationVii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
    icons: DreamWorld.fromJson(json["icons"]),
    ultraSunUltraMoon: OmegarubyAlphasapphire.fromJson(json["ultra-sun-ultra-moon"]),
  );

  Map<String, dynamic> toJson() => {
    "icons": icons.toJson(),
    "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
  };
}

class DreamWorld {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  final String frontDefault;
  final String frontFemale;

  DreamWorld copyWith({
    String frontDefault,
    String frontFemale,
  }) =>
      DreamWorld(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
      );

  factory DreamWorld.fromRawJson(String str) => DreamWorld.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
  };
}

class GenerationViii {
  GenerationViii({
    this.icons,
  });

  final DreamWorld icons;

  GenerationViii copyWith({
    DreamWorld icons,
  }) =>
      GenerationViii(
        icons: icons ?? this.icons,
      );

  factory GenerationViii.fromRawJson(String str) => GenerationViii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
    icons: DreamWorld.fromJson(json["icons"]),
  );

  Map<String, dynamic> toJson() => {
    "icons": icons.toJson(),
  };
}

class Other {
  Other({
    this.dreamWorld,
    this.officialArtwork,
  });

  final DreamWorld dreamWorld;
  final OfficialArtwork officialArtwork;

  Other copyWith({
    DreamWorld dreamWorld,
    OfficialArtwork officialArtwork,
  }) =>
      Other(
        dreamWorld: dreamWorld ?? this.dreamWorld,
        officialArtwork: officialArtwork ?? this.officialArtwork,
      );

  factory Other.fromRawJson(String str) => Other.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    dreamWorld: DreamWorld.fromJson(json["dream_world"]),
    officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
  );

  Map<String, dynamic> toJson() => {
    "dream_world": dreamWorld.toJson(),
    "official-artwork": officialArtwork.toJson(),
  };
}

class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  final String frontDefault;

  OfficialArtwork copyWith({
    String frontDefault,
  }) =>
      OfficialArtwork(
        frontDefault: frontDefault ?? this.frontDefault,
      );

  factory OfficialArtwork.fromRawJson(String str) => OfficialArtwork.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
    frontDefault: json["front_default"],
  );

  Map<String, dynamic> toJson() => {
    "front_default": frontDefault,
  };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  final int baseStat;
  final int effort;
  final Species stat;

  Stat copyWith({
    int baseStat,
    int effort,
    Species stat,
  }) =>
      Stat(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  factory Stat.fromRawJson(String str) => Stat.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Species.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  final int slot;
  final Species type;

  Type copyWith({
    int slot,
    Species type,
  }) =>
      Type(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  factory Type.fromRawJson(String str) => Type.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}
