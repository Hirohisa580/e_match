if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  const MessageImage = document.getElementById('message_image')

  MessageImage.addEventListener('change', function(e){
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();   // 画像が表示されている場合のみ、すでに存在している画像を削除する
    }

    const file = e.target.files[0]   //選択した画像ファイルをハッシュの形で取得 0は0番目と言うこと
    const blob = window.URL.createObjectURL(file);    //選択した画像ファイルのURL情報を生成
   
    const imageElement = document.createElement('div');   // 画像を表示するためのdiv要素を生成
    const blobImage = document.createElement('img');   // 表示する画像を生成
    blobImage.setAttribute('src', blob);   //表示する画像に属性と値を設定
    blobImage.setAttribute('class', "img")


    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);   // 生成したHTMLの要素をブラウザに表示させる
  });
});
}