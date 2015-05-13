$( document ).ready(function() {
	var clicks = 0;

	$('.octoclick').click(function(){
		clicks++;
		if(clicks === 1){
			this.src = 'img/octo-2.gif';
		}
		else if(clicks === 2){
			this.src = 'img/octo-3.gif';
		}
	});
});