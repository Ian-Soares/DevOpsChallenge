const btn = document.getElementById('btn-joke')
const color = document.querySelector('.color');
const textQuestion = document.getElementById('textQuestion');
const textPunchline = document.getElementById('textPunchline');
let question = ""
let answer = ""

function showQuestion () {
    textQuestion.innerHTML = question;
};

function showAnswer() {
    textPunchline.innerHTML = answer;
};

function clearFields() {
    textPunchline.innerHTML = "";
    textQuestion.innerHTML = "";
};

function api_request() {
    fetch(`https://cluster.iansoares.tk/api/get_jokes`)
        .then((response) => response.json())
        .then((data) => {
            question = data.setup;
            answer = data.punchline;
    });
};

function buttonFunction(object) {
    classes = object.className.split(" ")
    if(classes[0] === "noQuestion") {
        api_request();
        showQuestion();
        object.className = "question btn";
    } else if(classes[0] === "question") {
        showAnswer();
        object.className = "answer btn";
    } else if(classes[0] === "answer") {
        clearFields();
        object.className = "noQuestion btn";
    };
    console.log(object.className)
};
