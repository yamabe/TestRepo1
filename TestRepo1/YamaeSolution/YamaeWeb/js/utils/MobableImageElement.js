function MobableImageElement(src, canvas) {
	var image = new Image();
	image.id = "MobableImageElement";
	var src = src;
	var canvas = canvas;
	var data = {};
	data.dragFlg = false;

	var selector = null;

	image.onload = function(e) {

		var offset = $("#uploadFilesArea").offset();
		offset.top = $(window).scrollTop();
		offset.left = $(window).scrollLeft() + 5 +  $("#pasteImageToCanvas").height();

		if (offset.top < $("#wbCanvas").offset().top) {
			offset.top = $("#wbCanvas").offset().top + 10 + $("#pasteImageToCanvas").height();
		}
		if (offset.left < $("#wbCanvas").offset().left) {
			offset.left = $("#wbCanvas").offset().left + 10;
		}

		var gap = 100 / image.height;
		var width = image.width * gap;

		$(image).css({
			'display' : 'none',
			'width' : width + "px",
			'height' : "100px",
			'position' : 'absolute',
			'top' : offset.top,
			'left' : offset.left,
			'z-index' : 1000,
		});

		$(image).appendTo($(document.body));

		$(image).show();

		var offset = $("#pasteImageToCanvas").offset();

		offset.top = $(image).offset().top - $("#pasteImageToCanvas").height();
		offset.left = $(image).offset().left;

		$("#pasteImageToCanvas").show();
		$("#pasteImageToCanvas").offset(offset);

		selector = new ResizableImageElement(image, canvas);
	};

	image.src = src;

	image.eventList = new HandlerEventList();

	$(document.body).mousemove(function(e) {

		if (data.dragFlg) {

			D.c("mouse move");

			var x = returnAdjustX(e);
			var y = returnAdjustY(e);

			var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, 0);
			image.eventList.add(ep);

			var preParam = image.eventList.getPre(ep);

			if (!preParam) {
				return;
			}

			var topMove = ep.y - preParam.y;
			var leftMove = ep.x - preParam.x;

			var nextTop = $(image).offset().top + topMove;
			var nextLeft = $(image).offset().left + leftMove;

			$(image).css({
				"top" : nextTop,
				"left" : nextLeft,
				});

			selector.move();

			var offset = $("#pasteImageToCanvas").offset();
			offset.top = nextTop - $("#pasteImageToCanvas").height();
			offset.left = nextLeft;

			$("#pasteImageToCanvas").show();
			$("#pasteImageToCanvas").offset(offset);
		}
	});

	$(image).mousedown(function(e) {

		D.c("mouse down");

		e.preventDefault();


		data.dragFlg = true;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, 0);
		image.eventList.add(ep);

	});

	$(document.body).mouseup(function(e) {

		D.c("mouse up move:" + e.type);


		data.dragFlg = false;

		var x = 0;
		var y = 0;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

//		var preParam = image.eventList.getPreMouse(null, 1);
//		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg,
//				preParam.index + 1);
//		image.eventList.add(ep);

		image.eventList.removeMouseHandlerParam();
	});

	$(image).mouseup(function(e) {

		D.c("mouse up move:" + e.type);


		data.dragFlg = false;

		var x = 0;
		var y = 0;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var preParam = image.eventList.getPreMouse(null, 1);
		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg,
				preParam.index + 1);
		image.eventList.add(ep);

		image.eventList.removeMouseHandlerParam();
	});

	$(document.body).mouseleave(function(e) {

		data.dragFlg = false;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var preParam = image.eventList.getPreMouse(null, 1);
		var index = 0;
		if (preParam) {
			index = preParam.index + 1;
		}
		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, index);
		image.eventList.add(ep);

		image.eventList.removeMouseHandlerParam();
	});


	function returnAdjustX(e) {
		var returnX = 0;

		var x = $(window).scrollLeft();

		if (MobileUtils.isIOS()) {

			D.c("test:" + e.type);
			// iPphoneにはscrollの位置を設定する必要はないようだ
			returnX = e.touches[0].pageX;
		} else {
			returnX = e.clientX + x;
		}

		return returnX;
	}

	function returnAdjustY(e) {
		var returnY = 0;

		var y = $(window).scrollTop();
		// $("#mes").text("scroll y:" + y);

		if (MobileUtils.isIOS()) {

			D.c("test:" + e.type);

			// iPphoneにはscrollの位置を設定する必要はないようだ
			returnY = e.touches[0].pageY;
		} else {

			returnY = e.clientY + y;
		}

		return returnY;

	}


	image.addEventListener("touchmove", function(e) {
		if (data.dragFlg) {

			D.c("mouse move");

			var x = returnAdjustX(e);
			var y = returnAdjustY(e);

			var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, 0);
			image.eventList.add(ep);

			var preParam = image.eventList.getPre(ep);

			if (!preParam) {
				return;
			}

			var topMove = ep.y - preParam.y;
			var leftMove = ep.x - preParam.x;

			var nextTop = $(image).offset().top + topMove;
			var nextLeft = $(image).offset().left + leftMove;

			$(image).css({
				"top" : nextTop,
				"left" : nextLeft,
				});


			var offset = $("#pasteImageToCanvas").offset();
			offset.top = nextTop - $("#pasteImageToCanvas").height();
			offset.left = nextLeft;

			$("#pasteImageToCanvas").show();
			$("#pasteImageToCanvas").offset(offset);

			selector.move();
		}
	}, false);

	image.addEventListener("touchstart", function(e) {

		D.c("mouse down");

		e.preventDefault();


		data.dragFlg = true;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, 0);
		image.eventList.add(ep);
	}, false);

	image.addEventListener("touchend", function(e) {


		D.c("mouse up");

		data.dragFlg = false;

		var x = 0;
		var y = 0;

		var preParam = image.eventList.getPreMouse(null, 1);

		if (!preParam) {
			return;
		}

		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg,
				preParam.index + 1);
		image.eventList.add(ep);

		image.eventList.removeMouseHandlerParam();
	}, false);


	image.addEventListener("touchcancel", function(e) {


		data.dragFlg = false;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var preParam = image.eventList.getPreMouse(null, 1);
		var index = 0;
		if (preParam) {
			index = preParam.index + 1;
		}
		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, index);
		image.eventList.add(ep);

		image.eventList.removeMouseHandlerParam();
	}, false);


};

function getMobableImageElement() {
	return $("#MobableImageElement");

}