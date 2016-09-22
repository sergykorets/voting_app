$(document).ready(function() {
	$(".show-more button").on("click", function() {
		var $this = $(this);
		var $content = $this.parent().next("div.content");
		
		// Toggle
		$content.toggleClass("show-content");

		var shown = $content.hasClass("show-content");
		if (shown) {
			$this.parent().find("button.shown-with-content").show();
			$this.parent().find("button.shown-without-content").hide();
		} else {
			$this.parent().find("button.shown-with-content").hide();
			$this.parent().find("button.shown-without-content").show();
		}
	});
	$(".show-more button.shown-with-content").hide();
});