$(document).ready(function() {
	console.log( "ready!" );
	$(".show-more button").on("click", function() {
		var $this = $(this);
		console.log($this);
		var $content = $this.parent().prev("div.content");
		var linkText = $this.text().toUpperCase();

		console.log($content);
		$content.toggleClass("showContent");

		if(linkText === "MORE"){
			linkText = "Less";

		} else {
			linkText = "More";
		};

		$this.text(linkText);
	});
});