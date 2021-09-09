/**
 * 
 */
 
 let btn = document.getElementById('btn');
 let c1 = document.getElementsByClassName('c1'); 

 let ar = ['a','b','c'];


/* for(let i=0;i<c1.length;i++){
	 let id = document.getElementById('id'+i);
	 id.addEventListener('click', function(){
		alert('click'+i);
	});
}
*/

/* for(let i of c1){
	i.addEventListener('click', function(){
		alert('click');
	});
}*/

 for(let s of c1){
	s.addEventListener('click', function(){
		//          data-writer-num
		//          dataset.writerNum
		let num = s.dataset.writerNum;
		//alert(num);
		let writer = document.getElementById('w'+num);
		alert(writer.innerText);
	});
}

 btn.addEventListener('click', function(){
	
	for(let i of c1){
		console.log(i.innerText);
	}
	
/*	
	ar.forEach(function(v, i, ar){
		console.log(v, i, ar);
	});
	
	for(let i of ar){
		console.log(i);
	}
		
	for(let i in ar){
		console.log(ar[i]);
	}
	
	for(let i=0;i<ar.length;i++){
		console.log(ar[i]);
	}*/
	
	
});