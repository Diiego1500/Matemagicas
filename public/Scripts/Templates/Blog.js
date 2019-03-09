var img = $('#Like');
var LikeListener = $('.AddLike');
var id = img.attr('data-id');
var UserId= img.attr('data-user');

function Like() {
    var url = Routing.generate('Like');
    $.ajax({
        url:url,
        type:'POST',
        data:({postId:id,userId:UserId}),
        dataType:'json',
        success:function (data) {
            $('.counter').text(data['success']);
            $('.MyLike path').css('fill','EFB60B');
            $('.MyLike2').attr('src','/MatemagicasSyL/public/Img/src/LikeContains.svg');
        }
    })
}
LikeListener.click(Like);

