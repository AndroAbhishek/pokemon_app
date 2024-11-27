import '../../../domain/entities/entity_pokemon/entity_api_response_pokemon_data.dart';

class ResponseApiPokemonModelData extends EntityApiResponsePokemonData {
  ResponseApiPokemonModelData({
    required List<Datum> data,
    required super.page,
    required super.pageSize,
    required super.count,
    required super.totalCount,
  }) : super(data: data);

  factory ResponseApiPokemonModelData.fromJson(Map<String, dynamic> json) {
    return ResponseApiPokemonModelData(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      page: json["page"],
      pageSize: json["pageSize"],
      count: json["count"],
      totalCount: json["totalCount"],
    );
  }

  ResponseApiPokemonModelData copyWith({
    List<Datum>? data,
    int? page,
    int? pageSize,
    int? count,
    int? totalCount,
  }) {
    return ResponseApiPokemonModelData(
      data: data ?? this.data as List<Datum>,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      count: count ?? this.count,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}

class Datum extends DataEntity {
  Datum({
    required super.id,
    required super.name,
    required super.supertype,
    required super.subtypes,
    required super.level,
    required super.hp,
    required super.types,
    required super.evolvesFrom,
    required super.abilities,
    required super.attacks,
    required super.weaknesses,
    required super.resistances,
    required super.retreatCost,
    required super.convertedRetreatCost,
    required super.datumSet,
    required super.number,
    required super.artist,
    required super.rarity,
    required super.flavorText,
    required super.nationalPokedexNumbers,
    required super.legalities,
    required super.images,
    required super.tcgplayer,
    required super.cardmarket,
    required super.evolvesTo,
    required super.rules,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      name: json["name"],
      supertype: json["supertype"],
      subtypes: json["subtypes"] == null
          ? []
          : List<String>.from(json["subtypes"]!.map((x) => x)),
      level: json["level"],
      hp: json["hp"],
      types: json["types"] == null
          ? []
          : List<String>.from(json["types"]!.map((x) => x)),
      evolvesFrom: json["evolvesFrom"],
      abilities: json["abilities"] == null
          ? []
          : List<Ability>.from(
              json["abilities"]!.map((x) => Ability.fromJson(x))),
      attacks: json["attacks"] == null
          ? []
          : List<Attack>.from(json["attacks"]!.map((x) => Attack.fromJson(x))),
      weaknesses: json["weaknesses"] == null
          ? []
          : List<Resistance>.from(
              json["weaknesses"]!.map((x) => Resistance.fromJson(x))),
      resistances: json["resistances"] == null
          ? []
          : List<Resistance>.from(
              json["resistances"]!.map((x) => Resistance.fromJson(x))),
      retreatCost: json["retreatCost"] == null
          ? []
          : List<String>.from(json["retreatCost"]!.map((x) => x)),
      convertedRetreatCost: json["convertedRetreatCost"],
      datumSet: json["set"] == null
          ? null
          : Set.fromJson(json["set"] as Map<String, dynamic>),
      number: json["number"],
      artist: json["artist"],
      rarity: json["rarity"],
      flavorText: json["flavorText"],
      nationalPokedexNumbers: json["nationalPokedexNumbers"] == null
          ? []
          : List<int>.from(json["nationalPokedexNumbers"]!.map((x) => x)),
      legalities: json["legalities"] == null
          ? null
          : Legalities.fromJson(json["legalities"]),
      images:
          json["images"] == null ? null : DatumImages.fromJson(json["images"]),
      tcgplayer: json["tcgplayer"] == null
          ? null
          : Tcgplayer.fromJson(json["tcgplayer"]),
      cardmarket: json["cardmarket"] == null
          ? null
          : Cardmarket.fromJson(json["cardmarket"]),
      evolvesTo: json["evolvesTo"] == null
          ? []
          : List<String>.from(json["evolvesTo"]!.map((x) => x)),
      rules: json["rules"] == null
          ? []
          : List<String>.from(json["rules"]!.map((x) => x)),
    );
  }
}

class Ability extends AbilityEntity {
  Ability({
    required super.name,
    required super.text,
    required super.type,
  });

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      name: json["name"],
      text: json["text"],
      type: json["type"],
    );
  }
}

