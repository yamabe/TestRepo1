function InputCheckUtils() {

}

InputCheckUtils.isMaxLength = function(str, size) {
	if (str.length <= size) {
		return true;
	}
	return false;
}


InputCheckUtils.isNotEmpty = function(str) {
	
	if (!str) {
		return false;
	}
	
	str = str.replace(/^\s+|\s+$/g, "");
	if (str) {
		return true;
	}

	return false;
}


InputCheckUtils.hasKigou = function(str) {

	var res = !(/[!"#$%&',\/;<=>?\\]/.test(str));
	if(!res){
		return true;
	}
	return false;
};

InputCheckUtils.isMail = function(str) {

  if (!str.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)) {
    return false;
  }
  return true;

};

InputCheckUtils.isPassword = function(str) {

  if (!str.match(/^[a-zA-Z0-9]+$/)) {
    return false;
  }
  return true;

};

InputCheckUtils.isNumeric = function(str) {

	  if (!str.match(/^[0-9]+$/)) {
	    return false;
	  }
	  return true;

	};
