var btnBuscar = $('#searchArticles');
var TextBuscar = $('#Parametro');
var Divs = $('.section');
// Divs.text(Divs.text().substring(0, 200));
//
function Buscarentradas() {
    var param= TextBuscar.val();
    window.location.href = Routing.generate('searchBlog',{'param':param});
}

btnBuscar.click(Buscarentradas);