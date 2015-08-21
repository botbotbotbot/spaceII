$( document ).ready(function() {

	var spaceNumber = getRandomSpaceNumber(417);
	selectSpaceBackground(spaceNumber);

	setInterval(function(){
		var spaceNumber = getRandomSpaceNumber(417);
		selectSpaceBackground(spaceNumber);
	}, 10000);

});

var getRandomSpaceNumber = function(maxSpacePics){
	var thisNum = Math.floor(Math.random() * maxSpacePics) + 1;
	if(thisNum < 10){
		return '00' + thisNum;
	}
	else if(thisNum < 100){
		return '0' + thisNum;
	}
	else{
		return thisNum;
	}
}

var selectSpaceBackground = function(thisNum){
	$('body').css('background-image', 'url(' + 'http://tothemoon.ser.asu.edu/data_m/MA-5/small/MA-5-4712-'+thisNum+'_s.png' + ')');

	var randNumX = Math.floor(Math.random() * 25) + 1;
	var randNumY = Math.floor(Math.random() * 25) + 1;

	$('body').animate({
	  'background-position-x': randNumX + '%',
	  'background-position-y': randNumY + '%'
	}, 10000, 'linear');
}