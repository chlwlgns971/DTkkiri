const toDoForm = document.querySelector(".js-toDoForm"), // <form> js-toDoForm의 요소를 정의한다
toDoInput = toDoForm.querySelector("input"),			// 그 안의 input 요소를 정의한다
toDoList = document.querySelector(".js-toDoList");		// <ui> .js-toDoList 요소를 정의한다

console.log("todoInput >> " + toDoInput.value);

const TODOS_LS = "toDos";	
let toDos = [];



function deleteToDo(e, text){
	
	memId = $('.card-text').attr('id');
    const btn = e.target;
    const li = btn.parentNode;

	console.log("나오니? 클릭한 버튼의 번호 >> " + $(btn).val());
	/*
    toDoList.removeChild(li);
    const cleanToDos = toDos.filter(function(toDo){
        return toDo.id !== parseInt(li.id);
    });
    toDos = cleanToDos;
    saveToDos();
	*/
	
	$.ajax({
		url : '/DTkkiri/deleteReminder.do',
		data : {"remNum" : $(btn).val(), "id" : memId },
		type : 'post',
		success : function(res){
				//★ 확인용
				while (toDoList.firstChild) {
				    toDoList.lastChild.remove();
				}

				$.each(res, function(i,v){
				
				const li = document.createElement("li"); // li를 만들고
			    const delBtn = document.createElement("button"); // 삭제버튼을 생성해준다
			    delBtn.innerText = "❌";  // 삭제 버튼 안에 들어갈 내용
				delBtn.className = 'delButton';
			    delBtn.addEventListener("click", deleteToDo); // 클릭했을 때 deleteToDo 함수로 넘어간다
				delBtn.value = v.num;						// 삭제했을 때 댓글 번호를 파악하기 위한 val 값 제공
			    const span = document.createElement("span");	// span을 생성한다 (내용 담을 곳)
			    const newId = toDos.length + 1;				// toDo 값을 생성해준다
			    span.innerText = v.cont;					// span 안에 리마인더 내용을 넣어준다

			    // toDoList.appendChild(li); 
			    // 원페이지에 스크롤 보이지 않게 하기 위해 숫자 제한 : 8개
			    if(newId < 9){
				    li.appendChild(span);						
				    li.appendChild(delBtn);
				    li.id = newId;

			        toDoList.appendChild(li);
			    }else{
			        alert("최대 8개까지 작성할 수 있습니다!")
			    }
			    const toDoObj = {
			        text: text,
			        id: newId
			    };
			    // toDos.push(toDoObj);
			    // 원페이지에 스크롤 보이지 않게 하기 위해 숫자 제한 : 8개
			    if(newId < 9){
			        toDos.push(toDoObj);
			    }
			   // saveToDos();
			})
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},
		dataType : 'json'
	})
}; 

function saveToDos(){
	// [{"text" : "글내용", "id" : "1"}]
	// toDos가 값 하나하나고, JSON.stringify(toDos)가 배열형식
    //localStorage.setItem(TODOS_LS, JSON.stringify(toDos)); 

	console.log(JSON.stringify(toDos));
	console.log(toDos);
	

};

