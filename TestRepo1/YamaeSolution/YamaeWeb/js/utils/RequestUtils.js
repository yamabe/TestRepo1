
function RequestUtils() {
};


RequestUtils.buildUrlWithQueryString = function (url, param) {

	return url + "?" + RequestUtils.buildQueryString(param);
};

RequestUtils.buildQueryString = function (param) {
	var a = [];

	for (k in param) {
		a.push(k + '=' + escape(param[k]));
	}

	return a.join('&');
};

RequestUtils.parseUrl = function (url) {

	var urlAry = url.split("?");

	var ret = {};

	ret.url = urlAry[0];

	if (urlAry.length > 1) {
		var query = urlAry[1].split("&");
		var data = {};

		for (var q in query) {
			var valAry = query[q].split("=");
			if (valAry.length == 2) {
				data[valAry[0]] = valAry[1];
			} else {
				data[valAry[0]] = "";
			}
		}

		ret.query = data;
	}

	return ret;
};


RequestUtils.createXhr = function() {
		if(XMLHttpRequest){
			return new XMLHttpRequest();
		}else{
			try{
				return new ActiveXObject('MSXML2.XMLHTTP.6.0');
			}catch(e){}
			try{
				return new ActiveXObject('MSXML2.XMLHTTP.3.0');
			}catch(e){}
			try{
				return new ActiveXObject('MSXML2.XMLHTTP');
			}catch(e){}
		}
		return null;

};
