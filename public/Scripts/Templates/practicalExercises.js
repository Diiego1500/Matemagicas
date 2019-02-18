var answerArray = [];
var Board2 = document.getElementsByClassName('b2');
var ListaPlano =  ["moon", "rabbit", "robot", "rocket", "star"];

for (var i = 0; i < Board2.length; i++) {
    Board2[i].addEventListener("click", function () {
        console.log(this.getAttribute("data-index"));
        var id = this.getAttribute("data-index");
        answerArray[answerArray.length] = id;
        var td = document.createElement("td");
        var content = '<img id="' + id + '" class="draggable drag-drop tablet animated zoomIn" src="/Matemagicas/public/Img/tempIcons/' + id + '.png" width="30px" height="30px"> ';
        td.class = "AnswerField";
        td.innerHTML = content;
        document.getElementById("table_Answers").append(td);
    });
}

setTimeout(function () {
    var RandomNum = Math.floor(Math.random() * 20);
    if (RandomNum >= 19) {
        var Ruta = Routing.generate('GetRandomTip');
        $.ajax({
            type: 'POST',
            url: Ruta,
            async: true,
            dataType: "json",
            success: function (data) {
                var tip = data['Tip'];
                swal({
                    position: 'top',
                    title: "Tip Matemágico",
                    animation: false,
                    customClass: 'animated tada',
                    html: "<div style='width: 60%; margin: 0 auto'><small style='text-align: justify'>" + tip + "</small></div>",
                    text: data['Tip'],
                    backdrop: false,
                    showCancelButton: false,
                    showConfirmButton: true
                })
            }
        });
    }
}, 3000);


$('#VerifyAnswerDiv').click(function () {
    var answer = '';
    for (var i = 0; i < answerArray.length; i++) {
        answer = answer + answerArray[i];
    }
    var ExerciseID = $(this).attr('data-id');
    var NextExercise = $(this).attr('data-next');
    var path = Routing.generate('VerifyAnswer');
    $.ajax({
        type: 'POST',
        url: path,
        data: ({answer: answer, ExerciseId: ExerciseID}),
        async: true,
        dataType: "json",
        beforeSend: function () {
            $('#loader').show();
            console.log(answerArray);
        },
        success: function (data) {
            if (data['answer'] == true) {
                var success = document.getElementById("success");
                success.play();
                window.location.href = NextExercise != 1000 ? Routing.generate('PracticeExercise', {'idExercise': NextExercise}) : Routing.generate('Success', {'idExercise': ExerciseID});
            } else {
                answerArray = [];
                $('#table_Answers').empty();
                var wrong = document.getElementById("wrong");
                wrong.play();
                swal("¡Ups!", 'Intentalo de nuevo.', "error");
            }
            $('#loader').hide();
        }
    })
})

$('#ShowBoard').click(function () {
    $.ajax({
        type: 'POST',
        url: Routing.generate('ChangeBoard'),
        dataType: "json",
        success: function (data) {
            window.location.reload();
        }
    })
})
interact('.draggable')
    .draggable({
        inertia: true,
        autoScroll: true,
        onmove: dragMoveListener,
        onend: function (event) {
            var id = event.target.id;
            if (id == 'slash') {
                var content = '<img id="' + id + '" class="draggable drag-drop tablet animated zoomIn" style="position: absolute;  margin: auto;" src="/Matemagicas/public/Img/tempIcons/' + id + '.png" width="90px" height="30px"> ';

            } else {
                if (id == 'line') {
                    var content = '<img id="' + id + '" class="draggable drag-drop tablet animated zoomIn" src="/Matemagicas/public/Img/tempIcons/' + id + '.png" width="30px" height="30px"> ';
                }
                else {
                    if(ListaPlano.includes(id)){
                        var content = '<img id="' + id + '" class="draggable drag-drop tablet animated zoomIn" style="position: absolute;  margin: auto;" src="/Matemagicas/public/Img/tempIcons/' + id + '.png" width="95px" height="95px">';
                    }else{
                        var content = '<img id="' + id + '" class="draggable drag-drop tablet animated zoomIn" style="position: absolute;  margin: auto;" src="/Matemagicas/public/Img/tempIcons/' + id + '.png" width="30px" height="30px"> ';
                    }

                    console.log(content);
                }
            }
            var td = $('#td' + id);
            td.prepend(content);
        }
    });

function dragMoveListener(event) {
    var target = event.target,
        x = (parseFloat(target.getAttribute('data-x')) || 0) + event.dx,
        y = (parseFloat(target.getAttribute('data-y')) || 0) + event.dy;
    target.style.webkitTransform =
        target.style.transform =
            'translate(' + x + 'px, ' + y + 'px)';
    target.setAttribute('data-x', x);
    target.setAttribute('data-y', y);
}

interact('.AnswerDropZone').dropzone({
    accept: '.tablet',
    overlap: 0.75,
    ondrop: function (event) {
        var id = event.relatedTarget.id;
        event.relatedTarget.hidden = true;
        answerArray[answerArray.length] = id;
        var td = document.createElement("td");
        var content = '<img id="' + id + '" class="draggable drag-drop tablet animated zoomIn" src="/Matemagicas/public/Img/tempIcons/' + id + '.png" width="30px" height="30px"> ';
        td.class = "AnswerField";
        td.innerHTML = content;
        document.getElementById("table_Answers").append(td);
    }
});

