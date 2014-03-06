<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FileUpload.aspx.cs" Inherits="FileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">



    <style type="text/css">
        @import url(js/lib/upload/jquery.ui.plupload/css/jquery.ui.plupload.css);
    </style>
    <script type="text/javascript" src="./js/lib/jquery-1.11.0.js"></script>

    <script type="text/javascript" src="js/lib/upload/moxie.js"></script>

    <script type="text/javascript" src="js/lib/upload/plupload.dev.js"></script>


    <script type="text/javascript" src="js/lib/upload/jquery.ui.plupload/jquery.ui.plupload.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body style="font: 13px Verdana; background: #eee; color: #333">


    <form>
        <div id="uploader">
            <p>You browser doesn't have Flash, Silverlight, Gears, BrowserPlus or HTML5 support.</p>
        </div>
    </form>


    <h1>Custom example</h1>

    <p>Shows you how to use the core plupload API.</p>

    <div id="filelist">Your browser doesn't have Flash, Silverlight or HTML5 support.</div>
    <br />

    <div id="container">
        <a id="pickfiles" href="javascript:;">[Select files]</a>
        <a id="uploadfiles" href="javascript:;">[Upload files]</a>
    </div>


    <br />
    <pre id="console"></pre>


    <script type="text/javascript">

        $(function () {
            $("#uploader").plupload({
                // General settings
                runtimes: 'gears,flash,html5',
                max_file_size: '10mb', // 最大ファイルサイズ
                chunk_size: '1mb',   // ファイル分割
                unique_names: true,  // ユニーク名

                // Resize images on clientside if we can
                resize: { width: 320, height: 240, quality: 90 },

                // Specify what files to browse for
                filters: [
                  { title: "Image files", extensions: "jpg,gif,png" },
                  { title: "Zip files", extensions: "zip" }
                ],

                url: 'Upload.ashx',
                flash_swf_url: 'js/lib/upload/Moxie.swf',
                silverlight_xap_url: 'js/lib/upload/Moxie.xap',
            });

            // Client side form validation
            $('form').submit(function (e) {
                var uploader = $('#uploader').plupload('getUploader');

                // Files in queue upload them first
                if (uploader.files.length > 0) {
                    // When all files are uploaded submit form
                    uploader.bind('StateChanged', function () {
                        if (uploader.files.length === (uploader.total.uploaded + uploader.total.failed)) {
                            $('form')[0].submit();
                        }
                    });
                    uploader.start();
                } else
                    alert('You must at least upload one file.');
                return false;
            });
        });



        // Custom example logic

        var uploader = new plupload.Uploader({
            runtimes: 'html5,flash,silverlight,html4',
            browse_button: 'pickfiles', // you can pass in id...
            container: document.getElementById('container'), // ... or DOM Element itself
            url: 'Upload.ashx',
            flash_swf_url: 'js/lib/upload/Moxie.swf',
            silverlight_xap_url: 'js/lib/upload/Moxie.xap',

            filters: {
                max_file_size: '10mb',
                mime_types: [
                    { title: "Documents", extensions: "pdf,xls,xlsx,doc,docx" },
                    { title: "Image files", extensions: "jpg,gif,png" },
                    { title: "Zip files", extensions: "zip" }
                ]
            },

            init: {
                PostInit: function () {
                    document.getElementById('filelist').innerHTML = '';

                    document.getElementById('uploadfiles').onclick = function () {
                        uploader.start();
                        return false;
                    };
                },

                FilesAdded: function (up, files) {
                    plupload.each(files, function (file) {
                        document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
                    });
                },

                UploadProgress: function (up, file) {
                    document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
                },

                Error: function (up, err) {
                    document.getElementById('console').innerHTML += "\nError #" + err.code + ": " + err.message;
                }
            }
        });

        uploader.init();

</script>
</body>

</html>
