class DashboardStats {
  final String title;
  final String value;
  final String subtitle;
  final double percentage;
  final bool isIncrease;

  DashboardStats({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.percentage,
    required this.isIncrease,
  });
}

class DashboardData {
  final List<DashboardStats> stats;
  final String userName;
  final DateTime lastUpdate;

  DashboardData({
    required this.stats,
    required this.userName,
    required this.lastUpdate,
  });

  DashboardData copyWith({
    List<DashboardStats>? stats,
    String? userName,
    DateTime? lastUpdate,
  }) {
    return DashboardData(
      stats: stats ?? this.stats,
      userName: userName ?? this.userName,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}