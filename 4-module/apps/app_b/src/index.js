const btn = document.getElementById('btn-dog');
let api_status = ""
let url = ""

function api_request() {
    fetch(`https://cluster.iansoares.tk/api/get_dog_images`)
        .then((response) => response.json())
        .then((data) => {
            api_status = data.status;
            url = data.message;
    });
};

function changeBackground() {
    console.log('a função foi chamada')
    api_request()
    console.log(api_status, url)
    if(api_status == "success") {
        document.body.style.backgroundImage = `url(${url})`;
    } else {
        return
    }  
};
