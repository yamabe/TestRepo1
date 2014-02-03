function MobileUtils() {

}

MobileUtils.isMobile = function() {

	if (MobileUtils.isIOS()) {
		return true;
	}

	false;
};


MobileUtils.isIOS = function() {
	var isiPad = navigator.userAgent.match(/iPad/i) != null;
	var isiPhone = navigator.userAgent.match(/iPhone/i) != null;

	if (isiPad || isiPhone) {
		return true;
	} else {
		return false;
	}
};
