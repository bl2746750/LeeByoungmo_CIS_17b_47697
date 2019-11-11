<?php
include "inc/header.php";
if(!isset($_SESSION['admin'])) {
	@header('location:login.php');
}
?>
<div class="sixteen columns">
	<div class="box clearfix">
		<?php 
			$task = 'get_all';
			if(isset($_GET['task'])) {
				$task = $_GET['task'];
			}
			$mysurvey->process($task);
		?>
	</div>
</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-3.4.1.min.js"></script>
	<script type="text/javascript">
		jQuery(function ($) {
			$('.add_more').click(function(e){
				e.preventDefault();
				$('.answers').append('<li><input name="answers[]" type="text"></li>');
				return false;
			});

			$('.remove').click(function(e){
				e.preventDefault();
				$(this).parents('li').remove();
				return false;
			})
		})
	</script>
<?php include "inc/footer.php"; ?>
