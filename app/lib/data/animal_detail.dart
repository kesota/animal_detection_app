
class GeneralData{
  static final GeneralData _instance = GeneralData._internal();
  factory GeneralData(){
    return _instance;
  }
  GeneralData._internal();

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
    'ニホンザル':[true,'a'],
    'ハシビロコウ':[true],
    'フラミンゴ': [false,],
    'プレーリードッグ': [false],
    '昆涼悟':[false,  '人目',
      '草加在住。フェスで頻繁目撃されているaaaaaaaaaaaaaaa。 testestestestestestest',
      '夜更かししがち。 testestestestestestestestestes'],
  };
}