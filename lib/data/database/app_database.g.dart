// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $IvfCyclesTable extends IvfCycles
    with TableInfo<$IvfCyclesTable, IvfCycle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IvfCyclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _husbandNameMeta = const VerificationMeta(
    'husbandName',
  );
  @override
  late final GeneratedColumn<String> husbandName = GeneratedColumn<String>(
    'husband_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wifeNameMeta = const VerificationMeta(
    'wifeName',
  );
  @override
  late final GeneratedColumn<String> wifeName = GeneratedColumn<String>(
    'wife_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _husbandAgeMeta = const VerificationMeta(
    'husbandAge',
  );
  @override
  late final GeneratedColumn<int> husbandAge = GeneratedColumn<int>(
    'husband_age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wifeAgeMeta = const VerificationMeta(
    'wifeAge',
  );
  @override
  late final GeneratedColumn<int> wifeAge = GeneratedColumn<int>(
    'wife_age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amhMeta = const VerificationMeta('amh');
  @override
  late final GeneratedColumn<double> amh = GeneratedColumn<double>(
    'amh',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bmiMeta = const VerificationMeta('bmi');
  @override
  late final GeneratedColumn<double> bmi = GeneratedColumn<double>(
    'bmi',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _infertilityTypeMeta = const VerificationMeta(
    'infertilityType',
  );
  @override
  late final GeneratedColumn<String> infertilityType = GeneratedColumn<String>(
    'infertility_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stimProtocolMeta = const VerificationMeta(
    'stimProtocol',
  );
  @override
  late final GeneratedColumn<String> stimProtocol = GeneratedColumn<String>(
    'stim_protocol',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _semenVolumeMeta = const VerificationMeta(
    'semenVolume',
  );
  @override
  late final GeneratedColumn<double> semenVolume = GeneratedColumn<double>(
    'semen_volume',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spermConcMeta = const VerificationMeta(
    'spermConc',
  );
  @override
  late final GeneratedColumn<double> spermConc = GeneratedColumn<double>(
    'sperm_conc',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _motilityFpMeta = const VerificationMeta(
    'motilityFp',
  );
  @override
  late final GeneratedColumn<double> motilityFp = GeneratedColumn<double>(
    'motility_fp',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _motilitySpMeta = const VerificationMeta(
    'motilitySp',
  );
  @override
  late final GeneratedColumn<double> motilitySp = GeneratedColumn<double>(
    'motility_sp',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _motilityImMeta = const VerificationMeta(
    'motilityIm',
  );
  @override
  late final GeneratedColumn<double> motilityIm = GeneratedColumn<double>(
    'motility_im',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oocytePickupDateMeta = const VerificationMeta(
    'oocytePickupDate',
  );
  @override
  late final GeneratedColumn<DateTime> oocytePickupDate =
      GeneratedColumn<DateTime>(
        'oocyte_pickup_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _oocytePickupTimeMeta = const VerificationMeta(
    'oocytePickupTime',
  );
  @override
  late final GeneratedColumn<String> oocytePickupTime = GeneratedColumn<String>(
    'oocyte_pickup_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _icsiTimeMeta = const VerificationMeta(
    'icsiTime',
  );
  @override
  late final GeneratedColumn<String> icsiTime = GeneratedColumn<String>(
    'icsi_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _occRecoveredMeta = const VerificationMeta(
    'occRecovered',
  );
  @override
  late final GeneratedColumn<int> occRecovered = GeneratedColumn<int>(
    'occ_recovered',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oocyteMiiMeta = const VerificationMeta(
    'oocyteMii',
  );
  @override
  late final GeneratedColumn<int> oocyteMii = GeneratedColumn<int>(
    'oocyte_mii',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oocyteMiMeta = const VerificationMeta(
    'oocyteMi',
  );
  @override
  late final GeneratedColumn<int> oocyteMi = GeneratedColumn<int>(
    'oocyte_mi',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oocyteGvMeta = const VerificationMeta(
    'oocyteGv',
  );
  @override
  late final GeneratedColumn<int> oocyteGv = GeneratedColumn<int>(
    'oocyte_gv',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    husbandName,
    wifeName,
    husbandAge,
    wifeAge,
    amh,
    bmi,
    infertilityType,
    stimProtocol,
    semenVolume,
    spermConc,
    motilityFp,
    motilitySp,
    motilityIm,
    oocytePickupDate,
    oocytePickupTime,
    icsiTime,
    occRecovered,
    oocyteMii,
    oocyteMi,
    oocyteGv,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ivf_cycles';
  @override
  VerificationContext validateIntegrity(
    Insertable<IvfCycle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('husband_name')) {
      context.handle(
        _husbandNameMeta,
        husbandName.isAcceptableOrUnknown(
          data['husband_name']!,
          _husbandNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_husbandNameMeta);
    }
    if (data.containsKey('wife_name')) {
      context.handle(
        _wifeNameMeta,
        wifeName.isAcceptableOrUnknown(data['wife_name']!, _wifeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_wifeNameMeta);
    }
    if (data.containsKey('husband_age')) {
      context.handle(
        _husbandAgeMeta,
        husbandAge.isAcceptableOrUnknown(data['husband_age']!, _husbandAgeMeta),
      );
    } else if (isInserting) {
      context.missing(_husbandAgeMeta);
    }
    if (data.containsKey('wife_age')) {
      context.handle(
        _wifeAgeMeta,
        wifeAge.isAcceptableOrUnknown(data['wife_age']!, _wifeAgeMeta),
      );
    } else if (isInserting) {
      context.missing(_wifeAgeMeta);
    }
    if (data.containsKey('amh')) {
      context.handle(
        _amhMeta,
        amh.isAcceptableOrUnknown(data['amh']!, _amhMeta),
      );
    }
    if (data.containsKey('bmi')) {
      context.handle(
        _bmiMeta,
        bmi.isAcceptableOrUnknown(data['bmi']!, _bmiMeta),
      );
    }
    if (data.containsKey('infertility_type')) {
      context.handle(
        _infertilityTypeMeta,
        infertilityType.isAcceptableOrUnknown(
          data['infertility_type']!,
          _infertilityTypeMeta,
        ),
      );
    }
    if (data.containsKey('stim_protocol')) {
      context.handle(
        _stimProtocolMeta,
        stimProtocol.isAcceptableOrUnknown(
          data['stim_protocol']!,
          _stimProtocolMeta,
        ),
      );
    }
    if (data.containsKey('semen_volume')) {
      context.handle(
        _semenVolumeMeta,
        semenVolume.isAcceptableOrUnknown(
          data['semen_volume']!,
          _semenVolumeMeta,
        ),
      );
    }
    if (data.containsKey('sperm_conc')) {
      context.handle(
        _spermConcMeta,
        spermConc.isAcceptableOrUnknown(data['sperm_conc']!, _spermConcMeta),
      );
    }
    if (data.containsKey('motility_fp')) {
      context.handle(
        _motilityFpMeta,
        motilityFp.isAcceptableOrUnknown(data['motility_fp']!, _motilityFpMeta),
      );
    }
    if (data.containsKey('motility_sp')) {
      context.handle(
        _motilitySpMeta,
        motilitySp.isAcceptableOrUnknown(data['motility_sp']!, _motilitySpMeta),
      );
    }
    if (data.containsKey('motility_im')) {
      context.handle(
        _motilityImMeta,
        motilityIm.isAcceptableOrUnknown(data['motility_im']!, _motilityImMeta),
      );
    }
    if (data.containsKey('oocyte_pickup_date')) {
      context.handle(
        _oocytePickupDateMeta,
        oocytePickupDate.isAcceptableOrUnknown(
          data['oocyte_pickup_date']!,
          _oocytePickupDateMeta,
        ),
      );
    }
    if (data.containsKey('oocyte_pickup_time')) {
      context.handle(
        _oocytePickupTimeMeta,
        oocytePickupTime.isAcceptableOrUnknown(
          data['oocyte_pickup_time']!,
          _oocytePickupTimeMeta,
        ),
      );
    }
    if (data.containsKey('icsi_time')) {
      context.handle(
        _icsiTimeMeta,
        icsiTime.isAcceptableOrUnknown(data['icsi_time']!, _icsiTimeMeta),
      );
    }
    if (data.containsKey('occ_recovered')) {
      context.handle(
        _occRecoveredMeta,
        occRecovered.isAcceptableOrUnknown(
          data['occ_recovered']!,
          _occRecoveredMeta,
        ),
      );
    }
    if (data.containsKey('oocyte_mii')) {
      context.handle(
        _oocyteMiiMeta,
        oocyteMii.isAcceptableOrUnknown(data['oocyte_mii']!, _oocyteMiiMeta),
      );
    }
    if (data.containsKey('oocyte_mi')) {
      context.handle(
        _oocyteMiMeta,
        oocyteMi.isAcceptableOrUnknown(data['oocyte_mi']!, _oocyteMiMeta),
      );
    }
    if (data.containsKey('oocyte_gv')) {
      context.handle(
        _oocyteGvMeta,
        oocyteGv.isAcceptableOrUnknown(data['oocyte_gv']!, _oocyteGvMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IvfCycle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IvfCycle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      husbandName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}husband_name'],
      )!,
      wifeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}wife_name'],
      )!,
      husbandAge: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}husband_age'],
      )!,
      wifeAge: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wife_age'],
      )!,
      amh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amh'],
      ),
      bmi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}bmi'],
      ),
      infertilityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}infertility_type'],
      ),
      stimProtocol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stim_protocol'],
      ),
      semenVolume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}semen_volume'],
      ),
      spermConc: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sperm_conc'],
      ),
      motilityFp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}motility_fp'],
      ),
      motilitySp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}motility_sp'],
      ),
      motilityIm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}motility_im'],
      ),
      oocytePickupDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}oocyte_pickup_date'],
      ),
      oocytePickupTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}oocyte_pickup_time'],
      ),
      icsiTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icsi_time'],
      ),
      occRecovered: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}occ_recovered'],
      ),
      oocyteMii: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}oocyte_mii'],
      ),
      oocyteMi: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}oocyte_mi'],
      ),
      oocyteGv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}oocyte_gv'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $IvfCyclesTable createAlias(String alias) {
    return $IvfCyclesTable(attachedDatabase, alias);
  }
}

