/**
 * check.js
 */
 
let c1 = document.getElementsByClassName('c1');
let all = document.getElementById('all');
let btn = document.getElementById('btn');
let option = document.getElementsByClassName('option');
let essential = document.getElementsByClassName('essential');


all.addEventListener('click', function(){
	if(all.checked){
		for(let ch of c1){
			ch.checked = true;
		}
	}else{
		for(let ch of c1){
			ch.checked = false;
		}	
	}
});

//--------------------- 약관동의 check ---------------------------

//--- 전체선택
for(let ch of c1){
	ch.addEventListener('click', function(){
		
		let result = true;
		
		for(let c of c1){
			if(!c.checked){
				result = false;
				break;
			}
		}
		
		all.checked=result;
		
	});
}


// ---- option제외

for(let es of essential){
	es.addEventListener('click', function(){
		
		let result = true;
		
		for(let e of essential){
			if(!e.checked){
				result = false;
				break;
			}
		}
		all.checked=result;
	});
}



btn.addEventListener('click', function(){
	/*alert(all.checked);*/
	if(all.checked){
		location.href="./join";
	}else{
		alert('필수 약관에 동의해야합니다.');
	}
});