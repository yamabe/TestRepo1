
function Request() {

};

Request.prototype.request = function (options) {

	var defaults = {
			url : "",
			type : "get",
			data: {},
			async : false,
			//cache : false,
			success: false
	};

	var opts = $.extend(defaults, options);


	var url = opts.url;
	var type = opts.type;
	var data = opts.data;
	var async = opts.async;
	var success = opts.success;

	if (type == "get") {
		url = RequestUtils.buildUrlWithQueryString(url, data);
		if (success) {

			$.ajax({
				url : url,
				type : type,
				async : async,
				success : success
			});

		} else {
			var html = $.ajax({
				url : url,
				type : type,
				async : async
			});

			return html;
		}

	} else {
		if (success) {
			$.ajax({
				url : url,
				data : data,
				type : type,
				async : async,
				success : success
			});

		} else {
			var html = $.ajax({
				url : url,
				data : data,
				type : type,
				async : async
			});

			return html;
		}

	}

};
