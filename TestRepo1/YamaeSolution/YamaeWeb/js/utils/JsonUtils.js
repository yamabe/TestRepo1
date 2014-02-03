function JsonUtils() {

}

JsonUtils.setDOMElement = function(ele, key, obj) {
	ele.attr(key, JSON.stringify(obj));
};


JsonUtils.getDOMElement = function(ele, key) {

	if (!ele.attr(key)) {
		return;
	}

	var json = JSON.parse(ele.attr(key));

	return json;

};

