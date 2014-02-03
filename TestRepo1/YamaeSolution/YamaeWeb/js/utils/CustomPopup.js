var _customPopupMap = {};

function CustomPopup(popupName,res , isOpen, modal) {
	
	if (modal === undefined) {
		modal = true;
	}

	var all = $(res);

	var element = $(all[0]);
	var script = $(all[3]);

//	element.addClass("easyui-window");
//	element.attr("data-options", "modal:true,closed:true,iconCls:'icon-save'");
//	element.window();

	var popupId = element.attr("id");

	if (JQueryUtils.exists(popupId)) {
		element = $("#" + popupId);

		if (isOpen) {
			var popup = _customPopupMap[popupName];
			
			popup.clear();
			popup.init();
			
			element.window("open");
		} else {
			element.window("close");

		}
	} else {

		if (isOpen) {
			element.appendTo($(document.body));
			script.appendTo($(document.body));

			element.addClass("easyui-window");
			element.attr("data-options", "modal:" + modal + ",closed:true,iconCls:'icon-save'");
			element.window();
			popupId = element.attr("id");

			element.window("open");
		}
	}
};

CustomPopup.open = function(popupName, modal) {
	
	if (modal === undefined) {
		modal = true;
	}

	var callback = function(res) {
		var html = $(res);

		new CustomPopup(popupName, res, true, modal);

	};

	var req = new Request();

	var json = {

	};

	var opts = {
			url : "./popup.do?time="
				+ StringUtils.formatTime(new Date()),
				type : "post",
				cache : false,
				data : {
					"popupName" : popupName,
					"data" : JSON.stringify(json)
				},
				async : true,
				success : callback

	};

	req.request(opts);
};

CustomPopup.close = function(popupName) {

	var callback = function(res) {
		var html = $(res);

		var isOpen = false;

		new CustomPopup(popupName, res);

	};

	var req = new Request();

	var json = {

	};

	var opts = {
			url : "./popup.do?time="
				+ StringUtils.formatTime(new Date()),
				type : "post",
				cache : false,
				data : {
					"popupName" : popupName,
					"data" : JSON.stringify(json)
				},
				async : true,
				success : callback

	};

	req.request(opts);
};


CustomPopup.closeByElementId = function(elementId) {
	
	if (JQueryUtils.exists(elementId)) {
		var element = $("#" + elementId);
	
		element.window("close");
	}
};


