function  markCheck (obj){
    var answerId =$(obj).attr('data-id');
    $.ajax({
        type:'POST',
        url: Routing.generate('CheckCorrect'),
        data: ({answerId:answerId}),
        dataType:"json",
        success:function (data) {
            location.reload();
        }
    })
}