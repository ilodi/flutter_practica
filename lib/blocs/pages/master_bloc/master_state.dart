import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;
import 'package:practica/models/youtube_video.dart';

class MasterState extends Equatable {
  final int currenTab;
  final List<YouTubeVideo> history;

  MasterState({@required this.currenTab, @required this.history});

  static MasterState initialState() => MasterState(currenTab: 0, history: []);

//
  MasterState copyWith({int currenTab, List<YouTubeVideo> history}) {
    return MasterState(
        currenTab: currenTab  ?? this.currenTab,
        history: history  ?? this.history);
  }

  @override
  List<Object> get props => [currenTab, history];
}
