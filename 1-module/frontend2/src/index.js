const btnCopa = document.getElementById('btn-copa');
let numeroFoto = 1

function trocarFundo() {
    document.body.style.backgroundImage = `url('./img/copa${numeroFoto}.jpg')`;
}

btnCopa.addEventListener('click', function () {
    trocarFundo();
    numeroFoto += 1
    if(numeroFoto == 6) {
        numeroFoto = 1
        respostaHexa = prompt('Você confia no hexa? (s/n): ')
        if(respostaHexa[0] == 's' || respostaHexa[0] == 'S') {
            alert('Aí sim, eu também!!!')
        } else {
            alert('Aí é triste, hein! Tem que confiar no brasa!')
        };
    };
});
