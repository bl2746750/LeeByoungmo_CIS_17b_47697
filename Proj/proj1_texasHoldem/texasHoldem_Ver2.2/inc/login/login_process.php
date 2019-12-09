
<script>
function showReg(){
	<?php $_SESSION['log_stat']=1; ?>
	var login=document.getElementById("login");
	var register=document.getElementById
	
	$('#login').hide();
	$('#register').show();
}

function regInit(){
	var regLink=document.getElementById("regLink");
	regLink.onclick=showReg();
}
</script>