class Attack extends AttackEntity {
  Attack({
    required super.name,
    required super.cost,
    required super.convertedEnergyCost,
    required super.damage,
    required super.text,
  });

  factory Attack.fromJson(Map<String, dynamic> json) {
    return Attack(
      name: json["name"],
      cost: json["cost"] == null
          ? []
          : List<String>.from(json["cost"]!.map((x) => x)),
      convertedEnergyCost: json["convertedEnergyCost"],
      damage: json["damage"],
      text: json["text"],
    );
  }
}

class Cardmarket extends CardMarketEntity {
  Cardmarket({
    required super.url,
    required super.updatedAt,
    required super.prices,
  });

  factory Cardmarket.fromJson(Map<String, dynamic> json) {
    return Cardmarket(
      url: json["url"],
      updatedAt: json["updatedAt"],
      prices: Map.from(json["prices"])
          .map((k, v) => MapEntry<String, double>(k, v)),
    );
  }
}

class Set extends SetEntity {
  Set({
    required super.id,
    required super.name,
    required super.series,
    required super.printedTotal,
    required super.total,
    required super.legalities,
    required super.ptcgoCode,
    required super.releaseDate,
    required super.updatedAt,
    required super.images,
  });

  factory Set.fromJson(Map<String, dynamic> json) {
    return Set(
      id: json["id"],
      name: json["name"],
      series: json["series"],
      printedTotal: json["printedTotal"],
      total: json["total"],
      legalities: json["legalities"] == null
          ? null
          : Legalities.fromJson(json["legalities"]),
      ptcgoCode: json["ptcgoCode"],
      releaseDate: json["releaseDate"],
      updatedAt: json["updatedAt"],
      images:
          json["images"] == null ? null : SetImages.fromJson(json["images"]),
    );
  }
}

class SetImages extends SetImagesEntity {
  SetImages({
    required super.symbol,
    required super.logo,
  });

  factory SetImages.fromJson(Map<String, dynamic> json) {
    return SetImages(
      symbol: json["symbol"],
      logo: json["logo"],
    );
  }
}

class Legalities extends LegalitiesEntity {
  Legalities({
    required super.unlimited,
    required super.expanded,
  });

  factory Legalities.fromJson(Map<String, dynamic> json) {
    return Legalities(
      unlimited: json["unlimited"],
      expanded: json["expanded"],
    );
  }
}

class DatumImages extends DatumImagesEntity {
  DatumImages({
    required super.small,
    required super.large,
  });

  factory DatumImages.fromJson(Map<String, dynamic> json) {
    return DatumImages(
      small: json["small"],
      large: json["large"],
    );
  }
}

class Resistance extends ResistanceEntity {
  Resistance({
    required super.type,
    required super.value,
  });

  factory Resistance.fromJson(Map<String, dynamic> json) {
    return Resistance(
      type: json["type"],
      value: json["value"],
    );
  }
}

class Tcgplayer extends TcgplayerEntity {
  Tcgplayer({
    required super.url,
    required super.updatedAt,
    required super.prices,
  });

  factory Tcgplayer.fromJson(Map<String, dynamic> json) {
    return Tcgplayer(
      url: json["url"],
      updatedAt: json["updatedAt"],
      prices: json["prices"] == null ? null : Prices.fromJson(json["prices"]),
    );
  }
}

class Prices extends PricesEntity {
  Prices({
    required super.holofoil,
    required super.reverseHolofoil,
    required super.normal,
  });

  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      holofoil:
          json["holofoil"] == null ? null : Holofoil.fromJson(json["holofoil"]),
      reverseHolofoil: json["reverseHolofoil"] == null
          ? null
          : Holofoil.fromJson(json["reverseHolofoil"]),
      normal: json["normal"] == null ? null : Holofoil.fromJson(json["normal"]),
    );
  }
}

class Holofoil extends HolofoilEntity {
  Holofoil({
    required super.low,
    required super.mid,
    required super.high,
    required super.market,
    required super.directLow,
  });

  factory Holofoil.fromJson(Map<String, dynamic> json) {
    return Holofoil(
      low: json["low"],
      mid: json["mid"],
      high: json["high"],
      market: json["market"],
      directLow: json["directLow"],
    );
  }
}
