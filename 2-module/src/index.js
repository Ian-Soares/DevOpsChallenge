const btnCopa = document.getElementById('btn-copa');
let numeroFoto = 1

function trocarFundo() {
    document.body.style.backgroundImage = `url('./img/copa${numeroFoto}.jpg')`;
}

function main() {
    trocarFundo();
    numeroFoto += 1
    if(numeroFoto == 6) {
        numeroFoto = 1
        respostaHexa = prompt('Você confia no hexa? (s/n): ')
        if(respostaHexa[0] == 's' || respostaHexa[0] == 'S') {
            alert('Sua recompensa está logo abaixo!!!')
            document.body.style.backgroundImage = `url('./img/sust-sun.png')`
        } else {
            alert('Tente novamente, só temos uma resposta certa aqui!')
        };
    };
};
