function remaining_votes_get()
{
	var max_votes = $(".remaining-votes").data("maxVotes");
	var current_votes = $(".remaining-votes-container input:checked").length;
	return max_votes - current_votes;
}

function remaining_votes_update()
{
	var remaining_votes = remaining_votes_get();
	$(".remaining-votes").html(remaining_votes);
	if (remaining_votes <= 0) {
		$(".remaining-votes").parent().removeClass("label-default");
		$(".remaining-votes").parent().addClass("label-success");
	} else {
		$(".remaining-votes").parent().removeClass("label-success");
		$(".remaining-votes").parent().addClass("label-default");
	}
}

$(document).ready(function() {
	$(".remaining-votes-container input[type=checkbox]").on("click", function(e) {
		if ($(this).is(":checked")) {
			if (remaining_votes_get() < 0) {
				e.preventDefault();
			} else {
				remaining_votes_update();
			}
		} else {
			remaining_votes_update();
		}
	});
	remaining_votes_update();
});