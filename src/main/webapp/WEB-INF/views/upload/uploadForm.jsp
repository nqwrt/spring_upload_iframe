<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<% String path = request.getContextPath();
	   pageContext.setAttribute("path", path);
	%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
	<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

<!-- 	<form id="dropzone-form" class="dropzone" enctype="multipart/form-data">
	
		<div class="dz-default dz-message file-dropzone text-center well col-sm-12">
		    <span class="glyphicon glyphicon-paperclip"></span> 
		    <span>To attach files, drag and drop here</span><br>
		     <span>OR</span><br>
		     <span>Just Click</span>
		     </div>
		
		     this is were the previews should be shown.
		     <div class="dropzone-previews"></div>
		                                       <hr>
                                  <button id="upload-button" class="btn btn-primary">
                                         <span class="glyphicon glyphicon-upload"></span> Upload
                                  </button>
                                  <a class="btn btn-primary pull-right" href="list"> <span
                                         class="glyphicon glyphicon-eye-open"></span> View All Uploads
                                  </a>
	</form> -->
	
	<!-- Change /upload-target to your upload address -->
<%-- 	<form action="${path}/upload/uploadForm" class="dropzone">
	</form>
 --%>
 
<!-- 	<form name="fname">
		<label for="fld">필드</label>
		<input type="text" name="fld" id="fld" value="">
		<div class="dropzone" id="fileDropzone"></div>
	</form> -->

	<form action="${path}/upload/uploadForm" class="dropzone" id="my-awesome-dropzone" enctype="multipart/form-data">
	   <!--   <div class="fallback">
	         <input name="file" type="file" />
	     </div> -->
	     <input type="text" name="name">
	</form>
	
	<button type="button" id="btn_upload">Upload</button>
</body>

<script type="text/javascript">

$(document).ready(function() {
	
	Dropzone.options.myAwesomeDropzone = {
			
		    autoProcessQueue: false,

		    init: function (e) {

		        var myDropzone = this;

		        $('#btn_upload').on("click", function() {
		            myDropzone.processQueue(); // Tell Dropzone to process all queued files.
		        });

		        // Event to send your custom data to your server
		        myDropzone.on("sending", function(file, xhr, data) {

		            // First param is the variable name used server side
		            // Second param is the value, you can add what you what
		            // Here I added an input value
		            data.append("your_variable", $('#your_input').val());
		        });

		    }
		};

});
</script>


</html>