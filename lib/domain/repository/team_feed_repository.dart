import 'package:mercenaryhub/domain/entity/team_feed.dart';
import 'package:mercenaryhub/domain/entity/time_state.dart';

abstract interface class TeamFeedRepository {
  Future<List<TeamFeed>> fetchTeamFeeds({
    required String? lastId,
    required List<String> ignoreIds,
    required String? location,
  });
  Future<bool> insertTeamFeed({
    required String cost,
    required String person,
    required String imageUrl,
    required String teamName,
    required String location,
    required String level,
    required DateTime date,
    required TimeState time,
    required String content,
  });
  Stream<List<TeamFeed>> streamFetchTeamFeeds();
}
