function JQueryUtils() {

}

JQueryUtils.exists = function(id) {
	
	var ele = $("#" + id);
	
	if (!ele.attr("id")) {
		return false;
	}
	
	return true;
};


JQueryUtils.bindEvent = function (ele, func) {
    for (var i = 0; i < ele.length; ++i) {
        // ”z—ñ‚Ì–¼‘O[i]‚ðŽg‚Á‚½ˆ—
        var e = ele[i];
        e.bind('keyup', function (event) { func(event, this) });
        e.bind('change', function (event) { func(event, this) });
    }

}

