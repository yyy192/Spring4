/**
 * join.js 
 */


const btn = document.getElementById('btn');
const n = document.getElementsByClassName('n');
const pws = document.getElementsByClassName('pw');
const frm = document.getElementById('frm');
const id = document.getElementById('id');
const idResult = document.getElementById('idResult');
const idCheck = document.getElementById('idCheck');

/*id.addEventListener('blur', function(){
	if(id.value.trim().length<6){
		id.focus();
	}
});*/

idCheck.addEventListener('click', function(){
	//                                               ----팝업창----
	open("./idCheck?id="+id.value, "", "width=400, height=200, top=200, left=300");
})

id.addEventListener('change', function(){
	alert('change');
})


btn.addEventListener('click', function(){
	//비어있는 것들 검사
	let ce = checkEmpty(n);
	//alert(ce);
	
	//pw 두 개의 값이 같은지 검사
	let ce2 = checkEqual1(pws[0].value, pws[1].value);
	//alert(ce2);
	
	let c1 = checkLength();
	//alert(c1);
	
	if(ce && ce2 && c1){
		frm.submit();
	}else{
		alert('필수 입력 하세요.');
	}
});

function checkLength(){
	let l = pws[0].value.trim().length;
	if(l>=6){
		return true;
	}else{
		return false;
	}
}
	
function checkEqual1(check1, check2){
	return check1 ==check2;
}
function checkEmpty(ns){
	let result = true;
	
	for(let r of ns){
		if(r.value.trim()==""){
			result = false;
			break;
		}
	}
	
	return result;
}


 