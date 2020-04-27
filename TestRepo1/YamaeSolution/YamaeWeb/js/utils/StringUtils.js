function StringUtils() {

}

StringUtils.getFileName = function(url) {
	var pathList = url.split("/");
	return pathList[pathList.length - 1];
};

StringUtils.replaceAll = function(expression, org, dest) {
	return expression.split(org).join(dest);
};

StringUtils.encodeFileName = function(fileName) {
	var encoded = encodeURIComponent(fileName);
	encoded = StringUtils.replaceAll(encoded, "~", "[~]")
	encoded = StringUtils.replaceAll(encoded, "%", "~")
	return encoded;
};

StringUtils.rightCut = function(str, cutStr) {

	var index = str.lastIndexOf(cutStr);

	return str.substring(0, index);

};

StringUtils.toZenkaku = function(str) {

	var val = str.replace(/[A-Za-z0-9]/g, function(s) {
	    return String.fromCharCode(s.charCodeAt(0) + 0xFEE0);
	});

	return val;

};

StringUtils.toJaDate = function(date) {

	var text = date.substring(0, 4);
	text = text + "年";
	text = text + date.substring(4, 6);
	text = text + "月";
	text = text + date.substring(6, 8);
	text = text + "日";
	text = text + date.substring(8, 10);
	text = text + "時";
	text = text + date.substring(10, 12);
	text = text + "分";
//	text = text + date.substring(12, 14);
//	text = text + "秒";

	return text;
};

StringUtils.formatDate = function(date) {
	var text = date.getYear();
	text = text + "年";
	text = text + (date.getMonth() + 1);
	text = text + "月";
	text = text + date.getDate();
	text = text + "日";

	return text;
};

StringUtils.formatDayTime = function(date) {
	var text = "";
	text = text + (date.getMonth() + 1);
	text = text + "/";
	text = text + date.getDate();

	text = text + "　" + date.getHours();
	text = text + ":" + date.getMinutes();
	text = text + ":" + date.getSeconds();

	return text;
};

StringUtils.formatTime = function(date) {
	var text = date.getHours();
	text = text + ":" + date.getMinutes();
	text = text + ":" + date.getSeconds();

	return text;
};

StringUtils.startsWith = function(str, prefix) {
	return str.lastIndexOf(prefix, 0) == 0;
};

StringUtils.endsWith = function(str, suffix) {

	var index = str.lastIndexOf(suffix);

	if (index + suffix.length == str.length) {
		return true;
	}

	return false;
};



StringUtils.formatYYYYMMDD = function(dd) {

	yy = dd.getYear();
	mm = dd.getMonth() + 1;
	dd = dd.getDate();
	if (yy < 2000) {
		yy += 1900;
		}
//	if (mm < 10) { mm = "0" + mm; }
//	if (dd < 10) { dd = "0" + dd; }
	return yy + "年" + mm + "月" + dd + "日";

};

