import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/word.dart';

final wordsViewModelProvider = StateNotifierProvider<WordsViewModel, List<Word>>((ref) {
  return WordsViewModel();
});

class WordsViewModel extends StateNotifier<List<Word>> {
  WordsViewModel() : super([]);

  // ダミーデータの作成
  final List<Word> dummyData = [
    const Word(
      id: "1",
      number: "001",
      points: 0,
      english: "example",
      japanese1: "例",
      japanese2: "実例",
      exampleSentenceEnglish: "This is an example.",
      exampleSentenceJapanese: "これは例です。",
      conjugation1: "exampled",
      conjugation2: "exampled",
      prototypePronunciation: "ɪɡˈzæmpəl",
      conjugation1Pronunciation: "ɪɡˈzæmpəld",
      conjugation2Pronunciation: "ɪɡˈzæmpəld",
      withSetEnglish: "sample",
      withSetJapanese1: "見本",
      withSetJapanese2: "サンプル",
      pronunciationKana: "イグザンプル",
      pronunciationSymbol: "ɪɡˈzæmpəl",
      polysemy1: "実例",
      polysemy2: "見本",
      silent: false,
      partOfSpeechNumber: 1,
      primarySchool1: true,
      primarySchool2: false,
      primarySchool3: false,
      primarySchool4: false,
      primarySchool5: false,
      juniorHighSchool1: true,
      juniorHighSchool2: false,
      juniorHighSchool3: false,
      juniorHighSchool4: false,
      juniorHighSchool5: false,
      highSchool1: false,
      highSchool2: false,
      highSchool3: false,
      highSchool4: false,
      highSchool5: false,
      university1: false,
      university2: false,
      university3: false,
      university4: false,
      university5: false,
      toeic1: true,
      toeic2: false,
      toeic3: false,
      toeic4: false,
      toeic5: false,
      eiken1: false,
      eiken2: false,
      eiken3: true,
      eiken4: false,
      eiken5: false,
      eiken6: false,
      eiken7: false,
      toefl1: false,
      toefl2: false,
      toefl3: false,
      toefl4: false,
      toefl5: false,
      irregularVerb1: false,
      irregularVerb2: false,
      irregularVerb3: false,
      idioms1: false,
      idioms2: false,
      idioms3: false,
      withSet1: true,
      withSet2: false,
      withSet3: false,
      easyToMistake1: false,
      easyToMistake2: false,
      easyToMistake3: false,
      pronunciationAttention1: false,
      pronunciationAttention2: false,
      pronunciationAttention3: false,
      polysemy1Flag: true,
      polysemy2Flag: true,
      polysemy3Flag: false,
      concern1: false,
      concern2: false,
      concern3: false,
      animal: false,
      plant: false,
      bodyToFace: false,
      food: false,
      dailyLife: true,
      housesAndFacilities: false,
      other: false,
      remembered: false,
      catStampCount: 0,
      freePaidKubun: 0,
      juniorHighSchoolVerb: true,
      juniorHighSchoolAdjectives: false,
      juniorHighSchoolAdverb: false,
      highSchoolVerb: false,
      highSchoolAdjectives: false,
      highSchoolAdverb: false,
      highSchoolNoun: true,
    )
  ];
  void initWords() {
    state = dummyData;
  }
  void setWords(List<Word> words) {
    state = words;
  }

  void addWord(Word word) {
    state = [...state, word];
  }

  void updateWord(Word word) {
    final index = state.indexWhere((element) => element.id == word.id);
    if (index != -1) {
      state = [...state]..setAll(index, [word]);
    }
  }

  void deleteWord(Word word) {
    state = state.where((element) => element.id != word.id).toList();
  }
}