class ContestModel {

  final String id;
  final int entryFee;
  final int totalPlayers;
  final int joinedPlayers;
  final String status; // waiting / live / ended
  final DateTime? startTime;
  final DateTime? endTime;

  ContestModel({
    required this.id,
    required this.entryFee,
    required this.totalPlayers,
    required this.joinedPlayers,
    required this.status,
    this.startTime,
    this.endTime,
  });

  factory ContestModel.fromJson(Map<String, dynamic> json) {
    return ContestModel(
      id: json["_id"] ?? "",
      entryFee: json["entry_fee"] ?? 0,
      totalPlayers: json["total_players"] ?? 20,
      joinedPlayers: json["joined_players"] ?? 0,
      status: json["status"] ?? "waiting",
      startTime: json["start_time"] != null
          ? DateTime.parse(json["start_time"])
          : null,
      endTime: json["end_time"] != null
          ? DateTime.parse(json["end_time"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "entry_fee": entryFee,
      "total_players": totalPlayers,
      "joined_players": joinedPlayers,
      "status": status,
      "start_time": startTime?.toIso8601String(),
      "end_time": endTime?.toIso8601String(),
    };
  }
}