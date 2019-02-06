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
