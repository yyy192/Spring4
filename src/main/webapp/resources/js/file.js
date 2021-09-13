/**
 * file.js
 */

let file = '<div class="mb-3" id="f">';
file = file + '<label for="photo" class="form-label">Photo</label>';
file = file + '<input type="file" class="form-control n" id="photo" name="photo">';
file = file + '</div>';
 
$("#add").click(function(){
	//덮어쓰기
	$("#addResult").append(file);
});