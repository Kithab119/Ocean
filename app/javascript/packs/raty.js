$(document).ready(function() {
  $('#star-rating').raty({
    score: 3, // デフォルトの評価を設定
    path: 'images/', // 星の画像が保存されているフォルダのパス
    half: true, // 半分の星も使用するかどうか
    click: function(score, evt) {
      alert('You rated this ' + score + ' stars!');
    }
  });
});
