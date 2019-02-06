$("#but_upload").click(function(){

    var fd = new FormData();
    var files = $('#file')[0].files[0];
    fd.append('file',files);
    console.log(fd)

    $.ajax({
        url: Routing.generate('ChangeImage'),
        type: 'post',
        data: fd,
        contentType: false,
        processData: false,
        success: function(response){
            console.log(response['Img']);
            $(".changerImage").attr("src",response['Img']);
        },
    });
});