/**
 * boardFile.js
   최대 5개까지만 추가 가능
 */
 
let file = '<div class="input-group mb-3">';
file = file + '<input type="file" name="files" class="form-control n" id="photo">';
file = file + '<button type="button" class="btn btn-outline-secondary del">X</button>';
file = file + '</div>'; 

let count = 0;
//let index = 0;

$("#add").click(function(){
	
	/*index++;
	
	let file = '<div class="input-group mb-3" id="del'+index+'">';
	file = file + '<input type="file" class="form-control n" id="photo" name="photo">';
	file = file + '<button data-btn-id="'+index+'" type="button" class="btn btn-outline-secondary del">X</button>';
	file = file + '</div>'; */
	
	if(count<5){
		$("#addResult").append(file);	
		count++;
	}else{
		alert('더 이상 파일을 생성할 수 없습니다.');
		//console.log(count);
	}
});

$("#addResult").on('click', '.del', function(){
	//let num = $(this).attr('data-btn-id');
	//console.log(num);
	//$("#del"+num).remove();
	$(this).parent().remove();
	count--;
})
	
/*$(".del").click(function(){
	alert('test');
});*/
 