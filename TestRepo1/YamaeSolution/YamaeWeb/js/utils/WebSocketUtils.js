function WebSocketUtils() {

}

WebSocketUtils.create = function(hostname, port, path) {

	if (window.WebSocket) {
		return new WebSocket("ws://" + hostname + ":" + port + "/" + path);
	} else {
		return new MozWebSocket("ws://" + hostname + ":" + port + "/" + path);
	}
};


WebSocketUtils.sendJson = function(soc, msg) {

	D.c(msg);
	D.c(JSON.stringify(msg));
	
	if (!soc) {
		console.log("socketが未接続です。");
		console.log(msg);
	} else {
		soc.send(JSON.stringify(msg));
	}
};

WebSocketUtils.close = function(soc) {

	soc.close();
};


WebSocketUtils.isConnecting = function(soc) {
	
	if (!soc) {
		return false;
	}
	

	if (window.MozWebSocket) {

		if (soc.readyState == MozWebSocket.CONNECTING) {
			return true;
		}

		return false;
	} else {
		if (soc.readyState == WebSocket.CONNECTING) {
			return true;
		}
		return false;
	}


};


WebSocketUtils.isAlive = function(soc) {
	if (!soc) {
		return false;
	}

	if (window.MozWebSocket) {

		if (soc.readyState == MozWebSocket.CLOSED || soc.readyState == MozWebSocket.CLOSING) {
			return false;
		}

		return true;
	} else {
		if (soc.readyState == WebSocket.CLOSED || soc.readyState == WebSocket.CLOSING) {

			return false;
		}

		return true;
	}


};

WebSocketUtils.createId = function() {
	var date = new Date();
	var text = "";
	text = text + date.getYear();

	text = text + "/" + (date.getMonth() + 1);
	text = text + "/" + date.getDate();

	text = text + " " + date.getHours();
	text = text + ":" +date.getMinutes();
	text = text + " " + date.getSeconds();
	text = text + " " + date.getMilliseconds();
	
	return text;
};