function paintToDo(text){

	// 이거 등록하면서 남은 부분 제거
	//★ 확인용
	while (toDoList.firstChild) {
	    toDoList.lastChild.remove();
	}
	//toDoList.innerHTML = "";	
	window.localStorage.removeItem('TODOS_LS');
	console.log("왜? >> " +$('.card-text').attr('id')); //삭제할거
	
	memId = $('.card-text').attr('id');
	
	console.log("어이없다 ㅠㅠ text >> " + text);
	if(text != null | text!= ""){ 
	
	$.ajax({
		url : '/DTkkiri/saveReminder.do',
		data : {"id" : memId, "cont" : text},
		type : 'get',
		success : function(res){
			
			$.each(res, function(i,v){
				
				const li = document.createElement("li"); // li를 만들고
			    const delBtn = document.createElement("button"); // 삭제버튼을 생성해준다
			    delBtn.innerText = "❌";  // 삭제 버튼 안에 들어갈 내용
				delBtn.className = 'delButton';
			    delBtn.addEventListener("click", deleteToDo); // 클릭했을 때 deleteToDo 함수로 넘어간다
				delBtn.value = v.num;						// 삭제했을 때 댓글 번호를 파악하기 위한 val 값 제공
			    const span = document.createElement("span");	// span을 생성한다 (내용 담을 곳) span
			    const newId = toDos.length + 1;				// toDo 값을 생성해준다
			    span.innerText = v.cont;					// span 안에 리마인더 내용을 넣어준다
				span.className = 'todo';

			    // toDoList.appendChild(li); 
			    // 원페이지에 스크롤 보이지 않게 하기 위해 숫자 제한 : 8개
			    if(newId < 9){
				    li.appendChild(span);						
				    li.appendChild(delBtn);
				    li.id = newId;

			        toDoList.appendChild(li);
			    }else{
			        alert("최대 8개까지 작성할 수 있습니다!")
			    }
			    const toDoObj = {
			        text: text,
			        id: newId
			    };
			    // toDos.push(toDoObj);
			    // 원페이지에 스크롤 보이지 않게 하기 위해 숫자 제한 : 8개
			    if(newId < 9){
			        toDos.push(toDoObj);
			    }
			   // saveToDos();
			})
			

		},
		error : function(xhr){
				alert("상태 >" + xhr.status);		
					},
		dataType : 'json'
	})
	
	}

};

function handleSubmit(e){ //<form> js-toDoForm의 내용을 submit하는 함수 
    e.preventDefault();
    const currentValue = toDoInput.value;
	
    paintToDo(currentValue);
    // 엔터 누르면 input 안 초기화
    toDoInput.value = "";
	toDoList.value = "";
};

function loadToDos(text){
   // const loadedToDos = localStorage.getItem(TODOS_LS);

	//★ 확인용
	while (toDoList.firstChild) {
	    toDoList.lastChild.remove();
	}

	//toDoList.innerHTML = "";
	memId = $('.card-text').attr('id');

	$.ajax({
		url : '/DTkkiri/selectReminder.do',
		data : {"id" : memId},
		type : 'get',
		success : function(res){
			$.each(res, function(i,v){
				
				const li = document.createElement("li"); // li를 만들고
			    const delBtn = document.createElement("button"); // 삭제버튼을 생성해준다
			    delBtn.innerText = "❌";  // 삭제 버튼 안에 들어갈 내용
				delBtn.className = 'delButton';
			    delBtn.addEventListener("click", deleteToDo); // 클릭했을 때 deleteToDo 함수로 넘어간다
				delBtn.value = v.num;						// 삭제했을 때 댓글 번호를 파악하기 위한 val 값 제공
			    const span = document.createElement("span");	// span을 생성한다 (내용 담을 곳)
			    const newId = toDos.length + 1;				// toDo 값을 생성해준다
			    span.innerText = v.cont;					// span 안에 리마인더 내용을 넣어준다
				span.className = 'todo';

			    // toDoList.appendChild(li); 
			    // 원페이지에 스크롤 보이지 않게 하기 위해 숫자 제한 : 8개
			    if(newId < 9){
				    li.appendChild(span);						
				    li.appendChild(delBtn);
				    li.id = newId;

			        toDoList.appendChild(li);
			    }else{
			        alert("최대 8개까지 작성할 수 있습니다!")
			    }

			    // toDos.push(toDoObj);
				if(text != "" || text != null){
					const toDoObj = {
				     text: text,
				     id: newId
				    };
				    // 원페이지에 스크롤 보이지 않게 하기 위해 숫자 제한 : 8개
				    if(newId < 9){
	
				        toDos.push(toDoObj);
				    }
					
				}
				

			   // saveToDos();
			})
			

		},
		error : function(xhr){
				alert("상태 >" + xhr.status);		
					},
		dataType : 'json'
	})
};

/*
	loadedToDos = paintToDo;
    if(loadedToDos !== null){
        const parsedToDos = JSON.parse(loadedToDos);
        parsedToDos.forEach(function(toDo){
            paintToDo(toDo.text);
        });
    }

*/

	


function init(){
    loadToDos();
    toDoForm.addEventListener("submit",handleSubmit);
};

init();