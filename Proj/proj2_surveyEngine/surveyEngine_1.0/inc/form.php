<?php //echo "<pre>"; print_r($question); echo "</pre>";?>

<form action="admin.php?task=save" method="post">
	<fieldset>
		<label for="regularTextarea">Question</label>
		<textarea id="regularTextarea" name="question"><?php echo (isset($question['question']))?$question['question']:'';?></textarea>
		<input type="hidden" name="id" value="<?php echo (isset($question['id']))?$question['id']:'new';?>">
		<div>
			<strong>Answers:</strong>
		</div>
		<ol class="answers">
		<?php if(!empty($question['answers'])): ?>
			<?php foreach ($question['answers'] as $option): ?>
				<li>
					<input name="answers[]" type="text" value="<?php echo $option; ?>">  <a href="#remove" class="button remove">-</a>
				</li>
			<?php endforeach; ?>

		<?php else: ?>
				<li>
					<input name="answers[]" type="text">
				</li>
		<?php endif; ?>
				
		</ol>
		<a href="#add_more" class="button add_more">Add more answers</a>
	</fieldset>
	<button type="submit">Save</button>
</form>
