﻿function FileUpload(elm_id, param){
    var UPLOAD_URL = './upload.do';
    var TEXT_ENCODING = 'UTF-8';

    var popup = new Popup(1000);

    // 初期化
    this.init = function(elm_id){

        if( $("#" + elm_id).size() == 0 ){
            alert("can't find drop to element id : " + elm_id);
            return;
        }
        LOADED_FILES = [];

        // drop eventをセット.
        // ※jquery.bindを使用すると、drop eventからdataTransferを取得不可。
        var this_obj = this;
        document.getElementById(elm_id)
        .addEventListener('drop',
        		function(e){
            var files = e.dataTransfer.files;

            if (!files) {
            	return;
            }

        	var myObj = _canvasParams["wbCanvas"];

            if (files.length <= 0) {
	            //alert("ファイルが選択されていません");
            	popup.closeCover();
            	return;
            }

        	if (myObj.opts.uploadedFileCount + files.length >= CanvasPainter.MAX_UPLOAD_FILE_COUNT) {
        	    alert("アップロードファイル可能数の上限を超えています。アップロードファイルを削除してからアップロードしてください。");
            	popup.closeCover();
            	return;
            }

            if (files.length >= 2) {
	            alert("複数のファイルが選択されているためアップロードできません");
        		popup.closeCover();
            	return;
        	}

            var files = e.dataTransfer.files;

            for (var i=0; i<files.length; i++){
                if (files[i].size ==0) continue;

                if (files[i].size > 5000 * 1000) {
    	            alert("ファイルサイズが大きすぎます。(5Mまで)");
            		popup.closeCover();
                	return;
                }
            }

            var checkAry = [".jpeg", ".jpg", ".png", ".pdf"];

            for (var i=0; i<files.length; i++){
                if (files[i].size ==0) continue;

                var isValid = false;

                for (var j in checkAry) {
                	if (StringUtils.endsWith(files[i].name.toLowerCase(), checkAry[j])) {
                		isValid = true;
                		break;
                	}
                }

                if (!isValid) {
    	            alert("アップロードできないファイルが含まれています。(jpeg,jpg,pngのみ可)");
            		popup.closeCover();
                	return;
                }
            }

    		if (confirm("ファイルをアップロードします。よろしいですか？\n" + files[0].name)) {
        		//popup.showText("<div><img src='/image/spinner.gif'/>ファイルアップロード中</div>");
        		popup.showText("<table><tr><td><img src='./image/spinner.gif'></img></td><td><span style='font-size:14px''>ファイルアップロード中...</span></td></tr></table>");

        		this_obj.do_drop_file(e);
    		} else {
        		popup.closeCover();
    		}

        },false);


        // default event & bubblingを中止
        $("#" + elm_id)
            .bind('dragenter',
                  function(e){

	        		if (!e.dataTransfer) {
	                	return;
	                }
            		e.preventDefault();
            		e.stopPropagation();
                  }
            )
            .bind('dragleave',
                    function(e){

            		popup.closeCover();
              		e.preventDefault();
              		e.stopPropagation();
              	}
              )
            .bind('dragover',
                  function(e){
	                if (!e.dataTransfer) {
	                	return;
	                }

            		e.preventDefault();
            		e.stopPropagation();
            	}
            );

        $("html")
            .bind('drop',
                  function(e){
            	e.preventDefault();
            	e.stopPropagation();
            	}
            )
            .bind('dragenter',
                  function(e){

            	    popup.showCover();

            		e.preventDefault();
            		e.stopPropagation();
            	}
            )
            .bind('dragleave',
                  function(e){

            		e.preventDefault();
            		e.stopPropagation();
            	}
            )
            .bind('dragover',
                  function(e){
            		e.preventDefault();
            		e.stopPropagation();
            	}
            );
    };

    // fileがdropされると、呼ばれます
    this.do_drop_file = function(e){
        var files = e.dataTransfer.files;

            for (var i=0; i<files.length; i++){
            if (files[i].size ==0) continue;

            var reader = new FileReader();

            reader.onloadend = function(e) {
                LOADED_FILES.push(e.target.result);

                var fileBase64 = e.target.result;

                var data = new Object();
                data.file = fileBase64;
                data.name =  StringUtils.encodeFileName(e.target.filename);

                var data = $.extend(param, data);

                var this_obj = this;
                $.post(UPLOAD_URL,
                       $.param(data,true),
                       function(data){

                	var myObj = _canvasParams["wbCanvas"];

        			var msg = new MessageParam("echo", "uploadFiles", "sid", param.wbId, param.page, param.userId);
        			WebSocketUtils.sendJson(myObj.socket, msg);

            		popup.closeText();
            		popup.closeCover();

            		//            		_reqParam = new SocketRequest();
//            		_reqParam.header.path = "office";
//            		_reqParam.header.method = "updateFiles";
//
//            		var obj = new Object();
//
//            		_reqParam.content = obj;
//
//            		var jsonText = RequestUtils.createRequestText(_reqParam);
//            		_jssocket.send(jsonText);
                           }
                      );

            };

            reader.filename = files[i].name;
            reader.readAsDataURL(files[i]);  // base 64でload

        }
    };

    // 初期化実行
    this.init(elm_id);
};
