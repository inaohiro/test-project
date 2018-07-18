// indexedDB は Service Woker を使って 非同期に データを保存できる
// そっちのほうがより良いはず
// とりあえずの実装のため、今回は localstorage を使ったもの

const baseURL = <IP Address>

// localstorage にアクセスして token があるかを確認する
if (localStorage.getItem('token')) {
  // use it
  console.log(localStorage.getItem('token'));
}
// なければ初回アクセスだとみなし、サーバから token を取得する
else {
  fetch(`${baseURL}/api/token`, {
      method: 'POST'
  })
    .then((data) => data.json())
    // localstorage とか ブラウザに保存させる
    .then((json) => localStorage.setItem('token', json.token))
    .catch((e) => { console.log(e); });
}
