// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$(document).on('turbolinks:load', function() {
  // モーダルを表示するための関数
  function showModal(message) {
    // ここにモーダル表示のコードを追加
    alert(message); // 仮の実装、実際にはモーダル表示のライブラリを使用すると良い
  }

  // 保存ボタンがクリックされたときの処理
  $('.save-button').on('click', function() {
    // 保存処理を行った後にモーダルを表示
    // ここに保存処理のAjaxリクエストやフォーム送信のコードを追加

    showModal('保存が成功しました！');
  });

  // 削除ボタンがクリックされたときの処理
  $('.delete-button').on('click', function() {
    // 削除処理を行った後にモーダルを表示
    // ここに削除処理のAjaxリクエストやフォーム送信のコードを追加

    showModal('削除が成功しました！');
  });

  // 登録ボタンがクリックされたときの処理
  $('.register-button').on('click', function() {
    // 登録処理を行った後にモーダルを表示
    // ここに登録処理のAjaxリクエストやフォーム送信のコードを追加

    showModal('登録が成功しました！');
  });
});
