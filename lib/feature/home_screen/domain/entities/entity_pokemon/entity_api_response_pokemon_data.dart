class EntityApiResponsePokemonData {
  EntityApiResponsePokemonData({
    required this.data,
    required this.page,
    required this.pageSize,
    required this.count,
    required this.totalCount,
  });

  final List<DataEntity> data;
  final int? page;
  final int? pageSize;
  final int? count;
  final int? totalCount;
}

class DataEntity {
  DataEntity({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    required this.level,
    required this.hp,
    required this.types,
    required this.evolvesFrom,
    required this.abilities,
    required this.attacks,
    required this.weaknesses,
    required this.resistances,
    required this.retreatCost,
    required this.convertedRetreatCost,
    required this.datumSet,
    required this.number,
    required this.artist,
    required this.rarity,
    required this.flavorText,
    required this.nationalPokedexNumbers,
    required this.legalities,
    required this.images,
    required this.tcgplayer,
    required this.cardmarket,
    required this.evolvesTo,
    required this.rules,
  });

  final String? id;
  final String? name;
  final String? supertype;
  final List<String> subtypes;
  final String? level;
  final String? hp;
  final List<String> types;
  final String? evolvesFrom;
  final List<AbilityEntity> abilities;
  final List<AttackEntity> attacks;
  final List<ResistanceEntity> weaknesses;
  final List<ResistanceEntity> resistances;
  final List<String> retreatCost;
  final int? convertedRetreatCost;
  final SetEntity? datumSet;
  final String? number;
  final String? artist;
  final String? rarity;
  final String? flavorText;
  final List<int> nationalPokedexNumbers;
  final LegalitiesEntity? legalities;
  final DatumImagesEntity? images;
  final TcgplayerEntity? tcgplayer;
  final CardMarketEntity? cardmarket;
  final List<String> evolvesTo;
  final List<String> rules;
}

class AbilityEntity {
  AbilityEntity({
    required this.name,
    required this.text,
    required this.type,
  });

  final String? name;
  final String? text;
  final String? type;
}

class AttackEntity {
  AttackEntity({
    required this.name,
    required this.cost,
    required this.convertedEnergyCost,
    required this.damage,
    required this.text,
  });

  final String? name;
  final List<String> cost;
  final int? convertedEnergyCost;
  final String? damage;
  final String? text;
}

class CardMarketEntity {
  CardMarketEntity({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  final String? url;
  final String? updatedAt;
  final Map<String, double> prices;
}

class SetEntity {
  SetEntity({
    required this.id,
    required this.name,
    required this.series,
    required this.printedTotal,
    required this.total,
    required this.legalities,
    required this.ptcgoCode,
    required this.releaseDate,
    required this.updatedAt,
    required this.images,
  });

  final String? id;
  final String? name;
  final String? series;
  final int? printedTotal;
  final int? total;
  final LegalitiesEntity? legalities;
  final String? ptcgoCode;
  final String? releaseDate;
  final String? updatedAt;
  final SetImagesEntity? images;
}

class SetImagesEntity {
  SetImagesEntity({
    required this.symbol,
    required this.logo,
  });

  final String? symbol;
  final String? logo;
}

class LegalitiesEntity {
  LegalitiesEntity({
    required this.unlimited,
    required this.expanded,
  });

  final String? unlimited;
  final String? expanded;
}

class DatumImagesEntity {
  DatumImagesEntity({
    required this.small,
    required this.large,
  });

  final String? small;
  final String? large;
}

class ResistanceEntity {
  ResistanceEntity({
    required this.type,
    required this.value,
  });

  final String? type;
  final String? value;
}

class TcgplayerEntity {
  TcgplayerEntity({
    required this.url,
    required this.updatedAt,
    required this.prices,
  });

  final String? url;
  final String? updatedAt;
  final PricesEntity? prices;
}

class PricesEntity {
  PricesEntity({
    required this.holofoil,
    required this.reverseHolofoil,
    required this.normal,
  });

  final HolofoilEntity? holofoil;
  final HolofoilEntity? reverseHolofoil;
  final HolofoilEntity? normal;
}

class HolofoilEntity {
  HolofoilEntity({
    required this.low,
    required this.mid,
    required this.high,
    required this.market,
    required this.directLow,
  });

  final double? low;
  final double? mid;
  final double? high;
  final double? market;
  final double? directLow;
}
