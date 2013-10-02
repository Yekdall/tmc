function countChars(countfrom,displayto) {
	var maxLen = document.getElementById(countfrom).getAttribute("maxlength");
	var len = document.getElementById(countfrom).value.length;
	var newlabel = null;

	var charleft = maxLen - len
  	
  	if (charleft == 0){
  		document.getElementById(displayto).innerHTML = "No characters left";
  	}
  	else {
  		document.getElementById(displayto).innerHTML = "Characters left: " + charleft;
  		if (charleft < 30) {
  		document.getElementById(displayto).style.color="red";
  		}
  		else {
  		document.getElementById(displayto).style.color="blue";
  		}	
	}
	
	
  	
  
  
}