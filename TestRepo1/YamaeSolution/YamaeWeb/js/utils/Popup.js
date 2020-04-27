function Popup(zindex) {
	this.zindex = zindex;

	var h = Popup.getCoverHeight();

	var m = $('<div></div>').css({
		'display' : 'none',
		'width' : '100%',
		'height' : h + 'px',
		'position' : 'absolute',
		'top' : 0,
		'left' : 0,
		'z-index' : (100),
		'opacity' : 0.7,
		'-moz-opacity' : 0.7,
		'background-color' : "gray",
		'filter' : 'alpha( opacity=70 )'
	});

	m.attr("id", "coverDialogId");

	m.appendTo($("#canvasDiv"));

	var t = $('<div></div>');
	t.css({
		'display' : 'none',
		'width' : '0px',
		'height' : '0px',
		'position' : 'absolute',
		'top' : 0,
		'left' : 0,
		'z-index' : (100),
		'opacity' : 0.7,
		'-moz-opacity' : 0.7,
		'background-color' : "gray",
		'filter' : 'alpha( opacity=70 )'
	});
	t.attr("id", "popupDialogId");

	t.appendTo($("body"));
	t.hide();
};

Popup.prototype.showText = function(text) {

	var win = $("#popupDialogId");
	win.empty();

	win.append($(text));

//	var width = win.width();
//	var height = win.height();
	var width = 200;
	var height = 50;

	win.css({
		'width' : width + 'px',
		'height' : height + 'px',
		'position' : 'absolute',
		'top' : 0,
		'left' : 0,
		'vertical-align' : "middle",
		'background-color' : "white",
		'font-size' : "13px"
	});

    var sc = Popup.getScrollTop();

    var dh = Popup.getCoverHeight();
    var dw = document.body.clientWidth;

    var left = ( ( dw / 2 ) - ( parseInt( width ) / 2 ) );
    var top = ( ( dh / 2 ) - ( parseInt( height ) / 2 ) + sc -50);


    left = ( left < 0 ) ? 0 : left + 'px';
    top = ( top < 0 ) ? 0 : top + 'px';
    win.css( { 'width': width + 'px', 'left': left, 'top': top } );

    win.show();

};

Popup.prototype.showHtml = function(html, w, h) {

	var win = $("#popupDialogId");
	win.empty();

	win.append(html);

	var width = w;
	var height = h;

	win.css({
		'width' : width + 'px',
		'height' : height + 'px',
		'position' : 'absolute',
		'top' : 0,
		'left' : 0,
		'vertical-align' : "middle",
		'background-color' : "white"
	});

    var sc = Popup.getScrollTop();

    var dh = Popup.getCoverHeight();
    var dw = document.body.clientWidth;

    var left = ( ( dw / 2 ) - ( parseInt( width ) / 2 ) );
    var top = ( ( dh / 2 ) - ( parseInt( height ) / 2 ) + sc -50);


    left = ( left < 0 ) ? 0 : left + 'px';
    top = ( top < 0 ) ? 0 : top + 'px';
    win.css( { 'width': width + 'px', 'left': left, 'top': top } );

    win.show();

};


Popup.prototype.closeText = function() {

	$("#popupDialogId").hide();

};



Popup.prototype.showCover = function() {

	console.log("show");

	var h = Popup.getCoverHeight();

	var m = $('#coverDialogId');

	m.show();

	$(window).scroll(function() {
        var h = Popup.getCoverHeight();
        var w = Popup.getCoverWidth();
        $( '#coverDialogId' ).css({ 'height': h + 'px', 'width': w + 'px'});
	});
	$(window).resize(function() {
        var h = Popup.getCoverHeight();
        var w = Popup.getCoverWidth();
        $( '#coverDialogId' ).css({ 'height': h + 'px', 'width': w + 'px'});
	});
};



Popup.prototype.closeCover = function() {

	console.log("close");
	$("#coverDialogId").hide();

};


Popup.getCoverHeight = function() {
	var h = (document.body.clientHeight > document.body.scrollHeight) ? document.body.clientHeight
			: document.body.scrollHeight;
	h = (h > document.documentElement.scrollHeight) ? h
			: document.documentElement.scrollHeight;
	h = (h > document.documentElement.clientHeight) ? h
			: document.documentElement.clientHeight;
	return h;
};

Popup.getCoverWidth = function() {
	var h = (document.body.clientWidth > document.body.scrollWidth) ? document.body.clientWidth
			: document.body.scrollWidth;
	h = (h > document.documentElement.scrollWidth) ? h
			: document.documentElement.scrollWidth;
	h = (h > document.documentElement.clientWidth) ? h
			: document.documentElement.clientWidth;
	return h;
};

Popup.getScrollTop = function() {
	if (document.body.scrollTop > document.documentElement.scrollTop) {
		return document.body.scrollTop;
	} else {
		return document.documentElement.scrollTop;
	}
};



Popup.prototype.createWindow = function(text) {

    var win = $(
    '<table><tr><td></td><td ></td><td>' + text+ '</td></tr></table>'
    );

    win.appendTo($(document.body));
    return win;

};


