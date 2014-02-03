function ResizableImageElement(image, canvas) {

	SELECTOR_SIZE = 25;

	if (MobileUtils.isMobile()) {
		SELECTOR_SIZE = 40;
	}

	var image = image;
	var canvas = canvas;
	var data = {};
	data.dragFlg = false;

	function getImage() {
		return image;
	}

	function getCanvas() {
		return canvas;
	}

	function getData() {
		return data;
	}

	function getSelector() {
		return selector;
	}
	this.move = function () {

		var selector = getSelector();
		var image = getImage();

		$(selector).css({
			'top' : $(image).offset().top + $(image).height() - (SELECTOR_SIZE / 2),
			'left' : $(image).offset().left + $(image).width() - (SELECTOR_SIZE / 2),
		});
	}


	var selector = new Image();
	selector.onload = function(e) {
		$(selector).css({
			'display' : 'none',
			'width' : SELECTOR_SIZE + "px",
			'height' : SELECTOR_SIZE + "px",
			'position' : 'absolute',
			'top' : $(image).offset().top + $(image).height() - (SELECTOR_SIZE / 2),
			'left' : $(image).offset().left + $(image).width() - (SELECTOR_SIZE / 2),
			'z-index' : 1000,
		});

		$(selector).appendTo($("#selectors"));

		$(selector).show();

	};

	selector.src = "./image/selector.png";

	selector.eventList = new HandlerEventList();



	$(document.body).mousemove(function(e) {

		if (data.dragFlg) {

			D.c("mouse move");

			var x = returnAdjustX(e);
			var y = returnAdjustY(e);

			var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, 0);
			selector.eventList.add(ep);

			var preParam = selector.eventList.getPre(ep);

			if (!preParam) {
				return;
			}

			var topMove = ep.y - preParam.y;
			var leftMove = ep.x - preParam.x;

			var nextWidth = $(image).width() + leftMove;
			var tateyokohi = image.height / image.width;
			var nextHeight = $(image).height() + (leftMove * tateyokohi);

			$(image).css({
				"width" : nextWidth,
				"height" : nextHeight,
			});

			$(selector).css({
				'top' : $(image).offset().top + $(image).height() - (SELECTOR_SIZE / 2),
				'left' : $(image).offset().left + $(image).width() - (SELECTOR_SIZE / 2),
				});
		}
	});

	$(document.body).mouseup(function(e) {

		D.c("mouse up resize:" + e.type);

		data.dragFlg = false;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

//		var preParam = selector.eventList.getPreMouse(null, 1);
//
//		if (!preParam) {
//			return;
//		}
//
//		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, preParam.index + 1);
//		selector.eventList.add(ep);

		selector.eventList.removeMouseHandlerParam();
	});

	$(document.body).mouseleave(function(e) {

		D.c("mouse leave");
		data.dragFlg = false;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var preParam = selector.eventList.getPreMouse(null, 1);
		var index = 0;
		if (preParam) {
			index = preParam.index + 1;
		}
		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, index);
		selector.eventList.add(ep);

		selector.eventList.removeMouseHandlerParam();
	});

	$(selector).mousedown(function(e) {

		D.c("selector mouse down");

		e.preventDefault();


		data.dragFlg = true;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, 0);
		selector.eventList.add(ep);

	});

	$(selector).mouseup(function(e) {

		D.c("mouse up");

		data.dragFlg = false;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var preParam = selector.eventList.getPreMouse(null, 1);
		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg,
				preParam.index + 1);
		selector.eventList.add(ep);

		selector.eventList.removeMouseHandlerParam();
	});




	function returnAdjustX(e) {
		var returnX = 0;
		var isiPad = navigator.userAgent.match(/iPad/i) != null;
		var isiPhone = navigator.userAgent.match(/iPhone/i) != null;

		var x = $(window).scrollLeft();

		if (isiPad || isiPhone) {

			D.c("test2:" + e.type);
			// iPphoneにはscrollの位置を設定する必要はないようだ
			returnX = e.touches[0].pageX;
		} else {
			returnX = e.clientX + x;
		}

		return returnX;
	}

	function returnAdjustY(e) {
		var returnY = 0;
		var isiPad = navigator.userAgent.match(/iPad/i) != null;
		var isiPhone = navigator.userAgent.match(/iPhone/i) != null;

		var y = $(window).scrollTop();
		// $("#mes").text("scroll y:" + y);

		if (isiPad || isiPhone) {
			D.c("test2:" + e.type);

			// iPphoneにはscrollの位置を設定する必要はないようだ
			returnY = e.touches[0].pageY;
		} else {

			returnY = e.clientY + y;
		}

		return returnY;

	}




	document.body.addEventListener("touchmove", function(e) {
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

			var nextWidth = $(image).width() + leftMove;
			var tateyokohi = image.height / image.width;
			var nextHeight = $(image).height() + (leftMove * tateyokohi);

			$(image).css({
				"width" : nextWidth,
				"height" : nextHeight,
			});

			$(selector).css({
				'top' : $(image).offset().top + $(image).height() - (SELECTOR_SIZE / 2),
				'left' : $(image).offset().left + $(image).width() - (SELECTOR_SIZE / 2),
				});

		}
	}, false);

	selector.addEventListener("touchstart", function(e) {

		D.c("mouse down");

		e.preventDefault();


		data.dragFlg = true;

		var x = returnAdjustX(e);
		var y = returnAdjustY(e);

		var ep = new HandlerEventParam(e, e.type, x, y, data.dragFlg, 0);
		image.eventList.add(ep);
	}, false);

	selector.addEventListener("touchend", function(e) {


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

	document.body.addEventListener("touchend", function(e) {


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

	selector.addEventListener("touchcancel", function(e) {


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
