$('#Register').click(function () {
    var email = document.getElementById('user_data_email').value;
    var username = document.getElementById('user_data_username').value;
    var password = document.getElementById('user_data_password').value;
    var Ruta = Routing.generate('RegisterMyUser');
    $('#exampleModalCenter').modal('hide');
    swal({
        title: 'Confirma tu registro',
        text: '¿Deseas crear una cuenta con la información proporcionada?',
        type: 'question',
        showCancelButton: true,
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar',
        showLoaderOnConfirm: true,
        focusConfirm: true,
        allowOutsideClick: false,
        preConfirm: function () {
            return new Promise(function () {
                $.ajax({
                    type: 'POST',
                    url: Ruta,
                    data: ({email:email, username:username, password:password}),
                    async: true,
                    dataType : "json",
                    success: function (data) {
                        if(data['Validation']==true){
                            swal("Registrado exitosamente", data['Message'], "success");
                        }else{
                            swal("¡Ups!", data['Message'], "error");
                        }
                    }
                })
                ;
            })
        }
    });
})


$('#BtnForgot').click(function () {
     var email = $('#forgotuserEmail').val();
    $('#ForgotPassword').modal('hide');
    var Ruta = Routing.generate('EmailData');
    swal({
        title: 'Confirmación',
        text: 'Se enviará un mensaje con los datos de acceso al correio '+email,
        type: 'question',
        showCancelButton: true,
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar',
        showLoaderOnConfirm: true,
        focusConfirm: true,
        allowOutsideClick: false,
        preConfirm: function () {
            return new Promise(function () {
                $.ajax({
                    type: 'POST',
                    url: Ruta,
                    data: ({email:email}),
                    async: true,
                    dataType : "json",
                    success: function (data) {
                        if(data['Validation']==true){
                            swal("Correcto", "Se ha enviado un mensaje con los datos de acceso a matemagicas al correo <br> "+email+"<br><strong>Revisa la carpeta de Span o correo no deseado</strong>", "success");
                        }else{
                            swal("¡Ups!", "No se encontró un usuario con este correo", "error");
                        }
                    }
                })
                ;
            })
        }
    });
})
