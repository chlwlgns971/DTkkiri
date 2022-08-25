
const clockContainer = document.querySelector(".js-clock"),
dayTitle = clockContainer.querySelector("h3#date"),
clockTitle = clockContainer.querySelector("h1#time");

function getTime(){
    const date = new Date(); 
    const year = date.getFullYear();
    const month = date.getMonth() + 1;
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    dayTitle.innerText = `${year} - ${month < 10 ? `0${month}` : month} - ${day < 10 ? `0${day}` : day}`;
    clockTitle.innerText = `${hours < 10 ? `0${hours}` : hours}:${minutes < 10 ? `0${minutes}` : minutes}`;
}

function init(){
    getTime();
    // setInterval 사용하기! 계속 작동하는 것이 아니라 새로고침 할 때만 업데이트 되어 보이니까 setInterval로 매 초 업데이트 시기기
    setInterval(getTime, 1000);
}

init();

