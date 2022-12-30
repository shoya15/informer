window.addEventListener("load", function () {
    const button = document.getElementById("js-button");
    const text = document.getElementById("js-text")
    if (!button || !text) { return false; }
    button.addEventListener("click", function () {
        // アラート
        if (!text.value) {
            alert("テキストを入力してください")
        }

        // 音声合成
        // ブラウザにWeb Speech API Speech Synthesis機能があるか判定
        if ('speechSynthesis' in window) {
            // 発言を設定
            const uttr = new SpeechSynthesisUtterance()
            // 読み上げるテキストを設定
            uttr.text = text.value
            // 読み上げる速さを設定
            uttr.rate = 0.93
            // 声の高さを設定
            uttr.pitch = 1.1
            // 発言を再生
            window.speechSynthesis.speak(uttr)
        } else {
            alert('大変申し訳ございません。このブラウザは音声合成に対応しておりません。')
        }
    })
})

// ダイアログを表示
window.addEventListener("load", function () {
    const submit = document.getElementById("js-submit");
    if (!submit) { return false; }
    submit.addEventListener("click", function () {
        const result = window.confirm("送信しますか？");
        if (result) {
            window.location.href = "/complete"
        }
    })
})