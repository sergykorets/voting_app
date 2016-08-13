$(document).ready(function() {
	$(".show-more button").on("click", function() {
		var $this = $(this);
		var $content = $this.parent().next("div.content");
		
		// Toggle
		$content.toggleClass("show-content");

		var shown = $content.hasClass("show-content");
		if (shown) {
			linkText = "Méně";
		} else {
			linkText = "Více";
		}
		$this.text(linkText);
	});
});