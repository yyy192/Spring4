/**
 * select.js
 */
 
let c1 = document.getElementsByClassName('c1');
let btn = document.getElementById('btn');

//var t = 1; //전역변수 - page 어디에서든지 다 사용이 가능함.

btn.addEventListener('click', function(){
	
	for(let c of c1){
		if(!c.checked){
			c.checked = !c.checked;
		}
	}
	//alert('click button');	
});

for(let c of c1){
	if(c.checked){
		c.checked = !c.checked;
	}else{
		c.checked = !c.checked;
	}
}

for(let c of c1){
	c.addEventListener('click', function(){
		alert(c.checked);
	});
}