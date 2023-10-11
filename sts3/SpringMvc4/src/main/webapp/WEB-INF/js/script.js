/**
 * 
 */
$(function() {
	//초기이미지
	$("#myimg").attr("src","../image/1.jpeg");
	
	$("#myimg").mouseover(function(){
		
		$(this).attr("src","../image/12.jpeg");
	});
	
	$("#myimg").mouseout(function(){
		
		$(this).attr("src","../image/1.jpeg");
	});
});