class IvfCycle extends DataClass implements Insertable<IvfCycle> {
  final int id;
  final String husbandName;
  final String wifeName;
  final int husbandAge;
  final int wifeAge;
  final double? amh;
  final double? bmi;
  final String? infertilityType;
  final String? stimProtocol;
  final double? semenVolume;
  final double? spermConc;
  final double? motilityFp;
  final double? motilitySp;
  final double? motilityIm;
  final DateTime? oocytePickupDate;
  final String? oocytePickupTime;
  final String? icsiTime;
  final int? occRecovered;
  final int? oocyteMii;
  final int? oocyteMi;
  final int? oocyteGv;
  final DateTime createdAt;
  final DateTime updatedAt;
  const IvfCycle({
    required this.id,
    required this.husbandName,
    required this.wifeName,
    required this.husbandAge,
    required this.wifeAge,
    this.amh,
    this.bmi,
    this.infertilityType,
    this.stimProtocol,
    this.semenVolume,
    this.spermConc,
    this.motilityFp,
    this.motilitySp,
    this.motilityIm,
    this.oocytePickupDate,
    this.oocytePickupTime,
    this.icsiTime,
    this.occRecovered,
    this.oocyteMii,
    this.oocyteMi,
    this.oocyteGv,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['husband_name'] = Variable<String>(husbandName);
    map['wife_name'] = Variable<String>(wifeName);
    map['husband_age'] = Variable<int>(husbandAge);
    map['wife_age'] = Variable<int>(wifeAge);
    if (!nullToAbsent || amh != null) {
      map['amh'] = Variable<double>(amh);
    }
    if (!nullToAbsent || bmi != null) {
      map['bmi'] = Variable<double>(bmi);
    }
    if (!nullToAbsent || infertilityType != null) {
      map['infertility_type'] = Variable<String>(infertilityType);
    }
    if (!nullToAbsent || stimProtocol != null) {
      map['stim_protocol'] = Variable<String>(stimProtocol);
    }
    if (!nullToAbsent || semenVolume != null) {
      map['semen_volume'] = Variable<double>(semenVolume);
    }
    if (!nullToAbsent || spermConc != null) {
      map['sperm_conc'] = Variable<double>(spermConc);
    }
    if (!nullToAbsent || motilityFp != null) {
      map['motility_fp'] = Variable<double>(motilityFp);
    }
    if (!nullToAbsent || motilitySp != null) {
      map['motility_sp'] = Variable<double>(motilitySp);
    }
    if (!nullToAbsent || motilityIm != null) {
      map['motility_im'] = Variable<double>(motilityIm);
    }
    if (!nullToAbsent || oocytePickupDate != null) {
      map['oocyte_pickup_date'] = Variable<DateTime>(oocytePickupDate);
    }
    if (!nullToAbsent || oocytePickupTime != null) {
      map['oocyte_pickup_time'] = Variable<String>(oocytePickupTime);
    }
    if (!nullToAbsent || icsiTime != null) {
      map['icsi_time'] = Variable<String>(icsiTime);
    }
    if (!nullToAbsent || occRecovered != null) {
      map['occ_recovered'] = Variable<int>(occRecovered);
    }
    if (!nullToAbsent || oocyteMii != null) {
      map['oocyte_mii'] = Variable<int>(oocyteMii);
    }
    if (!nullToAbsent || oocyteMi != null) {
      map['oocyte_mi'] = Variable<int>(oocyteMi);
    }
    if (!nullToAbsent || oocyteGv != null) {
      map['oocyte_gv'] = Variable<int>(oocyteGv);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  IvfCyclesCompanion toCompanion(bool nullToAbsent) {
    return IvfCyclesCompanion(
      id: Value(id),
      husbandName: Value(husbandName),
      wifeName: Value(wifeName),
      husbandAge: Value(husbandAge),
      wifeAge: Value(wifeAge),
      amh: amh == null && nullToAbsent ? const Value.absent() : Value(amh),
      bmi: bmi == null && nullToAbsent ? const Value.absent() : Value(bmi),
      infertilityType: infertilityType == null && nullToAbsent
          ? const Value.absent()
          : Value(infertilityType),
      stimProtocol: stimProtocol == null && nullToAbsent
          ? const Value.absent()
          : Value(stimProtocol),
      semenVolume: semenVolume == null && nullToAbsent
          ? const Value.absent()
          : Value(semenVolume),
      spermConc: spermConc == null && nullToAbsent
          ? const Value.absent()
          : Value(spermConc),
      motilityFp: motilityFp == null && nullToAbsent
          ? const Value.absent()
          : Value(motilityFp),
      motilitySp: motilitySp == null && nullToAbsent
          ? const Value.absent()
          : Value(motilitySp),
      motilityIm: motilityIm == null && nullToAbsent
          ? const Value.absent()
          : Value(motilityIm),
      oocytePickupDate: oocytePickupDate == null && nullToAbsent
          ? const Value.absent()
          : Value(oocytePickupDate),
      oocytePickupTime: oocytePickupTime == null && nullToAbsent
          ? const Value.absent()
          : Value(oocytePickupTime),
      icsiTime: icsiTime == null && nullToAbsent
          ? const Value.absent()
          : Value(icsiTime),
      occRecovered: occRecovered == null && nullToAbsent
          ? const Value.absent()
          : Value(occRecovered),
      oocyteMii: oocyteMii == null && nullToAbsent
          ? const Value.absent()
          : Value(oocyteMii),
      oocyteMi: oocyteMi == null && nullToAbsent
          ? const Value.absent()
          : Value(oocyteMi),
      oocyteGv: oocyteGv == null && nullToAbsent
          ? const Value.absent()
          : Value(oocyteGv),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory IvfCycle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IvfCycle(
      id: serializer.fromJson<int>(json['id']),
      husbandName: serializer.fromJson<String>(json['husbandName']),
      wifeName: serializer.fromJson<String>(json['wifeName']),
      husbandAge: serializer.fromJson<int>(json['husbandAge']),
      wifeAge: serializer.fromJson<int>(json['wifeAge']),
      amh: serializer.fromJson<double?>(json['amh']),
      bmi: serializer.fromJson<double?>(json['bmi']),
      infertilityType: serializer.fromJson<String?>(json['infertilityType']),
      stimProtocol: serializer.fromJson<String?>(json['stimProtocol']),
      semenVolume: serializer.fromJson<double?>(json['semenVolume']),
      spermConc: serializer.fromJson<double?>(json['spermConc']),
      motilityFp: serializer.fromJson<double?>(json['motilityFp']),
      motilitySp: serializer.fromJson<double?>(json['motilitySp']),
      motilityIm: serializer.fromJson<double?>(json['motilityIm']),
      oocytePickupDate: serializer.fromJson<DateTime?>(
        json['oocytePickupDate'],
      ),
      oocytePickupTime: serializer.fromJson<String?>(json['oocytePickupTime']),
      icsiTime: serializer.fromJson<String?>(json['icsiTime']),
      occRecovered: serializer.fromJson<int?>(json['occRecovered']),
      oocyteMii: serializer.fromJson<int?>(json['oocyteMii']),
      oocyteMi: serializer.fromJson<int?>(json['oocyteMi']),
      oocyteGv: serializer.fromJson<int?>(json['oocyteGv']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'husbandName': serializer.toJson<String>(husbandName),
      'wifeName': serializer.toJson<String>(wifeName),
      'husbandAge': serializer.toJson<int>(husbandAge),
      'wifeAge': serializer.toJson<int>(wifeAge),
      'amh': serializer.toJson<double?>(amh),
      'bmi': serializer.toJson<double?>(bmi),
      'infertilityType': serializer.toJson<String?>(infertilityType),
      'stimProtocol': serializer.toJson<String?>(stimProtocol),
      'semenVolume': serializer.toJson<double?>(semenVolume),
      'spermConc': serializer.toJson<double?>(spermConc),
      'motilityFp': serializer.toJson<double?>(motilityFp),
      'motilitySp': serializer.toJson<double?>(motilitySp),
      'motilityIm': serializer.toJson<double?>(motilityIm),
      'oocytePickupDate': serializer.toJson<DateTime?>(oocytePickupDate),
      'oocytePickupTime': serializer.toJson<String?>(oocytePickupTime),
      'icsiTime': serializer.toJson<String?>(icsiTime),
      'occRecovered': serializer.toJson<int?>(occRecovered),
      'oocyteMii': serializer.toJson<int?>(oocyteMii),
      'oocyteMi': serializer.toJson<int?>(oocyteMi),
      'oocyteGv': serializer.toJson<int?>(oocyteGv),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  IvfCycle copyWith({
    int? id,
    String? husbandName,
    String? wifeName,
    int? husbandAge,
    int? wifeAge,
    Value<double?> amh = const Value.absent(),
    Value<double?> bmi = const Value.absent(),
    Value<String?> infertilityType = const Value.absent(),
    Value<String?> stimProtocol = const Value.absent(),
    Value<double?> semenVolume = const Value.absent(),
    Value<double?> spermConc = const Value.absent(),
    Value<double?> motilityFp = const Value.absent(),
    Value<double?> motilitySp = const Value.absent(),
    Value<double?> motilityIm = const Value.absent(),
    Value<DateTime?> oocytePickupDate = const Value.absent(),
    Value<String?> oocytePickupTime = const Value.absent(),
    Value<String?> icsiTime = const Value.absent(),
    Value<int?> occRecovered = const Value.absent(),
    Value<int?> oocyteMii = const Value.absent(),
    Value<int?> oocyteMi = const Value.absent(),
    Value<int?> oocyteGv = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => IvfCycle(
    id: id ?? this.id,
    husbandName: husbandName ?? this.husbandName,
    wifeName: wifeName ?? this.wifeName,
    husbandAge: husbandAge ?? this.husbandAge,
    wifeAge: wifeAge ?? this.wifeAge,
    amh: amh.present ? amh.value : this.amh,
    bmi: bmi.present ? bmi.value : this.bmi,
    infertilityType: infertilityType.present
        ? infertilityType.value
        : this.infertilityType,
    stimProtocol: stimProtocol.present ? stimProtocol.value : this.stimProtocol,
    semenVolume: semenVolume.present ? semenVolume.value : this.semenVolume,
    spermConc: spermConc.present ? spermConc.value : this.spermConc,
    motilityFp: motilityFp.present ? motilityFp.value : this.motilityFp,
    motilitySp: motilitySp.present ? motilitySp.value : this.motilitySp,
    motilityIm: motilityIm.present ? motilityIm.value : this.motilityIm,
    oocytePickupDate: oocytePickupDate.present
        ? oocytePickupDate.value
        : this.oocytePickupDate,
    oocytePickupTime: oocytePickupTime.present
        ? oocytePickupTime.value
        : this.oocytePickupTime,
    icsiTime: icsiTime.present ? icsiTime.value : this.icsiTime,
    occRecovered: occRecovered.present ? occRecovered.value : this.occRecovered,
    oocyteMii: oocyteMii.present ? oocyteMii.value : this.oocyteMii,
    oocyteMi: oocyteMi.present ? oocyteMi.value : this.oocyteMi,
    oocyteGv: oocyteGv.present ? oocyteGv.value : this.oocyteGv,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  IvfCycle copyWithCompanion(IvfCyclesCompanion data) {
    return IvfCycle(
      id: data.id.present ? data.id.value : this.id,
      husbandName: data.husbandName.present
          ? data.husbandName.value
          : this.husbandName,
      wifeName: data.wifeName.present ? data.wifeName.value : this.wifeName,
      husbandAge: data.husbandAge.present
          ? data.husbandAge.value
          : this.husbandAge,
      wifeAge: data.wifeAge.present ? data.wifeAge.value : this.wifeAge,
      amh: data.amh.present ? data.amh.value : this.amh,
      bmi: data.bmi.present ? data.bmi.value : this.bmi,
      infertilityType: data.infertilityType.present
          ? data.infertilityType.value
          : this.infertilityType,
      stimProtocol: data.stimProtocol.present
          ? data.stimProtocol.value
          : this.stimProtocol,
      semenVolume: data.semenVolume.present
          ? data.semenVolume.value
          : this.semenVolume,
      spermConc: data.spermConc.present ? data.spermConc.value : this.spermConc,
      motilityFp: data.motilityFp.present
          ? data.motilityFp.value
          : this.motilityFp,
      motilitySp: data.motilitySp.present
          ? data.motilitySp.value
          : this.motilitySp,
      motilityIm: data.motilityIm.present
          ? data.motilityIm.value
          : this.motilityIm,
      oocytePickupDate: data.oocytePickupDate.present
          ? data.oocytePickupDate.value
          : this.oocytePickupDate,
      oocytePickupTime: data.oocytePickupTime.present
          ? data.oocytePickupTime.value
          : this.oocytePickupTime,
      icsiTime: data.icsiTime.present ? data.icsiTime.value : this.icsiTime,
      occRecovered: data.occRecovered.present
          ? data.occRecovered.value
          : this.occRecovered,
      oocyteMii: data.oocyteMii.present ? data.oocyteMii.value : this.oocyteMii,
      oocyteMi: data.oocyteMi.present ? data.oocyteMi.value : this.oocyteMi,
      oocyteGv: data.oocyteGv.present ? data.oocyteGv.value : this.oocyteGv,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IvfCycle(')
          ..write('id: $id, ')
          ..write('husbandName: $husbandName, ')
          ..write('wifeName: $wifeName, ')
          ..write('husbandAge: $husbandAge, ')
          ..write('wifeAge: $wifeAge, ')
          ..write('amh: $amh, ')
          ..write('bmi: $bmi, ')
          ..write('infertilityType: $infertilityType, ')
          ..write('stimProtocol: $stimProtocol, ')
          ..write('semenVolume: $semenVolume, ')
          ..write('spermConc: $spermConc, ')
          ..write('motilityFp: $motilityFp, ')
          ..write('motilitySp: $motilitySp, ')
          ..write('motilityIm: $motilityIm, ')
          ..write('oocytePickupDate: $oocytePickupDate, ')
          ..write('oocytePickupTime: $oocytePickupTime, ')
          ..write('icsiTime: $icsiTime, ')
          ..write('occRecovered: $occRecovered, ')
          ..write('oocyteMii: $oocyteMii, ')
          ..write('oocyteMi: $oocyteMi, ')
          ..write('oocyteGv: $oocyteGv, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    husbandName,
    wifeName,
    husbandAge,
    wifeAge,
    amh,
    bmi,
    infertilityType,
    stimProtocol,
    semenVolume,
    spermConc,
    motilityFp,
    motilitySp,
    motilityIm,
    oocytePickupDate,
    oocytePickupTime,
    icsiTime,
    occRecovered,
    oocyteMii,
    oocyteMi,
    oocyteGv,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IvfCycle &&
          other.id == this.id &&
          other.husbandName == this.husbandName &&
          other.wifeName == this.wifeName &&
          other.husbandAge == this.husbandAge &&
          other.wifeAge == this.wifeAge &&
          other.amh == this.amh &&
          other.bmi == this.bmi &&
          other.infertilityType == this.infertilityType &&
          other.stimProtocol == this.stimProtocol &&
          other.semenVolume == this.semenVolume &&
          other.spermConc == this.spermConc &&
          other.motilityFp == this.motilityFp &&
          other.motilitySp == this.motilitySp &&
          other.motilityIm == this.motilityIm &&
          other.oocytePickupDate == this.oocytePickupDate &&
          other.oocytePickupTime == this.oocytePickupTime &&
          other.icsiTime == this.icsiTime &&
          other.occRecovered == this.occRecovered &&
          other.oocyteMii == this.oocyteMii &&
          other.oocyteMi == this.oocyteMi &&
          other.oocyteGv == this.oocyteGv &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class IvfCyclesCompanion extends UpdateCompanion<IvfCycle> {
  final Value<int> id;
  final Value<String> husbandName;
  final Value<String> wifeName;
  final Value<int> husbandAge;
  final Value<int> wifeAge;
  final Value<double?> amh;
  final Value<double?> bmi;
  final Value<String?> infertilityType;
  final Value<String?> stimProtocol;
  final Value<double?> semenVolume;
  final Value<double?> spermConc;
  final Value<double?> motilityFp;
  final Value<double?> motilitySp;
  final Value<double?> motilityIm;
  final Value<DateTime?> oocytePickupDate;
  final Value<String?> oocytePickupTime;
  final Value<String?> icsiTime;
  final Value<int?> occRecovered;
  final Value<int?> oocyteMii;
  final Value<int?> oocyteMi;
  final Value<int?> oocyteGv;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const IvfCyclesCompanion({
    this.id = const Value.absent(),
    this.husbandName = const Value.absent(),
    this.wifeName = const Value.absent(),
    this.husbandAge = const Value.absent(),
    this.wifeAge = const Value.absent(),
    this.amh = const Value.absent(),
    this.bmi = const Value.absent(),
    this.infertilityType = const Value.absent(),
    this.stimProtocol = const Value.absent(),
    this.semenVolume = const Value.absent(),
    this.spermConc = const Value.absent(),
    this.motilityFp = const Value.absent(),
    this.motilitySp = const Value.absent(),
    this.motilityIm = const Value.absent(),
    this.oocytePickupDate = const Value.absent(),
    this.oocytePickupTime = const Value.absent(),
    this.icsiTime = const Value.absent(),
    this.occRecovered = const Value.absent(),
    this.oocyteMii = const Value.absent(),
    this.oocyteMi = const Value.absent(),
    this.oocyteGv = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  IvfCyclesCompanion.insert({
    this.id = const Value.absent(),
    required String husbandName,
    required String wifeName,
    required int husbandAge,
    required int wifeAge,
    this.amh = const Value.absent(),
    this.bmi = const Value.absent(),
    this.infertilityType = const Value.absent(),
    this.stimProtocol = const Value.absent(),
    this.semenVolume = const Value.absent(),
    this.spermConc = const Value.absent(),
    this.motilityFp = const Value.absent(),
    this.motilitySp = const Value.absent(),
    this.motilityIm = const Value.absent(),
    this.oocytePickupDate = const Value.absent(),
    this.oocytePickupTime = const Value.absent(),
    this.icsiTime = const Value.absent(),
    this.occRecovered = const Value.absent(),
    this.oocyteMii = const Value.absent(),
    this.oocyteMi = const Value.absent(),
    this.oocyteGv = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : husbandName = Value(husbandName),
       wifeName = Value(wifeName),
       husbandAge = Value(husbandAge),
       wifeAge = Value(wifeAge);
  static Insertable<IvfCycle> custom({
    Expression<int>? id,
    Expression<String>? husbandName,
    Expression<String>? wifeName,
    Expression<int>? husbandAge,
    Expression<int>? wifeAge,
    Expression<double>? amh,
    Expression<double>? bmi,
    Expression<String>? infertilityType,
    Expression<String>? stimProtocol,
    Expression<double>? semenVolume,
    Expression<double>? spermConc,
    Expression<double>? motilityFp,
    Expression<double>? motilitySp,
    Expression<double>? motilityIm,
    Expression<DateTime>? oocytePickupDate,
    Expression<String>? oocytePickupTime,
    Expression<String>? icsiTime,
    Expression<int>? occRecovered,
    Expression<int>? oocyteMii,
    Expression<int>? oocyteMi,
    Expression<int>? oocyteGv,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (husbandName != null) 'husband_name': husbandName,
      if (wifeName != null) 'wife_name': wifeName,
      if (husbandAge != null) 'husband_age': husbandAge,
      if (wifeAge != null) 'wife_age': wifeAge,
      if (amh != null) 'amh': amh,
      if (bmi != null) 'bmi': bmi,
      if (infertilityType != null) 'infertility_type': infertilityType,
      if (stimProtocol != null) 'stim_protocol': stimProtocol,
      if (semenVolume != null) 'semen_volume': semenVolume,
      if (spermConc != null) 'sperm_conc': spermConc,
      if (motilityFp != null) 'motility_fp': motilityFp,
      if (motilitySp != null) 'motility_sp': motilitySp,
      if (motilityIm != null) 'motility_im': motilityIm,
      if (oocytePickupDate != null) 'oocyte_pickup_date': oocytePickupDate,
      if (oocytePickupTime != null) 'oocyte_pickup_time': oocytePickupTime,
      if (icsiTime != null) 'icsi_time': icsiTime,
      if (occRecovered != null) 'occ_recovered': occRecovered,
      if (oocyteMii != null) 'oocyte_mii': oocyteMii,
      if (oocyteMi != null) 'oocyte_mi': oocyteMi,
      if (oocyteGv != null) 'oocyte_gv': oocyteGv,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  IvfCyclesCompanion copyWith({
    Value<int>? id,
    Value<String>? husbandName,
    Value<String>? wifeName,
    Value<int>? husbandAge,
    Value<int>? wifeAge,
    Value<double?>? amh,
    Value<double?>? bmi,
    Value<String?>? infertilityType,
    Value<String?>? stimProtocol,
    Value<double?>? semenVolume,
    Value<double?>? spermConc,
    Value<double?>? motilityFp,
    Value<double?>? motilitySp,
    Value<double?>? motilityIm,
    Value<DateTime?>? oocytePickupDate,
    Value<String?>? oocytePickupTime,
    Value<String?>? icsiTime,
    Value<int?>? occRecovered,
    Value<int?>? oocyteMii,
    Value<int?>? oocyteMi,
    Value<int?>? oocyteGv,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return IvfCyclesCompanion(
      id: id ?? this.id,
      husbandName: husbandName ?? this.husbandName,
      wifeName: wifeName ?? this.wifeName,
      husbandAge: husbandAge ?? this.husbandAge,
      wifeAge: wifeAge ?? this.wifeAge,
      amh: amh ?? this.amh,
      bmi: bmi ?? this.bmi,
      infertilityType: infertilityType ?? this.infertilityType,
      stimProtocol: stimProtocol ?? this.stimProtocol,
      semenVolume: semenVolume ?? this.semenVolume,
      spermConc: spermConc ?? this.spermConc,
      motilityFp: motilityFp ?? this.motilityFp,
      motilitySp: motilitySp ?? this.motilitySp,
      motilityIm: motilityIm ?? this.motilityIm,
      oocytePickupDate: oocytePickupDate ?? this.oocytePickupDate,
      oocytePickupTime: oocytePickupTime ?? this.oocytePickupTime,
      icsiTime: icsiTime ?? this.icsiTime,
      occRecovered: occRecovered ?? this.occRecovered,
      oocyteMii: oocyteMii ?? this.oocyteMii,
      oocyteMi: oocyteMi ?? this.oocyteMi,
      oocyteGv: oocyteGv ?? this.oocyteGv,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (husbandName.present) {
      map['husband_name'] = Variable<String>(husbandName.value);
    }
    if (wifeName.present) {
      map['wife_name'] = Variable<String>(wifeName.value);
    }
    if (husbandAge.present) {
      map['husband_age'] = Variable<int>(husbandAge.value);
    }
    if (wifeAge.present) {
      map['wife_age'] = Variable<int>(wifeAge.value);
    }
    if (amh.present) {
      map['amh'] = Variable<double>(amh.value);
    }
    if (bmi.present) {
      map['bmi'] = Variable<double>(bmi.value);
    }
    if (infertilityType.present) {
      map['infertility_type'] = Variable<String>(infertilityType.value);
    }
    if (stimProtocol.present) {
      map['stim_protocol'] = Variable<String>(stimProtocol.value);
    }
    if (semenVolume.present) {
      map['semen_volume'] = Variable<double>(semenVolume.value);
    }
    if (spermConc.present) {
      map['sperm_conc'] = Variable<double>(spermConc.value);
    }
    if (motilityFp.present) {
      map['motility_fp'] = Variable<double>(motilityFp.value);
    }
    if (motilitySp.present) {
      map['motility_sp'] = Variable<double>(motilitySp.value);
    }
    if (motilityIm.present) {
      map['motility_im'] = Variable<double>(motilityIm.value);
    }
    if (oocytePickupDate.present) {
      map['oocyte_pickup_date'] = Variable<DateTime>(oocytePickupDate.value);
    }
    if (oocytePickupTime.present) {
      map['oocyte_pickup_time'] = Variable<String>(oocytePickupTime.value);
    }
    if (icsiTime.present) {
      map['icsi_time'] = Variable<String>(icsiTime.value);
    }
    if (occRecovered.present) {
      map['occ_recovered'] = Variable<int>(occRecovered.value);
    }
    if (oocyteMii.present) {
      map['oocyte_mii'] = Variable<int>(oocyteMii.value);
    }
    if (oocyteMi.present) {
      map['oocyte_mi'] = Variable<int>(oocyteMi.value);
    }
    if (oocyteGv.present) {
      map['oocyte_gv'] = Variable<int>(oocyteGv.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IvfCyclesCompanion(')
          ..write('id: $id, ')
          ..write('husbandName: $husbandName, ')
          ..write('wifeName: $wifeName, ')
          ..write('husbandAge: $husbandAge, ')
          ..write('wifeAge: $wifeAge, ')
          ..write('amh: $amh, ')
          ..write('bmi: $bmi, ')
          ..write('infertilityType: $infertilityType, ')
          ..write('stimProtocol: $stimProtocol, ')
          ..write('semenVolume: $semenVolume, ')
          ..write('spermConc: $spermConc, ')
          ..write('motilityFp: $motilityFp, ')
          ..write('motilitySp: $motilitySp, ')
          ..write('motilityIm: $motilityIm, ')
          ..write('oocytePickupDate: $oocytePickupDate, ')
          ..write('oocytePickupTime: $oocytePickupTime, ')
          ..write('icsiTime: $icsiTime, ')
          ..write('occRecovered: $occRecovered, ')
          ..write('oocyteMii: $oocyteMii, ')
          ..write('oocyteMi: $oocyteMi, ')
          ..write('oocyteGv: $oocyteGv, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DayObservationsTable extends DayObservations
    with TableInfo<$DayObservationsTable, DayObservation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayObservationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<int> cycleId = GeneratedColumn<int>(
    'cycle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ivf_cycles (id)',
    ),
  );
  static const VerificationMeta _dayNumberMeta = const VerificationMeta(
    'dayNumber',
  );
  @override
  late final GeneratedColumn<int> dayNumber = GeneratedColumn<int>(
    'day_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _twoPN2PBMeta = const VerificationMeta(
    'twoPN2PB',
  );
  @override
  late final GeneratedColumn<int> twoPN2PB = GeneratedColumn<int>(
    'two_p_n2_p_b',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _twoPBOnlyMeta = const VerificationMeta(
    'twoPBOnly',
  );
  @override
  late final GeneratedColumn<int> twoPBOnly = GeneratedColumn<int>(
    'two_p_b_only',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _necroticMeta = const VerificationMeta(
    'necrotic',
  );
  @override
  late final GeneratedColumn<int> necrotic = GeneratedColumn<int>(
    'necrotic',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _twoPNArrestMeta = const VerificationMeta(
    'twoPNArrest',
  );
  @override
  late final GeneratedColumn<int> twoPNArrest = GeneratedColumn<int>(
    'two_p_n_arrest',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fourCellG1Meta = const VerificationMeta(
    'fourCellG1',
  );
  @override
  late final GeneratedColumn<int> fourCellG1 = GeneratedColumn<int>(
    'four_cell_g1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fourCellG2Meta = const VerificationMeta(
    'fourCellG2',
  );
  @override
  late final GeneratedColumn<int> fourCellG2 = GeneratedColumn<int>(
    'four_cell_g2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _twoCellsMeta = const VerificationMeta(
    'twoCells',
  );
  @override
  late final GeneratedColumn<int> twoCells = GeneratedColumn<int>(
    'two_cells',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _threeCellsMeta = const VerificationMeta(
    'threeCells',
  );
  @override
  late final GeneratedColumn<int> threeCells = GeneratedColumn<int>(
    'three_cells',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fiveCellsMeta = const VerificationMeta(
    'fiveCells',
  );
  @override
  late final GeneratedColumn<int> fiveCells = GeneratedColumn<int>(
    'five_cells',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eightCellG1Meta = const VerificationMeta(
    'eightCellG1',
  );
  @override
  late final GeneratedColumn<int> eightCellG1 = GeneratedColumn<int>(
    'eight_cell_g1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eightCellG2Meta = const VerificationMeta(
    'eightCellG2',
  );
  @override
  late final GeneratedColumn<int> eightCellG2 = GeneratedColumn<int>(
    'eight_cell_g2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fourCellArrestMeta = const VerificationMeta(
    'fourCellArrest',
  );
  @override
  late final GeneratedColumn<int> fourCellArrest = GeneratedColumn<int>(
    'four_cell_arrest',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cycleId,
    dayNumber,
    twoPN2PB,
    twoPBOnly,
    necrotic,
    twoPNArrest,
    fourCellG1,
    fourCellG2,
    twoCells,
    threeCells,
    fiveCells,
    eightCellG1,
    eightCellG2,
    fourCellArrest,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'day_observations';
  @override
  VerificationContext validateIntegrity(
    Insertable<DayObservation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cycleIdMeta);
    }
    if (data.containsKey('day_number')) {
      context.handle(
        _dayNumberMeta,
        dayNumber.isAcceptableOrUnknown(data['day_number']!, _dayNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_dayNumberMeta);
    }
    if (data.containsKey('two_p_n2_p_b')) {
      context.handle(
        _twoPN2PBMeta,
        twoPN2PB.isAcceptableOrUnknown(data['two_p_n2_p_b']!, _twoPN2PBMeta),
      );
    }
    if (data.containsKey('two_p_b_only')) {
      context.handle(
        _twoPBOnlyMeta,
        twoPBOnly.isAcceptableOrUnknown(data['two_p_b_only']!, _twoPBOnlyMeta),
      );
    }
    if (data.containsKey('necrotic')) {
      context.handle(
        _necroticMeta,
        necrotic.isAcceptableOrUnknown(data['necrotic']!, _necroticMeta),
      );
    }
    if (data.containsKey('two_p_n_arrest')) {
      context.handle(
        _twoPNArrestMeta,
        twoPNArrest.isAcceptableOrUnknown(
          data['two_p_n_arrest']!,
          _twoPNArrestMeta,
        ),
      );
    }
    if (data.containsKey('four_cell_g1')) {
      context.handle(
        _fourCellG1Meta,
        fourCellG1.isAcceptableOrUnknown(
          data['four_cell_g1']!,
          _fourCellG1Meta,
        ),
      );
    }
    if (data.containsKey('four_cell_g2')) {
      context.handle(
        _fourCellG2Meta,
        fourCellG2.isAcceptableOrUnknown(
          data['four_cell_g2']!,
          _fourCellG2Meta,
        ),
      );
    }
    if (data.containsKey('two_cells')) {
      context.handle(
        _twoCellsMeta,
        twoCells.isAcceptableOrUnknown(data['two_cells']!, _twoCellsMeta),
      );
    }
    if (data.containsKey('three_cells')) {
      context.handle(
        _threeCellsMeta,
        threeCells.isAcceptableOrUnknown(data['three_cells']!, _threeCellsMeta),
      );
    }
    if (data.containsKey('five_cells')) {
      context.handle(
        _fiveCellsMeta,
        fiveCells.isAcceptableOrUnknown(data['five_cells']!, _fiveCellsMeta),
      );
    }
    if (data.containsKey('eight_cell_g1')) {
      context.handle(
        _eightCellG1Meta,
        eightCellG1.isAcceptableOrUnknown(
          data['eight_cell_g1']!,
          _eightCellG1Meta,
        ),
      );
    }
    if (data.containsKey('eight_cell_g2')) {
      context.handle(
        _eightCellG2Meta,
        eightCellG2.isAcceptableOrUnknown(
          data['eight_cell_g2']!,
          _eightCellG2Meta,
        ),
      );
    }
    if (data.containsKey('four_cell_arrest')) {
      context.handle(
        _fourCellArrestMeta,
        fourCellArrest.isAcceptableOrUnknown(
          data['four_cell_arrest']!,
          _fourCellArrestMeta,
        ),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {cycleId, dayNumber},
  ];
  @override
  DayObservation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DayObservation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_id'],
      )!,
      dayNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}day_number'],
      )!,
      twoPN2PB: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}two_p_n2_p_b'],
      ),
      twoPBOnly: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}two_p_b_only'],
      ),
      necrotic: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}necrotic'],
      ),
      twoPNArrest: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}two_p_n_arrest'],
      ),
      fourCellG1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}four_cell_g1'],
      ),
      fourCellG2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}four_cell_g2'],
      ),
      twoCells: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}two_cells'],
      ),
      threeCells: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}three_cells'],
      ),
      fiveCells: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}five_cells'],
      ),
      eightCellG1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}eight_cell_g1'],
      ),
      eightCellG2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}eight_cell_g2'],
      ),
      fourCellArrest: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}four_cell_arrest'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $DayObservationsTable createAlias(String alias) {
    return $DayObservationsTable(attachedDatabase, alias);
  }
}

class DayObservation extends DataClass implements Insertable<DayObservation> {
  final int id;
  final int cycleId;
  final int dayNumber;
  final int? twoPN2PB;
  final int? twoPBOnly;
  final int? necrotic;
  final int? twoPNArrest;
  final int? fourCellG1;
  final int? fourCellG2;
  final int? twoCells;
  final int? threeCells;
  final int? fiveCells;
  final int? eightCellG1;
  final int? eightCellG2;
  final int? fourCellArrest;
  final DateTime recordedAt;
  const DayObservation({
    required this.id,
    required this.cycleId,
    required this.dayNumber,
    this.twoPN2PB,
    this.twoPBOnly,
    this.necrotic,
    this.twoPNArrest,
    this.fourCellG1,
    this.fourCellG2,
    this.twoCells,
    this.threeCells,
    this.fiveCells,
    this.eightCellG1,
    this.eightCellG2,
    this.fourCellArrest,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cycle_id'] = Variable<int>(cycleId);
    map['day_number'] = Variable<int>(dayNumber);
    if (!nullToAbsent || twoPN2PB != null) {
      map['two_p_n2_p_b'] = Variable<int>(twoPN2PB);
    }
    if (!nullToAbsent || twoPBOnly != null) {
      map['two_p_b_only'] = Variable<int>(twoPBOnly);
    }
    if (!nullToAbsent || necrotic != null) {
      map['necrotic'] = Variable<int>(necrotic);
    }
    if (!nullToAbsent || twoPNArrest != null) {
      map['two_p_n_arrest'] = Variable<int>(twoPNArrest);
    }
    if (!nullToAbsent || fourCellG1 != null) {
      map['four_cell_g1'] = Variable<int>(fourCellG1);
    }
    if (!nullToAbsent || fourCellG2 != null) {
      map['four_cell_g2'] = Variable<int>(fourCellG2);
    }
    if (!nullToAbsent || twoCells != null) {
      map['two_cells'] = Variable<int>(twoCells);
    }
    if (!nullToAbsent || threeCells != null) {
      map['three_cells'] = Variable<int>(threeCells);
    }
    if (!nullToAbsent || fiveCells != null) {
      map['five_cells'] = Variable<int>(fiveCells);
    }
    if (!nullToAbsent || eightCellG1 != null) {
      map['eight_cell_g1'] = Variable<int>(eightCellG1);
    }
    if (!nullToAbsent || eightCellG2 != null) {
      map['eight_cell_g2'] = Variable<int>(eightCellG2);
    }
    if (!nullToAbsent || fourCellArrest != null) {
      map['four_cell_arrest'] = Variable<int>(fourCellArrest);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  DayObservationsCompanion toCompanion(bool nullToAbsent) {
    return DayObservationsCompanion(
      id: Value(id),
      cycleId: Value(cycleId),
      dayNumber: Value(dayNumber),
      twoPN2PB: twoPN2PB == null && nullToAbsent
          ? const Value.absent()
          : Value(twoPN2PB),
      twoPBOnly: twoPBOnly == null && nullToAbsent
          ? const Value.absent()
          : Value(twoPBOnly),
      necrotic: necrotic == null && nullToAbsent
          ? const Value.absent()
          : Value(necrotic),
      twoPNArrest: twoPNArrest == null && nullToAbsent
          ? const Value.absent()
          : Value(twoPNArrest),
      fourCellG1: fourCellG1 == null && nullToAbsent
          ? const Value.absent()
          : Value(fourCellG1),
      fourCellG2: fourCellG2 == null && nullToAbsent
          ? const Value.absent()
          : Value(fourCellG2),
      twoCells: twoCells == null && nullToAbsent
          ? const Value.absent()
          : Value(twoCells),
      threeCells: threeCells == null && nullToAbsent
          ? const Value.absent()
          : Value(threeCells),
      fiveCells: fiveCells == null && nullToAbsent
          ? const Value.absent()
          : Value(fiveCells),
      eightCellG1: eightCellG1 == null && nullToAbsent
          ? const Value.absent()
          : Value(eightCellG1),
      eightCellG2: eightCellG2 == null && nullToAbsent
          ? const Value.absent()
          : Value(eightCellG2),
      fourCellArrest: fourCellArrest == null && nullToAbsent
          ? const Value.absent()
          : Value(fourCellArrest),
      recordedAt: Value(recordedAt),
    );
  }

  factory DayObservation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayObservation(
      id: serializer.fromJson<int>(json['id']),
      cycleId: serializer.fromJson<int>(json['cycleId']),
      dayNumber: serializer.fromJson<int>(json['dayNumber']),
      twoPN2PB: serializer.fromJson<int?>(json['twoPN2PB']),
      twoPBOnly: serializer.fromJson<int?>(json['twoPBOnly']),
      necrotic: serializer.fromJson<int?>(json['necrotic']),
      twoPNArrest: serializer.fromJson<int?>(json['twoPNArrest']),
      fourCellG1: serializer.fromJson<int?>(json['fourCellG1']),
      fourCellG2: serializer.fromJson<int?>(json['fourCellG2']),
      twoCells: serializer.fromJson<int?>(json['twoCells']),
      threeCells: serializer.fromJson<int?>(json['threeCells']),
      fiveCells: serializer.fromJson<int?>(json['fiveCells']),
      eightCellG1: serializer.fromJson<int?>(json['eightCellG1']),
      eightCellG2: serializer.fromJson<int?>(json['eightCellG2']),
      fourCellArrest: serializer.fromJson<int?>(json['fourCellArrest']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cycleId': serializer.toJson<int>(cycleId),
      'dayNumber': serializer.toJson<int>(dayNumber),
      'twoPN2PB': serializer.toJson<int?>(twoPN2PB),
      'twoPBOnly': serializer.toJson<int?>(twoPBOnly),
      'necrotic': serializer.toJson<int?>(necrotic),
      'twoPNArrest': serializer.toJson<int?>(twoPNArrest),
      'fourCellG1': serializer.toJson<int?>(fourCellG1),
      'fourCellG2': serializer.toJson<int?>(fourCellG2),
      'twoCells': serializer.toJson<int?>(twoCells),
      'threeCells': serializer.toJson<int?>(threeCells),
      'fiveCells': serializer.toJson<int?>(fiveCells),
      'eightCellG1': serializer.toJson<int?>(eightCellG1),
      'eightCellG2': serializer.toJson<int?>(eightCellG2),
      'fourCellArrest': serializer.toJson<int?>(fourCellArrest),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  DayObservation copyWith({
    int? id,
    int? cycleId,
    int? dayNumber,
    Value<int?> twoPN2PB = const Value.absent(),
    Value<int?> twoPBOnly = const Value.absent(),
    Value<int?> necrotic = const Value.absent(),
    Value<int?> twoPNArrest = const Value.absent(),
    Value<int?> fourCellG1 = const Value.absent(),
    Value<int?> fourCellG2 = const Value.absent(),
    Value<int?> twoCells = const Value.absent(),
    Value<int?> threeCells = const Value.absent(),
    Value<int?> fiveCells = const Value.absent(),
    Value<int?> eightCellG1 = const Value.absent(),
    Value<int?> eightCellG2 = const Value.absent(),
    Value<int?> fourCellArrest = const Value.absent(),
    DateTime? recordedAt,
  }) => DayObservation(
    id: id ?? this.id,
    cycleId: cycleId ?? this.cycleId,
    dayNumber: dayNumber ?? this.dayNumber,
    twoPN2PB: twoPN2PB.present ? twoPN2PB.value : this.twoPN2PB,
    twoPBOnly: twoPBOnly.present ? twoPBOnly.value : this.twoPBOnly,
    necrotic: necrotic.present ? necrotic.value : this.necrotic,
    twoPNArrest: twoPNArrest.present ? twoPNArrest.value : this.twoPNArrest,
    fourCellG1: fourCellG1.present ? fourCellG1.value : this.fourCellG1,
    fourCellG2: fourCellG2.present ? fourCellG2.value : this.fourCellG2,
    twoCells: twoCells.present ? twoCells.value : this.twoCells,
    threeCells: threeCells.present ? threeCells.value : this.threeCells,
    fiveCells: fiveCells.present ? fiveCells.value : this.fiveCells,
    eightCellG1: eightCellG1.present ? eightCellG1.value : this.eightCellG1,
    eightCellG2: eightCellG2.present ? eightCellG2.value : this.eightCellG2,
    fourCellArrest: fourCellArrest.present
        ? fourCellArrest.value
        : this.fourCellArrest,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  DayObservation copyWithCompanion(DayObservationsCompanion data) {
    return DayObservation(
      id: data.id.present ? data.id.value : this.id,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      dayNumber: data.dayNumber.present ? data.dayNumber.value : this.dayNumber,
      twoPN2PB: data.twoPN2PB.present ? data.twoPN2PB.value : this.twoPN2PB,
      twoPBOnly: data.twoPBOnly.present ? data.twoPBOnly.value : this.twoPBOnly,
      necrotic: data.necrotic.present ? data.necrotic.value : this.necrotic,
      twoPNArrest: data.twoPNArrest.present
          ? data.twoPNArrest.value
          : this.twoPNArrest,
      fourCellG1: data.fourCellG1.present
          ? data.fourCellG1.value
          : this.fourCellG1,
      fourCellG2: data.fourCellG2.present
          ? data.fourCellG2.value
          : this.fourCellG2,
      twoCells: data.twoCells.present ? data.twoCells.value : this.twoCells,
      threeCells: data.threeCells.present
          ? data.threeCells.value
          : this.threeCells,
      fiveCells: data.fiveCells.present ? data.fiveCells.value : this.fiveCells,
      eightCellG1: data.eightCellG1.present
          ? data.eightCellG1.value
          : this.eightCellG1,
      eightCellG2: data.eightCellG2.present
          ? data.eightCellG2.value
          : this.eightCellG2,
      fourCellArrest: data.fourCellArrest.present
          ? data.fourCellArrest.value
          : this.fourCellArrest,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DayObservation(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('twoPN2PB: $twoPN2PB, ')
          ..write('twoPBOnly: $twoPBOnly, ')
          ..write('necrotic: $necrotic, ')
          ..write('twoPNArrest: $twoPNArrest, ')
          ..write('fourCellG1: $fourCellG1, ')
          ..write('fourCellG2: $fourCellG2, ')
          ..write('twoCells: $twoCells, ')
          ..write('threeCells: $threeCells, ')
          ..write('fiveCells: $fiveCells, ')
          ..write('eightCellG1: $eightCellG1, ')
          ..write('eightCellG2: $eightCellG2, ')
          ..write('fourCellArrest: $fourCellArrest, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cycleId,
    dayNumber,
    twoPN2PB,
    twoPBOnly,
    necrotic,
    twoPNArrest,
    fourCellG1,
    fourCellG2,
    twoCells,
    threeCells,
    fiveCells,
    eightCellG1,
    eightCellG2,
    fourCellArrest,
    recordedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayObservation &&
          other.id == this.id &&
          other.cycleId == this.cycleId &&
          other.dayNumber == this.dayNumber &&
          other.twoPN2PB == this.twoPN2PB &&
          other.twoPBOnly == this.twoPBOnly &&
          other.necrotic == this.necrotic &&
          other.twoPNArrest == this.twoPNArrest &&
          other.fourCellG1 == this.fourCellG1 &&
          other.fourCellG2 == this.fourCellG2 &&
          other.twoCells == this.twoCells &&
          other.threeCells == this.threeCells &&
          other.fiveCells == this.fiveCells &&
          other.eightCellG1 == this.eightCellG1 &&
          other.eightCellG2 == this.eightCellG2 &&
          other.fourCellArrest == this.fourCellArrest &&
          other.recordedAt == this.recordedAt);
}

class DayObservationsCompanion extends UpdateCompanion<DayObservation> {
  final Value<int> id;
  final Value<int> cycleId;
  final Value<int> dayNumber;
  final Value<int?> twoPN2PB;
  final Value<int?> twoPBOnly;
  final Value<int?> necrotic;
  final Value<int?> twoPNArrest;
  final Value<int?> fourCellG1;
  final Value<int?> fourCellG2;
  final Value<int?> twoCells;
  final Value<int?> threeCells;
  final Value<int?> fiveCells;
  final Value<int?> eightCellG1;
  final Value<int?> eightCellG2;
  final Value<int?> fourCellArrest;
  final Value<DateTime> recordedAt;
  const DayObservationsCompanion({
    this.id = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.twoPN2PB = const Value.absent(),
    this.twoPBOnly = const Value.absent(),
    this.necrotic = const Value.absent(),
    this.twoPNArrest = const Value.absent(),
    this.fourCellG1 = const Value.absent(),
    this.fourCellG2 = const Value.absent(),
    this.twoCells = const Value.absent(),
    this.threeCells = const Value.absent(),
    this.fiveCells = const Value.absent(),
    this.eightCellG1 = const Value.absent(),
    this.eightCellG2 = const Value.absent(),
    this.fourCellArrest = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  DayObservationsCompanion.insert({
    this.id = const Value.absent(),
    required int cycleId,
    required int dayNumber,
    this.twoPN2PB = const Value.absent(),
    this.twoPBOnly = const Value.absent(),
    this.necrotic = const Value.absent(),
    this.twoPNArrest = const Value.absent(),
    this.fourCellG1 = const Value.absent(),
    this.fourCellG2 = const Value.absent(),
    this.twoCells = const Value.absent(),
    this.threeCells = const Value.absent(),
    this.fiveCells = const Value.absent(),
    this.eightCellG1 = const Value.absent(),
    this.eightCellG2 = const Value.absent(),
    this.fourCellArrest = const Value.absent(),
    this.recordedAt = const Value.absent(),
  }) : cycleId = Value(cycleId),
       dayNumber = Value(dayNumber);
  static Insertable<DayObservation> custom({
    Expression<int>? id,
    Expression<int>? cycleId,
    Expression<int>? dayNumber,
    Expression<int>? twoPN2PB,
    Expression<int>? twoPBOnly,
    Expression<int>? necrotic,
    Expression<int>? twoPNArrest,
    Expression<int>? fourCellG1,
    Expression<int>? fourCellG2,
    Expression<int>? twoCells,
    Expression<int>? threeCells,
    Expression<int>? fiveCells,
    Expression<int>? eightCellG1,
    Expression<int>? eightCellG2,
    Expression<int>? fourCellArrest,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cycleId != null) 'cycle_id': cycleId,
      if (dayNumber != null) 'day_number': dayNumber,
      if (twoPN2PB != null) 'two_p_n2_p_b': twoPN2PB,
      if (twoPBOnly != null) 'two_p_b_only': twoPBOnly,
      if (necrotic != null) 'necrotic': necrotic,
      if (twoPNArrest != null) 'two_p_n_arrest': twoPNArrest,
      if (fourCellG1 != null) 'four_cell_g1': fourCellG1,
      if (fourCellG2 != null) 'four_cell_g2': fourCellG2,
      if (twoCells != null) 'two_cells': twoCells,
      if (threeCells != null) 'three_cells': threeCells,
      if (fiveCells != null) 'five_cells': fiveCells,
      if (eightCellG1 != null) 'eight_cell_g1': eightCellG1,
      if (eightCellG2 != null) 'eight_cell_g2': eightCellG2,
      if (fourCellArrest != null) 'four_cell_arrest': fourCellArrest,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  DayObservationsCompanion copyWith({
    Value<int>? id,
    Value<int>? cycleId,
    Value<int>? dayNumber,
    Value<int?>? twoPN2PB,
    Value<int?>? twoPBOnly,
    Value<int?>? necrotic,
    Value<int?>? twoPNArrest,
    Value<int?>? fourCellG1,
    Value<int?>? fourCellG2,
    Value<int?>? twoCells,
    Value<int?>? threeCells,
    Value<int?>? fiveCells,
    Value<int?>? eightCellG1,
    Value<int?>? eightCellG2,
    Value<int?>? fourCellArrest,
    Value<DateTime>? recordedAt,
  }) {
    return DayObservationsCompanion(
      id: id ?? this.id,
      cycleId: cycleId ?? this.cycleId,
      dayNumber: dayNumber ?? this.dayNumber,
      twoPN2PB: twoPN2PB ?? this.twoPN2PB,
      twoPBOnly: twoPBOnly ?? this.twoPBOnly,
      necrotic: necrotic ?? this.necrotic,
      twoPNArrest: twoPNArrest ?? this.twoPNArrest,
      fourCellG1: fourCellG1 ?? this.fourCellG1,
      fourCellG2: fourCellG2 ?? this.fourCellG2,
      twoCells: twoCells ?? this.twoCells,
      threeCells: threeCells ?? this.threeCells,
      fiveCells: fiveCells ?? this.fiveCells,
      eightCellG1: eightCellG1 ?? this.eightCellG1,
      eightCellG2: eightCellG2 ?? this.eightCellG2,
      fourCellArrest: fourCellArrest ?? this.fourCellArrest,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<int>(cycleId.value);
    }
    if (dayNumber.present) {
      map['day_number'] = Variable<int>(dayNumber.value);
    }
    if (twoPN2PB.present) {
      map['two_p_n2_p_b'] = Variable<int>(twoPN2PB.value);
    }
    if (twoPBOnly.present) {
      map['two_p_b_only'] = Variable<int>(twoPBOnly.value);
    }
    if (necrotic.present) {
      map['necrotic'] = Variable<int>(necrotic.value);
    }
    if (twoPNArrest.present) {
      map['two_p_n_arrest'] = Variable<int>(twoPNArrest.value);
    }
    if (fourCellG1.present) {
      map['four_cell_g1'] = Variable<int>(fourCellG1.value);
    }
    if (fourCellG2.present) {
      map['four_cell_g2'] = Variable<int>(fourCellG2.value);
    }
    if (twoCells.present) {
      map['two_cells'] = Variable<int>(twoCells.value);
    }
    if (threeCells.present) {
      map['three_cells'] = Variable<int>(threeCells.value);
    }
    if (fiveCells.present) {
      map['five_cells'] = Variable<int>(fiveCells.value);
    }
    if (eightCellG1.present) {
      map['eight_cell_g1'] = Variable<int>(eightCellG1.value);
    }
    if (eightCellG2.present) {
      map['eight_cell_g2'] = Variable<int>(eightCellG2.value);
    }
    if (fourCellArrest.present) {
      map['four_cell_arrest'] = Variable<int>(fourCellArrest.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayObservationsCompanion(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('twoPN2PB: $twoPN2PB, ')
          ..write('twoPBOnly: $twoPBOnly, ')
          ..write('necrotic: $necrotic, ')
          ..write('twoPNArrest: $twoPNArrest, ')
          ..write('fourCellG1: $fourCellG1, ')
          ..write('fourCellG2: $fourCellG2, ')
          ..write('twoCells: $twoCells, ')
          ..write('threeCells: $threeCells, ')
          ..write('fiveCells: $fiveCells, ')
          ..write('eightCellG1: $eightCellG1, ')
          ..write('eightCellG2: $eightCellG2, ')
          ..write('fourCellArrest: $fourCellArrest, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

class $BlastocystGradesTable extends BlastocystGrades
    with TableInfo<$BlastocystGradesTable, BlastocystGrade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlastocystGradesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<int> cycleId = GeneratedColumn<int>(
    'cycle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ivf_cycles (id)',
    ),
  );
  static const VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<String> grade = GeneratedColumn<String>(
    'grade',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, cycleId, grade, count];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blastocyst_grades';
  @override
  VerificationContext validateIntegrity(
    Insertable<BlastocystGrade> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cycleIdMeta);
    }
    if (data.containsKey('grade')) {
      context.handle(
        _gradeMeta,
        grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta),
      );
    } else if (isInserting) {
      context.missing(_gradeMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BlastocystGrade map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlastocystGrade(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_id'],
      )!,
      grade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grade'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
    );
  }

  @override
  $BlastocystGradesTable createAlias(String alias) {
    return $BlastocystGradesTable(attachedDatabase, alias);
  }
}

class BlastocystGrade extends DataClass implements Insertable<BlastocystGrade> {
  final int id;
  final int cycleId;
  final String grade;
  final int count;
  const BlastocystGrade({
    required this.id,
    required this.cycleId,
    required this.grade,
    required this.count,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cycle_id'] = Variable<int>(cycleId);
    map['grade'] = Variable<String>(grade);
    map['count'] = Variable<int>(count);
    return map;
  }

  BlastocystGradesCompanion toCompanion(bool nullToAbsent) {
    return BlastocystGradesCompanion(
      id: Value(id),
      cycleId: Value(cycleId),
      grade: Value(grade),
      count: Value(count),
    );
  }

  factory BlastocystGrade.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlastocystGrade(
      id: serializer.fromJson<int>(json['id']),
      cycleId: serializer.fromJson<int>(json['cycleId']),
      grade: serializer.fromJson<String>(json['grade']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cycleId': serializer.toJson<int>(cycleId),
      'grade': serializer.toJson<String>(grade),
      'count': serializer.toJson<int>(count),
    };
  }

  BlastocystGrade copyWith({
    int? id,
    int? cycleId,
    String? grade,
    int? count,
  }) => BlastocystGrade(
    id: id ?? this.id,
    cycleId: cycleId ?? this.cycleId,
    grade: grade ?? this.grade,
    count: count ?? this.count,
  );
  BlastocystGrade copyWithCompanion(BlastocystGradesCompanion data) {
    return BlastocystGrade(
      id: data.id.present ? data.id.value : this.id,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      grade: data.grade.present ? data.grade.value : this.grade,
      count: data.count.present ? data.count.value : this.count,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BlastocystGrade(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('grade: $grade, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cycleId, grade, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlastocystGrade &&
          other.id == this.id &&
          other.cycleId == this.cycleId &&
          other.grade == this.grade &&
          other.count == this.count);
}

class BlastocystGradesCompanion extends UpdateCompanion<BlastocystGrade> {
  final Value<int> id;
  final Value<int> cycleId;
  final Value<String> grade;
  final Value<int> count;
  const BlastocystGradesCompanion({
    this.id = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.grade = const Value.absent(),
    this.count = const Value.absent(),
  });
  BlastocystGradesCompanion.insert({
    this.id = const Value.absent(),
    required int cycleId,
    required String grade,
    this.count = const Value.absent(),
  }) : cycleId = Value(cycleId),
       grade = Value(grade);
  static Insertable<BlastocystGrade> custom({
    Expression<int>? id,
    Expression<int>? cycleId,
    Expression<String>? grade,
    Expression<int>? count,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cycleId != null) 'cycle_id': cycleId,
      if (grade != null) 'grade': grade,
      if (count != null) 'count': count,
    });
  }

  BlastocystGradesCompanion copyWith({
    Value<int>? id,
    Value<int>? cycleId,
    Value<String>? grade,
    Value<int>? count,
  }) {
    return BlastocystGradesCompanion(
      id: id ?? this.id,
      cycleId: cycleId ?? this.cycleId,
      grade: grade ?? this.grade,
      count: count ?? this.count,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<int>(cycleId.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlastocystGradesCompanion(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('grade: $grade, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }
}

class $EmbryoTransfersTable extends EmbryoTransfers
    with TableInfo<$EmbryoTransfersTable, EmbryoTransfer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmbryoTransfersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<int> cycleId = GeneratedColumn<int>(
    'cycle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ivf_cycles (id)',
    ),
  );
  static const VerificationMeta _embryosTransferredMeta =
      const VerificationMeta('embryosTransferred');
  @override
  late final GeneratedColumn<int> embryosTransferred = GeneratedColumn<int>(
    'embryos_transferred',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _transferDateMeta = const VerificationMeta(
    'transferDate',
  );
  @override
  late final GeneratedColumn<DateTime> transferDate = GeneratedColumn<DateTime>(
    'transfer_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _embryosFrozenMeta = const VerificationMeta(
    'embryosFrozen',
  );
  @override
  late final GeneratedColumn<int> embryosFrozen = GeneratedColumn<int>(
    'embryos_frozen',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cryoDeviceMeta = const VerificationMeta(
    'cryoDevice',
  );
  @override
  late final GeneratedColumn<String> cryoDevice = GeneratedColumn<String>(
    'cryo_device',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cycleId,
    embryosTransferred,
    transferDate,
    embryosFrozen,
    cryoDevice,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'embryo_transfers';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmbryoTransfer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cycleIdMeta);
    }
    if (data.containsKey('embryos_transferred')) {
      context.handle(
        _embryosTransferredMeta,
        embryosTransferred.isAcceptableOrUnknown(
          data['embryos_transferred']!,
          _embryosTransferredMeta,
        ),
      );
    }
    if (data.containsKey('transfer_date')) {
      context.handle(
        _transferDateMeta,
        transferDate.isAcceptableOrUnknown(
          data['transfer_date']!,
          _transferDateMeta,
        ),
      );
    }
    if (data.containsKey('embryos_frozen')) {
      context.handle(
        _embryosFrozenMeta,
        embryosFrozen.isAcceptableOrUnknown(
          data['embryos_frozen']!,
          _embryosFrozenMeta,
        ),
      );
    }
    if (data.containsKey('cryo_device')) {
      context.handle(
        _cryoDeviceMeta,
        cryoDevice.isAcceptableOrUnknown(data['cryo_device']!, _cryoDeviceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EmbryoTransfer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmbryoTransfer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_id'],
      )!,
      embryosTransferred: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}embryos_transferred'],
      ),
      transferDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}transfer_date'],
      ),
      embryosFrozen: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}embryos_frozen'],
      ),
      cryoDevice: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cryo_device'],
      ),
    );
  }

  @override
  $EmbryoTransfersTable createAlias(String alias) {
    return $EmbryoTransfersTable(attachedDatabase, alias);
  }
}

class EmbryoTransfer extends DataClass implements Insertable<EmbryoTransfer> {
  final int id;
  final int cycleId;
  final int? embryosTransferred;
  final DateTime? transferDate;
  final int? embryosFrozen;
  final String? cryoDevice;
  const EmbryoTransfer({
    required this.id,
    required this.cycleId,
    this.embryosTransferred,
    this.transferDate,
    this.embryosFrozen,
    this.cryoDevice,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cycle_id'] = Variable<int>(cycleId);
    if (!nullToAbsent || embryosTransferred != null) {
      map['embryos_transferred'] = Variable<int>(embryosTransferred);
    }
    if (!nullToAbsent || transferDate != null) {
      map['transfer_date'] = Variable<DateTime>(transferDate);
    }
    if (!nullToAbsent || embryosFrozen != null) {
      map['embryos_frozen'] = Variable<int>(embryosFrozen);
    }
    if (!nullToAbsent || cryoDevice != null) {
      map['cryo_device'] = Variable<String>(cryoDevice);
    }
    return map;
  }

  EmbryoTransfersCompanion toCompanion(bool nullToAbsent) {
    return EmbryoTransfersCompanion(
      id: Value(id),
      cycleId: Value(cycleId),
      embryosTransferred: embryosTransferred == null && nullToAbsent
          ? const Value.absent()
          : Value(embryosTransferred),
      transferDate: transferDate == null && nullToAbsent
          ? const Value.absent()
          : Value(transferDate),
      embryosFrozen: embryosFrozen == null && nullToAbsent
          ? const Value.absent()
          : Value(embryosFrozen),
      cryoDevice: cryoDevice == null && nullToAbsent
          ? const Value.absent()
          : Value(cryoDevice),
    );
  }

  factory EmbryoTransfer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmbryoTransfer(
      id: serializer.fromJson<int>(json['id']),
      cycleId: serializer.fromJson<int>(json['cycleId']),
      embryosTransferred: serializer.fromJson<int?>(json['embryosTransferred']),
      transferDate: serializer.fromJson<DateTime?>(json['transferDate']),
      embryosFrozen: serializer.fromJson<int?>(json['embryosFrozen']),
      cryoDevice: serializer.fromJson<String?>(json['cryoDevice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cycleId': serializer.toJson<int>(cycleId),
      'embryosTransferred': serializer.toJson<int?>(embryosTransferred),
      'transferDate': serializer.toJson<DateTime?>(transferDate),
      'embryosFrozen': serializer.toJson<int?>(embryosFrozen),
      'cryoDevice': serializer.toJson<String?>(cryoDevice),
    };
  }

  EmbryoTransfer copyWith({
    int? id,
    int? cycleId,
    Value<int?> embryosTransferred = const Value.absent(),
    Value<DateTime?> transferDate = const Value.absent(),
    Value<int?> embryosFrozen = const Value.absent(),
    Value<String?> cryoDevice = const Value.absent(),
  }) => EmbryoTransfer(
    id: id ?? this.id,
    cycleId: cycleId ?? this.cycleId,
    embryosTransferred: embryosTransferred.present
        ? embryosTransferred.value
        : this.embryosTransferred,
    transferDate: transferDate.present ? transferDate.value : this.transferDate,
    embryosFrozen: embryosFrozen.present
        ? embryosFrozen.value
        : this.embryosFrozen,
    cryoDevice: cryoDevice.present ? cryoDevice.value : this.cryoDevice,
  );
  EmbryoTransfer copyWithCompanion(EmbryoTransfersCompanion data) {
    return EmbryoTransfer(
      id: data.id.present ? data.id.value : this.id,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      embryosTransferred: data.embryosTransferred.present
          ? data.embryosTransferred.value
          : this.embryosTransferred,
      transferDate: data.transferDate.present
          ? data.transferDate.value
          : this.transferDate,
      embryosFrozen: data.embryosFrozen.present
          ? data.embryosFrozen.value
          : this.embryosFrozen,
      cryoDevice: data.cryoDevice.present
          ? data.cryoDevice.value
          : this.cryoDevice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmbryoTransfer(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('embryosTransferred: $embryosTransferred, ')
          ..write('transferDate: $transferDate, ')
          ..write('embryosFrozen: $embryosFrozen, ')
          ..write('cryoDevice: $cryoDevice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cycleId,
    embryosTransferred,
    transferDate,
    embryosFrozen,
    cryoDevice,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmbryoTransfer &&
          other.id == this.id &&
          other.cycleId == this.cycleId &&
          other.embryosTransferred == this.embryosTransferred &&
          other.transferDate == this.transferDate &&
          other.embryosFrozen == this.embryosFrozen &&
          other.cryoDevice == this.cryoDevice);
}

class EmbryoTransfersCompanion extends UpdateCompanion<EmbryoTransfer> {
  final Value<int> id;
  final Value<int> cycleId;
  final Value<int?> embryosTransferred;
  final Value<DateTime?> transferDate;
  final Value<int?> embryosFrozen;
  final Value<String?> cryoDevice;
  const EmbryoTransfersCompanion({
    this.id = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.embryosTransferred = const Value.absent(),
    this.transferDate = const Value.absent(),
    this.embryosFrozen = const Value.absent(),
    this.cryoDevice = const Value.absent(),
  });
  EmbryoTransfersCompanion.insert({
    this.id = const Value.absent(),
    required int cycleId,
    this.embryosTransferred = const Value.absent(),
    this.transferDate = const Value.absent(),
    this.embryosFrozen = const Value.absent(),
    this.cryoDevice = const Value.absent(),
  }) : cycleId = Value(cycleId);
  static Insertable<EmbryoTransfer> custom({
    Expression<int>? id,
    Expression<int>? cycleId,
    Expression<int>? embryosTransferred,
    Expression<DateTime>? transferDate,
    Expression<int>? embryosFrozen,
    Expression<String>? cryoDevice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cycleId != null) 'cycle_id': cycleId,
      if (embryosTransferred != null) 'embryos_transferred': embryosTransferred,
      if (transferDate != null) 'transfer_date': transferDate,
      if (embryosFrozen != null) 'embryos_frozen': embryosFrozen,
      if (cryoDevice != null) 'cryo_device': cryoDevice,
    });
  }

  EmbryoTransfersCompanion copyWith({
    Value<int>? id,
    Value<int>? cycleId,
    Value<int?>? embryosTransferred,
    Value<DateTime?>? transferDate,
    Value<int?>? embryosFrozen,
    Value<String?>? cryoDevice,
  }) {
    return EmbryoTransfersCompanion(
      id: id ?? this.id,
      cycleId: cycleId ?? this.cycleId,
      embryosTransferred: embryosTransferred ?? this.embryosTransferred,
      transferDate: transferDate ?? this.transferDate,
      embryosFrozen: embryosFrozen ?? this.embryosFrozen,
      cryoDevice: cryoDevice ?? this.cryoDevice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<int>(cycleId.value);
    }
    if (embryosTransferred.present) {
      map['embryos_transferred'] = Variable<int>(embryosTransferred.value);
    }
    if (transferDate.present) {
      map['transfer_date'] = Variable<DateTime>(transferDate.value);
    }
    if (embryosFrozen.present) {
      map['embryos_frozen'] = Variable<int>(embryosFrozen.value);
    }
    if (cryoDevice.present) {
      map['cryo_device'] = Variable<String>(cryoDevice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmbryoTransfersCompanion(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('embryosTransferred: $embryosTransferred, ')
          ..write('transferDate: $transferDate, ')
          ..write('embryosFrozen: $embryosFrozen, ')
          ..write('cryoDevice: $cryoDevice')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $IvfCyclesTable ivfCycles = $IvfCyclesTable(this);
  late final $DayObservationsTable dayObservations = $DayObservationsTable(
    this,
  );
  late final $BlastocystGradesTable blastocystGrades = $BlastocystGradesTable(
    this,
  );
  late final $EmbryoTransfersTable embryoTransfers = $EmbryoTransfersTable(
    this,
  );
  late final CyclesDao cyclesDao = CyclesDao(this as AppDatabase);
  late final ObservationsDao observationsDao = ObservationsDao(
    this as AppDatabase,
  );
  late final BlastocystsDao blastocystsDao = BlastocystsDao(
    this as AppDatabase,
  );
  late final TransferDao transferDao = TransferDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    ivfCycles,
    dayObservations,
    blastocystGrades,
    embryoTransfers,
  ];
}

typedef $$IvfCyclesTableCreateCompanionBuilder =
    IvfCyclesCompanion Function({
      Value<int> id,
      required String husbandName,
      required String wifeName,
      required int husbandAge,
      required int wifeAge,
      Value<double?> amh,
      Value<double?> bmi,
      Value<String?> infertilityType,
      Value<String?> stimProtocol,
      Value<double?> semenVolume,
      Value<double?> spermConc,
      Value<double?> motilityFp,
      Value<double?> motilitySp,
      Value<double?> motilityIm,
      Value<DateTime?> oocytePickupDate,
      Value<String?> oocytePickupTime,
      Value<String?> icsiTime,
      Value<int?> occRecovered,
      Value<int?> oocyteMii,
      Value<int?> oocyteMi,
      Value<int?> oocyteGv,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$IvfCyclesTableUpdateCompanionBuilder =
    IvfCyclesCompanion Function({
      Value<int> id,
      Value<String> husbandName,
      Value<String> wifeName,
      Value<int> husbandAge,
      Value<int> wifeAge,
      Value<double?> amh,
      Value<double?> bmi,
      Value<String?> infertilityType,
      Value<String?> stimProtocol,
      Value<double?> semenVolume,
      Value<double?> spermConc,
      Value<double?> motilityFp,
      Value<double?> motilitySp,
      Value<double?> motilityIm,
      Value<DateTime?> oocytePickupDate,
      Value<String?> oocytePickupTime,
      Value<String?> icsiTime,
      Value<int?> occRecovered,
      Value<int?> oocyteMii,
      Value<int?> oocyteMi,
      Value<int?> oocyteGv,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$IvfCyclesTableReferences
    extends BaseReferences<_$AppDatabase, $IvfCyclesTable, IvfCycle> {
  $$IvfCyclesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DayObservationsTable, List<DayObservation>>
  _dayObservationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.dayObservations,
    aliasName: $_aliasNameGenerator(
      db.ivfCycles.id,
      db.dayObservations.cycleId,
    ),
  );

  $$DayObservationsTableProcessedTableManager get dayObservationsRefs {
    final manager = $$DayObservationsTableTableManager(
      $_db,
      $_db.dayObservations,
    ).filter((f) => f.cycleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _dayObservationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$BlastocystGradesTable, List<BlastocystGrade>>
  _blastocystGradesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.blastocystGrades,
    aliasName: $_aliasNameGenerator(
      db.ivfCycles.id,
      db.blastocystGrades.cycleId,
    ),
  );

  $$BlastocystGradesTableProcessedTableManager get blastocystGradesRefs {
    final manager = $$BlastocystGradesTableTableManager(
      $_db,
      $_db.blastocystGrades,
    ).filter((f) => f.cycleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _blastocystGradesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EmbryoTransfersTable, List<EmbryoTransfer>>
  _embryoTransfersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.embryoTransfers,
    aliasName: $_aliasNameGenerator(
      db.ivfCycles.id,
      db.embryoTransfers.cycleId,
    ),
  );

  $$EmbryoTransfersTableProcessedTableManager get embryoTransfersRefs {
    final manager = $$EmbryoTransfersTableTableManager(
      $_db,
      $_db.embryoTransfers,
    ).filter((f) => f.cycleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _embryoTransfersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IvfCyclesTableFilterComposer
    extends Composer<_$AppDatabase, $IvfCyclesTable> {
  $$IvfCyclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get husbandName => $composableBuilder(
    column: $table.husbandName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get wifeName => $composableBuilder(
    column: $table.wifeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get husbandAge => $composableBuilder(
    column: $table.husbandAge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wifeAge => $composableBuilder(
    column: $table.wifeAge,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amh => $composableBuilder(
    column: $table.amh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bmi => $composableBuilder(
    column: $table.bmi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get infertilityType => $composableBuilder(
    column: $table.infertilityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stimProtocol => $composableBuilder(
    column: $table.stimProtocol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get semenVolume => $composableBuilder(
    column: $table.semenVolume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get spermConc => $composableBuilder(
    column: $table.spermConc,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get motilityFp => $composableBuilder(
    column: $table.motilityFp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get motilitySp => $composableBuilder(
    column: $table.motilitySp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get motilityIm => $composableBuilder(
    column: $table.motilityIm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get oocytePickupDate => $composableBuilder(
    column: $table.oocytePickupDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get oocytePickupTime => $composableBuilder(
    column: $table.oocytePickupTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icsiTime => $composableBuilder(
    column: $table.icsiTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get occRecovered => $composableBuilder(
    column: $table.occRecovered,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get oocyteMii => $composableBuilder(
    column: $table.oocyteMii,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get oocyteMi => $composableBuilder(
    column: $table.oocyteMi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get oocyteGv => $composableBuilder(
    column: $table.oocyteGv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> dayObservationsRefs(
    Expression<bool> Function($$DayObservationsTableFilterComposer f) f,
  ) {
    final $$DayObservationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayObservations,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayObservationsTableFilterComposer(
            $db: $db,
            $table: $db.dayObservations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> blastocystGradesRefs(
    Expression<bool> Function($$BlastocystGradesTableFilterComposer f) f,
  ) {
    final $$BlastocystGradesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.blastocystGrades,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BlastocystGradesTableFilterComposer(
            $db: $db,
            $table: $db.blastocystGrades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> embryoTransfersRefs(
    Expression<bool> Function($$EmbryoTransfersTableFilterComposer f) f,
  ) {
    final $$EmbryoTransfersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.embryoTransfers,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmbryoTransfersTableFilterComposer(
            $db: $db,
            $table: $db.embryoTransfers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IvfCyclesTableOrderingComposer
    extends Composer<_$AppDatabase, $IvfCyclesTable> {
  $$IvfCyclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get husbandName => $composableBuilder(
    column: $table.husbandName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wifeName => $composableBuilder(
    column: $table.wifeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get husbandAge => $composableBuilder(
    column: $table.husbandAge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wifeAge => $composableBuilder(
    column: $table.wifeAge,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amh => $composableBuilder(
    column: $table.amh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bmi => $composableBuilder(
    column: $table.bmi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get infertilityType => $composableBuilder(
    column: $table.infertilityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stimProtocol => $composableBuilder(
    column: $table.stimProtocol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get semenVolume => $composableBuilder(
    column: $table.semenVolume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get spermConc => $composableBuilder(
    column: $table.spermConc,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get motilityFp => $composableBuilder(
    column: $table.motilityFp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get motilitySp => $composableBuilder(
    column: $table.motilitySp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get motilityIm => $composableBuilder(
    column: $table.motilityIm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get oocytePickupDate => $composableBuilder(
    column: $table.oocytePickupDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oocytePickupTime => $composableBuilder(
    column: $table.oocytePickupTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icsiTime => $composableBuilder(
    column: $table.icsiTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get occRecovered => $composableBuilder(
    column: $table.occRecovered,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get oocyteMii => $composableBuilder(
    column: $table.oocyteMii,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get oocyteMi => $composableBuilder(
    column: $table.oocyteMi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get oocyteGv => $composableBuilder(
    column: $table.oocyteGv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IvfCyclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IvfCyclesTable> {
  $$IvfCyclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get husbandName => $composableBuilder(
    column: $table.husbandName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get wifeName =>
      $composableBuilder(column: $table.wifeName, builder: (column) => column);

  GeneratedColumn<int> get husbandAge => $composableBuilder(
    column: $table.husbandAge,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wifeAge =>
      $composableBuilder(column: $table.wifeAge, builder: (column) => column);

  GeneratedColumn<double> get amh =>
      $composableBuilder(column: $table.amh, builder: (column) => column);

  GeneratedColumn<double> get bmi =>
      $composableBuilder(column: $table.bmi, builder: (column) => column);

  GeneratedColumn<String> get infertilityType => $composableBuilder(
    column: $table.infertilityType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stimProtocol => $composableBuilder(
    column: $table.stimProtocol,
    builder: (column) => column,
  );

  GeneratedColumn<double> get semenVolume => $composableBuilder(
    column: $table.semenVolume,
    builder: (column) => column,
  );

  GeneratedColumn<double> get spermConc =>
      $composableBuilder(column: $table.spermConc, builder: (column) => column);

  GeneratedColumn<double> get motilityFp => $composableBuilder(
    column: $table.motilityFp,
    builder: (column) => column,
  );

  GeneratedColumn<double> get motilitySp => $composableBuilder(
    column: $table.motilitySp,
    builder: (column) => column,
  );

  GeneratedColumn<double> get motilityIm => $composableBuilder(
    column: $table.motilityIm,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get oocytePickupDate => $composableBuilder(
    column: $table.oocytePickupDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get oocytePickupTime => $composableBuilder(
    column: $table.oocytePickupTime,
    builder: (column) => column,
  );

  GeneratedColumn<String> get icsiTime =>
      $composableBuilder(column: $table.icsiTime, builder: (column) => column);

  GeneratedColumn<int> get occRecovered => $composableBuilder(
    column: $table.occRecovered,
    builder: (column) => column,
  );

  GeneratedColumn<int> get oocyteMii =>
      $composableBuilder(column: $table.oocyteMii, builder: (column) => column);

  GeneratedColumn<int> get oocyteMi =>
      $composableBuilder(column: $table.oocyteMi, builder: (column) => column);

  GeneratedColumn<int> get oocyteGv =>
      $composableBuilder(column: $table.oocyteGv, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> dayObservationsRefs<T extends Object>(
    Expression<T> Function($$DayObservationsTableAnnotationComposer a) f,
  ) {
    final $$DayObservationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.dayObservations,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DayObservationsTableAnnotationComposer(
            $db: $db,
            $table: $db.dayObservations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> blastocystGradesRefs<T extends Object>(
    Expression<T> Function($$BlastocystGradesTableAnnotationComposer a) f,
  ) {
    final $$BlastocystGradesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.blastocystGrades,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BlastocystGradesTableAnnotationComposer(
            $db: $db,
            $table: $db.blastocystGrades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> embryoTransfersRefs<T extends Object>(
    Expression<T> Function($$EmbryoTransfersTableAnnotationComposer a) f,
  ) {
    final $$EmbryoTransfersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.embryoTransfers,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmbryoTransfersTableAnnotationComposer(
            $db: $db,
            $table: $db.embryoTransfers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IvfCyclesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IvfCyclesTable,
          IvfCycle,
          $$IvfCyclesTableFilterComposer,
          $$IvfCyclesTableOrderingComposer,
          $$IvfCyclesTableAnnotationComposer,
          $$IvfCyclesTableCreateCompanionBuilder,
          $$IvfCyclesTableUpdateCompanionBuilder,
          (IvfCycle, $$IvfCyclesTableReferences),
          IvfCycle,
          PrefetchHooks Function({
            bool dayObservationsRefs,
            bool blastocystGradesRefs,
            bool embryoTransfersRefs,
          })
        > {
  $$IvfCyclesTableTableManager(_$AppDatabase db, $IvfCyclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IvfCyclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IvfCyclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IvfCyclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> husbandName = const Value.absent(),
                Value<String> wifeName = const Value.absent(),
                Value<int> husbandAge = const Value.absent(),
                Value<int> wifeAge = const Value.absent(),
                Value<double?> amh = const Value.absent(),
                Value<double?> bmi = const Value.absent(),
                Value<String?> infertilityType = const Value.absent(),
                Value<String?> stimProtocol = const Value.absent(),
                Value<double?> semenVolume = const Value.absent(),
                Value<double?> spermConc = const Value.absent(),
                Value<double?> motilityFp = const Value.absent(),
                Value<double?> motilitySp = const Value.absent(),
                Value<double?> motilityIm = const Value.absent(),
                Value<DateTime?> oocytePickupDate = const Value.absent(),
                Value<String?> oocytePickupTime = const Value.absent(),
                Value<String?> icsiTime = const Value.absent(),
                Value<int?> occRecovered = const Value.absent(),
                Value<int?> oocyteMii = const Value.absent(),
                Value<int?> oocyteMi = const Value.absent(),
                Value<int?> oocyteGv = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => IvfCyclesCompanion(
                id: id,
                husbandName: husbandName,
                wifeName: wifeName,
                husbandAge: husbandAge,
                wifeAge: wifeAge,
                amh: amh,
                bmi: bmi,
                infertilityType: infertilityType,
                stimProtocol: stimProtocol,
                semenVolume: semenVolume,
                spermConc: spermConc,
                motilityFp: motilityFp,
                motilitySp: motilitySp,
                motilityIm: motilityIm,
                oocytePickupDate: oocytePickupDate,
                oocytePickupTime: oocytePickupTime,
                icsiTime: icsiTime,
                occRecovered: occRecovered,
                oocyteMii: oocyteMii,
                oocyteMi: oocyteMi,
                oocyteGv: oocyteGv,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String husbandName,
                required String wifeName,
                required int husbandAge,
                required int wifeAge,
                Value<double?> amh = const Value.absent(),
                Value<double?> bmi = const Value.absent(),
                Value<String?> infertilityType = const Value.absent(),
                Value<String?> stimProtocol = const Value.absent(),
                Value<double?> semenVolume = const Value.absent(),
                Value<double?> spermConc = const Value.absent(),
                Value<double?> motilityFp = const Value.absent(),
                Value<double?> motilitySp = const Value.absent(),
                Value<double?> motilityIm = const Value.absent(),
                Value<DateTime?> oocytePickupDate = const Value.absent(),
                Value<String?> oocytePickupTime = const Value.absent(),
                Value<String?> icsiTime = const Value.absent(),
                Value<int?> occRecovered = const Value.absent(),
                Value<int?> oocyteMii = const Value.absent(),
                Value<int?> oocyteMi = const Value.absent(),
                Value<int?> oocyteGv = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => IvfCyclesCompanion.insert(
                id: id,
                husbandName: husbandName,
                wifeName: wifeName,
                husbandAge: husbandAge,
                wifeAge: wifeAge,
                amh: amh,
                bmi: bmi,
                infertilityType: infertilityType,
                stimProtocol: stimProtocol,
                semenVolume: semenVolume,
                spermConc: spermConc,
                motilityFp: motilityFp,
                motilitySp: motilitySp,
                motilityIm: motilityIm,
                oocytePickupDate: oocytePickupDate,
                oocytePickupTime: oocytePickupTime,
                icsiTime: icsiTime,
                occRecovered: occRecovered,
                oocyteMii: oocyteMii,
                oocyteMi: oocyteMi,
                oocyteGv: oocyteGv,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IvfCyclesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                dayObservationsRefs = false,
                blastocystGradesRefs = false,
                embryoTransfersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (dayObservationsRefs) db.dayObservations,
                    if (blastocystGradesRefs) db.blastocystGrades,
                    if (embryoTransfersRefs) db.embryoTransfers,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (dayObservationsRefs)
                        await $_getPrefetchedData<
                          IvfCycle,
                          $IvfCyclesTable,
                          DayObservation
                        >(
                          currentTable: table,
                          referencedTable: $$IvfCyclesTableReferences
                              ._dayObservationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IvfCyclesTableReferences(
                                db,
                                table,
                                p0,
                              ).dayObservationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cycleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (blastocystGradesRefs)
                        await $_getPrefetchedData<
                          IvfCycle,
                          $IvfCyclesTable,
                          BlastocystGrade
                        >(
                          currentTable: table,
                          referencedTable: $$IvfCyclesTableReferences
                              ._blastocystGradesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IvfCyclesTableReferences(
                                db,
                                table,
                                p0,
                              ).blastocystGradesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cycleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (embryoTransfersRefs)
                        await $_getPrefetchedData<
                          IvfCycle,
                          $IvfCyclesTable,
                          EmbryoTransfer
                        >(
                          currentTable: table,
                          referencedTable: $$IvfCyclesTableReferences
                              ._embryoTransfersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IvfCyclesTableReferences(
                                db,
                                table,
                                p0,
                              ).embryoTransfersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cycleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IvfCyclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IvfCyclesTable,
      IvfCycle,
      $$IvfCyclesTableFilterComposer,
      $$IvfCyclesTableOrderingComposer,
      $$IvfCyclesTableAnnotationComposer,
      $$IvfCyclesTableCreateCompanionBuilder,
      $$IvfCyclesTableUpdateCompanionBuilder,
      (IvfCycle, $$IvfCyclesTableReferences),
      IvfCycle,
      PrefetchHooks Function({
        bool dayObservationsRefs,
        bool blastocystGradesRefs,
        bool embryoTransfersRefs,
      })
    >;
typedef $$DayObservationsTableCreateCompanionBuilder =
    DayObservationsCompanion Function({
      Value<int> id,
      required int cycleId,
      required int dayNumber,
      Value<int?> twoPN2PB,
      Value<int?> twoPBOnly,
      Value<int?> necrotic,
      Value<int?> twoPNArrest,
      Value<int?> fourCellG1,
      Value<int?> fourCellG2,
      Value<int?> twoCells,
      Value<int?> threeCells,
      Value<int?> fiveCells,
      Value<int?> eightCellG1,
      Value<int?> eightCellG2,
      Value<int?> fourCellArrest,
      Value<DateTime> recordedAt,
    });
typedef $$DayObservationsTableUpdateCompanionBuilder =
    DayObservationsCompanion Function({
      Value<int> id,
      Value<int> cycleId,
      Value<int> dayNumber,
      Value<int?> twoPN2PB,
      Value<int?> twoPBOnly,
      Value<int?> necrotic,
      Value<int?> twoPNArrest,
      Value<int?> fourCellG1,
      Value<int?> fourCellG2,
      Value<int?> twoCells,
      Value<int?> threeCells,
      Value<int?> fiveCells,
      Value<int?> eightCellG1,
      Value<int?> eightCellG2,
      Value<int?> fourCellArrest,
      Value<DateTime> recordedAt,
    });

final class $$DayObservationsTableReferences
    extends
        BaseReferences<_$AppDatabase, $DayObservationsTable, DayObservation> {
  $$DayObservationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IvfCyclesTable _cycleIdTable(_$AppDatabase db) =>
      db.ivfCycles.createAlias(
        $_aliasNameGenerator(db.dayObservations.cycleId, db.ivfCycles.id),
      );

  $$IvfCyclesTableProcessedTableManager get cycleId {
    final $_column = $_itemColumn<int>('cycle_id')!;

    final manager = $$IvfCyclesTableTableManager(
      $_db,
      $_db.ivfCycles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cycleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DayObservationsTableFilterComposer
    extends Composer<_$AppDatabase, $DayObservationsTable> {
  $$DayObservationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dayNumber => $composableBuilder(
    column: $table.dayNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get twoPN2PB => $composableBuilder(
    column: $table.twoPN2PB,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get twoPBOnly => $composableBuilder(
    column: $table.twoPBOnly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get necrotic => $composableBuilder(
    column: $table.necrotic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get twoPNArrest => $composableBuilder(
    column: $table.twoPNArrest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fourCellG1 => $composableBuilder(
    column: $table.fourCellG1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fourCellG2 => $composableBuilder(
    column: $table.fourCellG2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get twoCells => $composableBuilder(
    column: $table.twoCells,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get threeCells => $composableBuilder(
    column: $table.threeCells,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fiveCells => $composableBuilder(
    column: $table.fiveCells,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get eightCellG1 => $composableBuilder(
    column: $table.eightCellG1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get eightCellG2 => $composableBuilder(
    column: $table.eightCellG2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fourCellArrest => $composableBuilder(
    column: $table.fourCellArrest,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$IvfCyclesTableFilterComposer get cycleId {
    final $$IvfCyclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableFilterComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayObservationsTableOrderingComposer
    extends Composer<_$AppDatabase, $DayObservationsTable> {
  $$DayObservationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dayNumber => $composableBuilder(
    column: $table.dayNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get twoPN2PB => $composableBuilder(
    column: $table.twoPN2PB,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get twoPBOnly => $composableBuilder(
    column: $table.twoPBOnly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get necrotic => $composableBuilder(
    column: $table.necrotic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get twoPNArrest => $composableBuilder(
    column: $table.twoPNArrest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fourCellG1 => $composableBuilder(
    column: $table.fourCellG1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fourCellG2 => $composableBuilder(
    column: $table.fourCellG2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get twoCells => $composableBuilder(
    column: $table.twoCells,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get threeCells => $composableBuilder(
    column: $table.threeCells,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fiveCells => $composableBuilder(
    column: $table.fiveCells,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get eightCellG1 => $composableBuilder(
    column: $table.eightCellG1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get eightCellG2 => $composableBuilder(
    column: $table.eightCellG2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fourCellArrest => $composableBuilder(
    column: $table.fourCellArrest,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$IvfCyclesTableOrderingComposer get cycleId {
    final $$IvfCyclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableOrderingComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayObservationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DayObservationsTable> {
  $$DayObservationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get dayNumber =>
      $composableBuilder(column: $table.dayNumber, builder: (column) => column);

  GeneratedColumn<int> get twoPN2PB =>
      $composableBuilder(column: $table.twoPN2PB, builder: (column) => column);

  GeneratedColumn<int> get twoPBOnly =>
      $composableBuilder(column: $table.twoPBOnly, builder: (column) => column);

  GeneratedColumn<int> get necrotic =>
      $composableBuilder(column: $table.necrotic, builder: (column) => column);

  GeneratedColumn<int> get twoPNArrest => $composableBuilder(
    column: $table.twoPNArrest,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fourCellG1 => $composableBuilder(
    column: $table.fourCellG1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fourCellG2 => $composableBuilder(
    column: $table.fourCellG2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get twoCells =>
      $composableBuilder(column: $table.twoCells, builder: (column) => column);

  GeneratedColumn<int> get threeCells => $composableBuilder(
    column: $table.threeCells,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fiveCells =>
      $composableBuilder(column: $table.fiveCells, builder: (column) => column);

  GeneratedColumn<int> get eightCellG1 => $composableBuilder(
    column: $table.eightCellG1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get eightCellG2 => $composableBuilder(
    column: $table.eightCellG2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fourCellArrest => $composableBuilder(
    column: $table.fourCellArrest,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  $$IvfCyclesTableAnnotationComposer get cycleId {
    final $$IvfCyclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableAnnotationComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DayObservationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DayObservationsTable,
          DayObservation,
          $$DayObservationsTableFilterComposer,
          $$DayObservationsTableOrderingComposer,
          $$DayObservationsTableAnnotationComposer,
          $$DayObservationsTableCreateCompanionBuilder,
          $$DayObservationsTableUpdateCompanionBuilder,
          (DayObservation, $$DayObservationsTableReferences),
          DayObservation,
          PrefetchHooks Function({bool cycleId})
        > {
  $$DayObservationsTableTableManager(
    _$AppDatabase db,
    $DayObservationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DayObservationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DayObservationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DayObservationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cycleId = const Value.absent(),
                Value<int> dayNumber = const Value.absent(),
                Value<int?> twoPN2PB = const Value.absent(),
                Value<int?> twoPBOnly = const Value.absent(),
                Value<int?> necrotic = const Value.absent(),
                Value<int?> twoPNArrest = const Value.absent(),
                Value<int?> fourCellG1 = const Value.absent(),
                Value<int?> fourCellG2 = const Value.absent(),
                Value<int?> twoCells = const Value.absent(),
                Value<int?> threeCells = const Value.absent(),
                Value<int?> fiveCells = const Value.absent(),
                Value<int?> eightCellG1 = const Value.absent(),
                Value<int?> eightCellG2 = const Value.absent(),
                Value<int?> fourCellArrest = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => DayObservationsCompanion(
                id: id,
                cycleId: cycleId,
                dayNumber: dayNumber,
                twoPN2PB: twoPN2PB,
                twoPBOnly: twoPBOnly,
                necrotic: necrotic,
                twoPNArrest: twoPNArrest,
                fourCellG1: fourCellG1,
                fourCellG2: fourCellG2,
                twoCells: twoCells,
                threeCells: threeCells,
                fiveCells: fiveCells,
                eightCellG1: eightCellG1,
                eightCellG2: eightCellG2,
                fourCellArrest: fourCellArrest,
                recordedAt: recordedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cycleId,
                required int dayNumber,
                Value<int?> twoPN2PB = const Value.absent(),
                Value<int?> twoPBOnly = const Value.absent(),
                Value<int?> necrotic = const Value.absent(),
                Value<int?> twoPNArrest = const Value.absent(),
                Value<int?> fourCellG1 = const Value.absent(),
                Value<int?> fourCellG2 = const Value.absent(),
                Value<int?> twoCells = const Value.absent(),
                Value<int?> threeCells = const Value.absent(),
                Value<int?> fiveCells = const Value.absent(),
                Value<int?> eightCellG1 = const Value.absent(),
                Value<int?> eightCellG2 = const Value.absent(),
                Value<int?> fourCellArrest = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => DayObservationsCompanion.insert(
                id: id,
                cycleId: cycleId,
                dayNumber: dayNumber,
                twoPN2PB: twoPN2PB,
                twoPBOnly: twoPBOnly,
                necrotic: necrotic,
                twoPNArrest: twoPNArrest,
                fourCellG1: fourCellG1,
                fourCellG2: fourCellG2,
                twoCells: twoCells,
                threeCells: threeCells,
                fiveCells: fiveCells,
                eightCellG1: eightCellG1,
                eightCellG2: eightCellG2,
                fourCellArrest: fourCellArrest,
                recordedAt: recordedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DayObservationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cycleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cycleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cycleId,
                                referencedTable:
                                    $$DayObservationsTableReferences
                                        ._cycleIdTable(db),
                                referencedColumn:
                                    $$DayObservationsTableReferences
                                        ._cycleIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DayObservationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DayObservationsTable,
      DayObservation,
      $$DayObservationsTableFilterComposer,
      $$DayObservationsTableOrderingComposer,
      $$DayObservationsTableAnnotationComposer,
      $$DayObservationsTableCreateCompanionBuilder,
      $$DayObservationsTableUpdateCompanionBuilder,
      (DayObservation, $$DayObservationsTableReferences),
      DayObservation,
      PrefetchHooks Function({bool cycleId})
    >;
typedef $$BlastocystGradesTableCreateCompanionBuilder =
    BlastocystGradesCompanion Function({
      Value<int> id,
      required int cycleId,
      required String grade,
      Value<int> count,
    });
typedef $$BlastocystGradesTableUpdateCompanionBuilder =
    BlastocystGradesCompanion Function({
      Value<int> id,
      Value<int> cycleId,
      Value<String> grade,
      Value<int> count,
    });

final class $$BlastocystGradesTableReferences
    extends
        BaseReferences<_$AppDatabase, $BlastocystGradesTable, BlastocystGrade> {
  $$BlastocystGradesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IvfCyclesTable _cycleIdTable(_$AppDatabase db) =>
      db.ivfCycles.createAlias(
        $_aliasNameGenerator(db.blastocystGrades.cycleId, db.ivfCycles.id),
      );

  $$IvfCyclesTableProcessedTableManager get cycleId {
    final $_column = $_itemColumn<int>('cycle_id')!;

    final manager = $$IvfCyclesTableTableManager(
      $_db,
      $_db.ivfCycles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cycleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BlastocystGradesTableFilterComposer
    extends Composer<_$AppDatabase, $BlastocystGradesTable> {
  $$BlastocystGradesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get grade => $composableBuilder(
    column: $table.grade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  $$IvfCyclesTableFilterComposer get cycleId {
    final $$IvfCyclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableFilterComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BlastocystGradesTableOrderingComposer
    extends Composer<_$AppDatabase, $BlastocystGradesTable> {
  $$BlastocystGradesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get grade => $composableBuilder(
    column: $table.grade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  $$IvfCyclesTableOrderingComposer get cycleId {
    final $$IvfCyclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableOrderingComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BlastocystGradesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BlastocystGradesTable> {
  $$BlastocystGradesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get grade =>
      $composableBuilder(column: $table.grade, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  $$IvfCyclesTableAnnotationComposer get cycleId {
    final $$IvfCyclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableAnnotationComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BlastocystGradesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BlastocystGradesTable,
          BlastocystGrade,
          $$BlastocystGradesTableFilterComposer,
          $$BlastocystGradesTableOrderingComposer,
          $$BlastocystGradesTableAnnotationComposer,
          $$BlastocystGradesTableCreateCompanionBuilder,
          $$BlastocystGradesTableUpdateCompanionBuilder,
          (BlastocystGrade, $$BlastocystGradesTableReferences),
          BlastocystGrade,
          PrefetchHooks Function({bool cycleId})
        > {
  $$BlastocystGradesTableTableManager(
    _$AppDatabase db,
    $BlastocystGradesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BlastocystGradesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BlastocystGradesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BlastocystGradesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cycleId = const Value.absent(),
                Value<String> grade = const Value.absent(),
                Value<int> count = const Value.absent(),
              }) => BlastocystGradesCompanion(
                id: id,
                cycleId: cycleId,
                grade: grade,
                count: count,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cycleId,
                required String grade,
                Value<int> count = const Value.absent(),
              }) => BlastocystGradesCompanion.insert(
                id: id,
                cycleId: cycleId,
                grade: grade,
                count: count,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BlastocystGradesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cycleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cycleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cycleId,
                                referencedTable:
                                    $$BlastocystGradesTableReferences
                                        ._cycleIdTable(db),
                                referencedColumn:
                                    $$BlastocystGradesTableReferences
                                        ._cycleIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BlastocystGradesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BlastocystGradesTable,
      BlastocystGrade,
      $$BlastocystGradesTableFilterComposer,
      $$BlastocystGradesTableOrderingComposer,
      $$BlastocystGradesTableAnnotationComposer,
      $$BlastocystGradesTableCreateCompanionBuilder,
      $$BlastocystGradesTableUpdateCompanionBuilder,
      (BlastocystGrade, $$BlastocystGradesTableReferences),
      BlastocystGrade,
      PrefetchHooks Function({bool cycleId})
    >;
typedef $$EmbryoTransfersTableCreateCompanionBuilder =
    EmbryoTransfersCompanion Function({
      Value<int> id,
      required int cycleId,
      Value<int?> embryosTransferred,
      Value<DateTime?> transferDate,
      Value<int?> embryosFrozen,
      Value<String?> cryoDevice,
    });
typedef $$EmbryoTransfersTableUpdateCompanionBuilder =
    EmbryoTransfersCompanion Function({
      Value<int> id,
      Value<int> cycleId,
      Value<int?> embryosTransferred,
      Value<DateTime?> transferDate,
      Value<int?> embryosFrozen,
      Value<String?> cryoDevice,
    });

final class $$EmbryoTransfersTableReferences
    extends
        BaseReferences<_$AppDatabase, $EmbryoTransfersTable, EmbryoTransfer> {
  $$EmbryoTransfersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IvfCyclesTable _cycleIdTable(_$AppDatabase db) =>
      db.ivfCycles.createAlias(
        $_aliasNameGenerator(db.embryoTransfers.cycleId, db.ivfCycles.id),
      );

  $$IvfCyclesTableProcessedTableManager get cycleId {
    final $_column = $_itemColumn<int>('cycle_id')!;

    final manager = $$IvfCyclesTableTableManager(
      $_db,
      $_db.ivfCycles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cycleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EmbryoTransfersTableFilterComposer
    extends Composer<_$AppDatabase, $EmbryoTransfersTable> {
  $$EmbryoTransfersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get embryosTransferred => $composableBuilder(
    column: $table.embryosTransferred,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get transferDate => $composableBuilder(
    column: $table.transferDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get embryosFrozen => $composableBuilder(
    column: $table.embryosFrozen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cryoDevice => $composableBuilder(
    column: $table.cryoDevice,
    builder: (column) => ColumnFilters(column),
  );

  $$IvfCyclesTableFilterComposer get cycleId {
    final $$IvfCyclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableFilterComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmbryoTransfersTableOrderingComposer
    extends Composer<_$AppDatabase, $EmbryoTransfersTable> {
  $$EmbryoTransfersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get embryosTransferred => $composableBuilder(
    column: $table.embryosTransferred,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get transferDate => $composableBuilder(
    column: $table.transferDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get embryosFrozen => $composableBuilder(
    column: $table.embryosFrozen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cryoDevice => $composableBuilder(
    column: $table.cryoDevice,
    builder: (column) => ColumnOrderings(column),
  );

  $$IvfCyclesTableOrderingComposer get cycleId {
    final $$IvfCyclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableOrderingComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmbryoTransfersTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmbryoTransfersTable> {
  $$EmbryoTransfersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get embryosTransferred => $composableBuilder(
    column: $table.embryosTransferred,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get transferDate => $composableBuilder(
    column: $table.transferDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get embryosFrozen => $composableBuilder(
    column: $table.embryosFrozen,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cryoDevice => $composableBuilder(
    column: $table.cryoDevice,
    builder: (column) => column,
  );

  $$IvfCyclesTableAnnotationComposer get cycleId {
    final $$IvfCyclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.ivfCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IvfCyclesTableAnnotationComposer(
            $db: $db,
            $table: $db.ivfCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmbryoTransfersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmbryoTransfersTable,
          EmbryoTransfer,
          $$EmbryoTransfersTableFilterComposer,
          $$EmbryoTransfersTableOrderingComposer,
          $$EmbryoTransfersTableAnnotationComposer,
          $$EmbryoTransfersTableCreateCompanionBuilder,
          $$EmbryoTransfersTableUpdateCompanionBuilder,
          (EmbryoTransfer, $$EmbryoTransfersTableReferences),
          EmbryoTransfer,
          PrefetchHooks Function({bool cycleId})
        > {
  $$EmbryoTransfersTableTableManager(
    _$AppDatabase db,
    $EmbryoTransfersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmbryoTransfersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmbryoTransfersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmbryoTransfersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cycleId = const Value.absent(),
                Value<int?> embryosTransferred = const Value.absent(),
                Value<DateTime?> transferDate = const Value.absent(),
                Value<int?> embryosFrozen = const Value.absent(),
                Value<String?> cryoDevice = const Value.absent(),
              }) => EmbryoTransfersCompanion(
                id: id,
                cycleId: cycleId,
                embryosTransferred: embryosTransferred,
                transferDate: transferDate,
                embryosFrozen: embryosFrozen,
                cryoDevice: cryoDevice,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cycleId,
                Value<int?> embryosTransferred = const Value.absent(),
                Value<DateTime?> transferDate = const Value.absent(),
                Value<int?> embryosFrozen = const Value.absent(),
                Value<String?> cryoDevice = const Value.absent(),
              }) => EmbryoTransfersCompanion.insert(
                id: id,
                cycleId: cycleId,
                embryosTransferred: embryosTransferred,
                transferDate: transferDate,
                embryosFrozen: embryosFrozen,
                cryoDevice: cryoDevice,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EmbryoTransfersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cycleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cycleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cycleId,
                                referencedTable:
                                    $$EmbryoTransfersTableReferences
                                        ._cycleIdTable(db),
                                referencedColumn:
                                    $$EmbryoTransfersTableReferences
                                        ._cycleIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EmbryoTransfersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmbryoTransfersTable,
      EmbryoTransfer,
      $$EmbryoTransfersTableFilterComposer,
      $$EmbryoTransfersTableOrderingComposer,
      $$EmbryoTransfersTableAnnotationComposer,
      $$EmbryoTransfersTableCreateCompanionBuilder,
      $$EmbryoTransfersTableUpdateCompanionBuilder,
      (EmbryoTransfer, $$EmbryoTransfersTableReferences),
      EmbryoTransfer,
      PrefetchHooks Function({bool cycleId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$IvfCyclesTableTableManager get ivfCycles =>
      $$IvfCyclesTableTableManager(_db, _db.ivfCycles);
  $$DayObservationsTableTableManager get dayObservations =>
      $$DayObservationsTableTableManager(_db, _db.dayObservations);
  $$BlastocystGradesTableTableManager get blastocystGrades =>
      $$BlastocystGradesTableTableManager(_db, _db.blastocystGrades);
  $$EmbryoTransfersTableTableManager get embryoTransfers =>
      $$EmbryoTransfersTableTableManager(_db, _db.embryoTransfers);
}
