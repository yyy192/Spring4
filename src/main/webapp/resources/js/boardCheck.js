/**
 * 
 */
let title = document.getElementById("title");
let writer = document.getElementById("writer");
let form = document.getElementById("form");

let fn2 = function(){
	
	
	let t = title.value;
	let w = writer.value;
	let title_error = document.getElementById("title_error");
	let writer_error = document.getElementById("writer_error");

	title_error.innerHTML="";
	writer_error.innerHTML="";	
	/*if(t != "" && w != "") {
		alert(true);
	}else{
		alert(false);
	}*/
	
	let check = true;
	
	if(t == ""){
		check = false;
		title_error.innerHTML = "필수 입력 하세요.";
	}
	if(w == ""){
		check = false;
		writer_error.innerHTML = "필수 입력 하세요.";
	}
	
	if(check){
		form.submit();
	}else{
		/*alert("필수 입력하세요..");*/
	}
};
  
let add = document.getElementById("add");
add.addEventListener("click", fn2);
