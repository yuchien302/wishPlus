jQuery(function(){
var $label = $('.sbi_label');
$label.hover(
function(){
	if ($(this).text()==="Step 3"){
	$('#arrow').css('display','block');
	$('#join_logo').addClass('hover') ;
	console.log("12")
}
	},
function(){
		if ($(this).text()==="Step 3"){
	$('#arrow').css('display', 'none');
	$('#join_logo').removeClass('hover');
	
}
	});

})