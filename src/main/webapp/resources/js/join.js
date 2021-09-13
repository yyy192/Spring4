/**
 * join.js 
 */

 //join버튼 눌렀을 때 id, pw, name, email, phone이 비어있으면 X

$("#btn").click(function(){
	
	let result = true;
	let t;
	$(".n").each(function(n1, n2){
		if($(n2).val() == ""){
			result = false;
			t=n2;
		}
		
	});
	
	if(result){
		alert("회원가입 성공");
		//$("#frm").submit();
	}else{
		alert("필수 약관(들)을 동의하셔야 합니다.")
		$(t).focus();
	} 
});
 