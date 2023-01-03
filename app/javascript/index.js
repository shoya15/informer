window.addEventListener("load", function () {
    const button = document.getElementById("js-button");
    let text = document.getElementById("js-text");
    let time = document.getElementById("js-time");
    const p1 = document.getElementById("js-p1")
    const p2 = document.getElementById("js-p2")
    const p3 = document.getElementById("js-p3")
    const p4 = document.getElementById("js-p4")
    const label1 = document.getElementById("js-label1")
    const label2 = document.getElementById("js-label2")
    const reset = document.getElementById("js-reset")

    if (!button) { return false; }

    button.addEventListener("click", function () {
        // 上ではなく、ここに書かないとデフォルトの値のままになってしまう
        button.style.display = "none"
        text.style.display = "none"
        time.style.display = "none"
        p1.style.display = "none"
        p2.style.display = "block"
        p3.style.display = "block"
        p4.style.display = "block"
        label1.style.display = "none"
        label2.style.display = "none"
        reset.style.display = "block"

        time = time.value
        text = text.value
        p3.innerHTML = "設定したテキスト：" + `${text}`
        p4.innerHTML = "設定した時間：" + `${time}`
        setInterval(function () {
            let now = new Date();
            let hour = now.getHours();
            if (hour < 10) {
                hour = `0${hour}`
            }
            let minute = now.getMinutes();
            if (minute < 10) {
                minute = `0${minute}`
            }
            let current_time = hour + ":" + minute

            // 音声合成
            // ブラウザにWeb Speech API Speech Synthesis機能があるか判定
            if ('speechSynthesis' in window) {
                // 発言を設定
                const uttr = new SpeechSynthesisUtterance()
                // 読み上げるテキストを設定
                uttr.text = text
                // 読み上げる速さを設定
                uttr.rate = 0.93
                // 声の高さを設定
                uttr.pitch = 1.1
                if (text.length <= 50) {
                    if (time == current_time) {
                        // 発言を再生
                        window.speechSynthesis.speak(uttr)
                        window.location.href = "/"
                    }
                }
            } else {
                alert('大変申し訳ございません。このブラウザは音声合成に対応しておりません。')
            }
        }, 1000)
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