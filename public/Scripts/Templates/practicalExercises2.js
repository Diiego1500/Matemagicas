var See_Answers = $('#See_Answers');
var CLOCK = {MIN: document.getElementById('MIN'), SEC: document.getElementById('SEC')};
var TIMER = {MIN: 15, SEC: 59};

function showRemaining() {
    if (TIMER.SEC != 0) {
        TIMER.SEC--;
        CLOCK.SEC.innerText = ('0' + TIMER.SEC).slice(-2);
    }
    if (TIMER.SEC == 0) {
        if (TIMER.MIN == -1 && TIMER.SEC == 0) {
            See_Answers.disabled = false;
            See_Answers.innerText = "Ver Respuesta Ahora";
            clearInterval(Cron);
            answerAjax();
        } else {
            CLOCK.MIN.innerText = ('0' + TIMER.MIN--).slice(-2);
            TIMER.SEC = 59;
        }
    }
}

var Cron = setInterval(function () {
    showRemaining();
}, 1000);

function answerAjax() {
    var Id = See_Answers.data("id");
    $.ajax({
        type:'POST',
        url: Routing.generate('GetImageAnswer'),
        data: ({id:Id}),
        dataType:"json",
        success:function (data) {
            See_Answers.removeAttr("disabled");
            $('#AnswerImg').attr('src',data['Route']);
        }
    })
}
