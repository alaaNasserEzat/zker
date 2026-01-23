class SphaEntity {
  final int id;
  final String name;
   int currentcount;
   int cyclesCount;
   int totalCount;
   int  beadsCount;

  SphaEntity({
    required this.id,
    required this.name,
    required this.currentcount,
    required this.cyclesCount,
    required this.totalCount,
    required this.beadsCount
  });


//     SphaEntity copyWith({
//     int? currentcount,
//     int? totalCount,
//     int? cyclesCount,
//   }) {
//     return SphaEntity(
//       id: id,
//       name: name,
//       beadsCount: beadsCount,
//       currentcount: currentcount ?? this.currentcount,
//       totalCount: totalCount ?? this.totalCount,
//       cyclesCount: cyclesCount ?? this.cyclesCount,
//     );
//   }
 }