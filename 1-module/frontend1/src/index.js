const btnCorinthians = document.getElementById('btn-corinthians');
const btnNormal = document.getElementById('btn-normal');

function vaiCorinthians() {
    document.body.style.backgroundImage = "url('https://s2.glbimg.com/r7ZFu0FJCJuHKY8BaJWAUVrK2JE=/0x0:4096x2720/1000x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_bc8228b6673f488aa253bbcb03c80ec5/internal_photos/bs/2022/E/p/uPSW6HQOy91ePhAL6USQ/rib6308-2.jpg')";
}

btnCorinthians.addEventListener('click', function () {
    vaiCorinthians();
});

btnNormal.addEventListener('click', function () {
    document.body.style.backgroundImage = null
});