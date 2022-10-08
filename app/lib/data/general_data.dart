
// I think this should be turned into ChangeNotifier

class GeneralData{
  static final GeneralData _instance = GeneralData._internal();
  factory GeneralData(){
    return _instance;
  }
  GeneralData._internal();

  int necessaryInfoLength = 4;

  // Data Format: [Bool 発見済みフラッグ, String 分類,
  //               String 分布, String 雑学]
  Map<String, List> animalDetail = {

    'ガラパゴスゾウガメ':[true, 'カメ目リクガメ科ナンベイリクガメ属', 'Test', 'Test'],
    'ジャイアントパンダ': [false, '食肉目クマ科ジャイアントパンダ属', 'Test', 'test'],
    'シロクマ':[true, '食肉目クマ科クマ属', 'AAAAA', 'AAAAAAAA'],
    'ゾウ':[false,'ゾウ目ゾウ上科ゾウ科', 'a'],
    'トラ':[false, '食肉目ネコ科ヒョウ属'],
    'ゴリラ':[true, 'ゴリラ属ゴリラ目', '草加在住。　aaaaaaaaaaaaaaa。 testestestestestestest',
      'ドラミングはコミュニケーションツール。動物園でドラミングされたら、怒っているかも！ testestestestestestestestestes'
    ],
    'ニホンザル':[true,'a',
      '''農作物を食べていない野生のサルは６～７歳で初産をむかえ，３～４年に１回１
        頭を出産する。赤ん坊の死亡率は高く，個体数の増加は低い。一方，餌付けや農作
        物採食などにより栄養条件が良い場合は，初産年齢の低下（５～６歳），１～２年に
        １度の出産，赤ん坊の死亡率の低下などから，個体数の増加率が高くなる。
        メスの成獣と子どもを中心とした数10頭～100頭程度の群れをつくる。オスは４，
        ５才くらいから生まれた群れを離れ，他の群れに入るか，ハナレザルやオスグルー
        プとして生活する。したがって，ハナレザル以外のメスと子どもは基本的に群れで
        行動する。群れの頭数が100頭前後になると，分裂する可能性が高くなる。また，
        被害軽減などを目的として捕獲を行った場合にも，群れの分裂が起きることがある。
        サルは，危険な時は高い所に逃げる習性を持つため，本来は森林から遠く離れる
        ことは少ない。しかし，人馴れが進んだ個体は林縁から100～200ｍほど離れた農地にも出没するようになる。''',
      'a'],
    'ハシビロコウ':[true],
    'フラミンゴ': [false,],
    'プレーリードッグ': [false],
    '昆涼悟':[false,  '人目',
      '草加在住。フェスで頻繁目撃されているaaaaaaaaaaaaaaa。 testestestestestestest',
      '夜更かししがち。 testestestestestestestestestes'],
    'test' : [true, 'a', 'a', 'a'],
    'test_not_enough_case': [false]
  };
}
