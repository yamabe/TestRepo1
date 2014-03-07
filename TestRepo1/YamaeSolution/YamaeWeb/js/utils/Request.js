
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



Request.prototype.ajax = function (options) {
    var defaults = {
        type: "Post",
        parseJson:false,
        data: {},
        async: false,
        //cache : false,
        success: false
    };

    var opts = $.extend(defaults, options);

    var data = opts.data;

    if (opts.parseJson) {
        data = {
            data: JSON.stringify(opts.data)
        };
    }

    $.ajax({
        type: opts.type,
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        url: opts.url,
        data: JSON.stringify(data),

        beforeSend: function (xhr) {
            xhr.setRequestHeader("Accept", "application/json")
        },
        success: function (data, textStatus, xhr) {
            if (opts.success) {
                //console.log(data);
                //console.log(textStatus);
                //console.log(xhr);

                opts.success(data, textStatus, xhr);
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            if (opts.error) {
                opts.error(xhr.textStatus, errorThrown);
            }
        }
    });
};
