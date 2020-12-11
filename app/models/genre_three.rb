class GenreThree < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: '俳優'},
    { id: 3, name: '女優'},
    { id: 4, name: '声優'} ,
    { id: 5, name: 'シンガー'},
    { id: 6, name: 'ミュージシャン'},
    { id: 7, name: 'ダンサー'},
    { id: 8, name: 'お笑い芸人'},
    { id: 9, name: 'Youtuber'},
    { id: 10, name: '配信者'},
    { id: 11, name: '演出家'},
    { id: 12, name: '脚本家'},
    { id: 13, name: '舞台監督'},
    { id: 14, name: '作曲家'},
    { id: 15, name: '振付師'},
    { id: 16, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :profiles

end