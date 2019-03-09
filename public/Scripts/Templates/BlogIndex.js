var btnBuscar = $('#searchArticles');
var TextBuscar = $('#Parametro');
// var Divs = $('.section');
// Divs.text(Divs.text().substring(0, 200));
//
function Buscarentradas() {
    var param = TextBuscar.val();
    if (param) {
        window.location.href = Routing.generate('searchBlog', {'param': param});
    }else {
        swal("¡Ups!", "No sé que quieres buscar, llena el campo de texto con el tema de tu interés.", "error");
    }
}

btnBuscar.click(Buscarentradas);