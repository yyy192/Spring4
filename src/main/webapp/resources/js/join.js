/**
 * join.js
 */

let pw = document.getElementById('pw');
let pw2 = document.getElementById('pw2');
let same = document.getElementById('same');
let btn = document.getElementById('btn');



btn.addEventListener('click', function(){
	pw=pw.value;
	pw2=pw2.value;
	
	same.innerHTML="";
	
	
	if(pw==pw2){
	same.innerText='비밀번호가 일치합니다.';
	}else{
		same.innerText='비밀번호가 일치하지 않습니다.';
	}
});


 