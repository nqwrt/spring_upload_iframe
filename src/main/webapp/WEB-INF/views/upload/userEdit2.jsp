<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<!-- Dropzone [ OPTIONAL ]	 -->
	<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>
	
	<% 
	    String path = request.getContextPath();
   		pageContext.setAttribute("path", path);
	%>
</head>

<body>
<!--TIPS-->
   <!--You may remove all ID or Class names which contain "demo-", they are only used for demonstration. -->
   <div id="container" class="effect aside-float aside-bright mainnav-lg">

      <!-- HEADER-NAVBAR -->
     <%--  <%@ include file="../includes/header-navbar.jsp"%> --%>
      <!-- END NAVBAR -->

      <!-- BOXED -->
      <div class="boxed">

         <!-- MAIN-NAV -->
       <%--   <%@ include file="../includes/main-nav.jsp"%> --%>
         <!-- END MAIN-NAV -->

         <!-- ASIDE -->
         <%-- <%@ include file="includes/aside.jsp" %> --%>
         <!-- END ASIDE -->
         



         <!--CONTENT CONTAINER-->
         <!--===================================================-->
         <div id="content-container">

            <!--Page Title-->
            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
            <div id="page-title">
               <h1 class="page-header text-overflow">마이페이지</h1>
            </div>
            <!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
            <!--End page title-->

            <!--Page content-->
            <!--===================================================-->
            <div id="page-content">
                  <div class="row">
                   <div class="col-lg-6">
                       <div class="panel">
                           <div class="panel-heading">
                               <h3 class="panel-title">회원정보수정</h3>
                           </div>
                           <!-- BASIC FORM ELEMENTS -->
                           <!--===================================================-->
                           <form class="panel-body form-horizontal form-padding dropzone" enctype="multipart/form-data" action="${path}/mypage/edit" method="post"  id="userForm">
                            <!--  사진 -->
                           <div class="form-group">
                              <label class="col-md-3 control-label">사진</label>
                              <div class="col-md-9">
                                 <!--Dropzonejs using Bootstrap theme-->
                                 <!--===================================================-->
                                 <p style="text-align: left; margin-bottom: 0; padding: 6px 12px;">프로필에 쓰일 사진을 선택해주세요.</p>
                                 
                                 <div class="bord-top pad-ver"
                                    style="border-top: none; text-align: left; padding: 6px 12px;">
                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                    <span class="btn btn-success fileinput-button dz-clickable">
                                       <i class="fa fa-plus"></i> <span>사진선택</span>
                                    </span>
                                 </div>
                                 <div id="dz-previews"
                                    style="border-top: none; text-align: left; padding: 6px 12px;">
                                    <div id="dz-template" class="pad-top bord-top">
                                       <div class="media">
                                          <div class="media-body">
                                             <!--This is used as the file preview template-->
                                             <div class="media-block">
                                                <div class="media-left">
                                                   <img class="dz-img" data-dz-thumbnail>
                                                </div>
                                                <div class="media-body">
                                                   <p class="text-main text-bold mar-no text-overflow"
                                                      data-dz-name></p>
                                                   <span class="dz-error text-danger text-sm"
                                                      data-dz-errormessage></span>
                                                   <p class="text-sm" data-dz-size></p>
                                                   <div id="dz-total-progress" style="opacity: 0">
                                                      <div class="progress progress-xs active"
                                                         role="progressbar" aria-valuemin="0"
                                                         aria-valuemax="100" aria-valuenow="0">
                                                         <div class="progress-bar progress-bar-success"
                                                            style="width: 0%;" data-dz-uploadprogress></div>
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="media-right">
                                             <button data-dz-remove
                                                class="btn btn-xs btn-danger dz-cancel">
                                                <i class="demo-pli-cross"></i>
                                             </button>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <!--===================================================-->
                                 <!--End Dropzonejs using Bootstrap theme-->
                              </div>
                           </div>

                           <!--닉네임-->
                               <div class="form-group">
                                   <label class="col-md-3 control-label">닉네임</label>
                                   <div class="col-md-9">
                                      <input type="text" id="memNickname" name="memNickname" class="form-control" >
                                   </div>
                               </div>
                               
                               <!--Email Input-->
                               <div class="form-group">
                                   <label class="col-md-3 control-label" for="demo-email-input">이메일</label>
                                   <div class="col-md-9">
                                       <input type="email" id="memEmail" name="memEmail" class="form-control" readOnly>
                                   </div>
                               </div>
               
                               <!-- 현재 비밀번호 -->
                               <div class="form-group">
                                   <label class="col-md-3 control-label" for="demo-text-input">기존 비밀번호</label>
                                   <div class="col-md-9">
                                       <input type="password" id="memPassword" class="form-control" placeholder="Text" >
                                       <small class="help-block"></small>
                                   </div>
                               </div>
                               
                                <!-- 신규 비밀번호 -->
                               <div class="form-group">
                                   <label class="col-md-3 control-label" for="demo-text-input">신규비밀 번호</label>
                                   <div class="col-md-9">
                                       <input type="password" id="newPassword" class="form-control" placeholder="Text" >
                                   </div>
                               </div>
                               
                                <!-- 신규 비밀번호 확인 -->
                               <div class="form-group">
                                   <label class="col-md-3 control-label" for="demo-text-input">비밀번호 다시 입력확인</label>
                                   <div class="col-md-9">
                                       <input type="password" id="newPasswordCheck" class="form-control" placeholder="Text" >
                                       <small id="passMsg" class="help-block">This is a help text</small>
                                       <button class="btn btn-success" type="button" onclick="changePassword();">비밀번호 변경</button>
                                   </div>
                               </div>
               
                               <!--생일-->
                               <div class="form-group">
                                   <label class="col-md-3 control-label" for="demo-readonly-input">생일</label>
                                   <div class="col-md-9">
                                       <input type="text" id="memBirthday" name="memBirthday" class="form-control" placeholder="숫자 8자리 YYYYMMDD ex)19910215"  >
                                   </div>
                               </div>
                           
                               <!-- 성별 -->
                               <div class="form-group pad-ver">
                                   <label class="col-md-3 control-label">성별</label>
                                   <div class="col-md-9">
                                       <div>
                                           <input class="magic-radio" type="radio" name="memGender" value="M" id="mem">
                                           <label for="mem">남성</label>
                                       </div>
                                       <div>
                                           <input class="magic-radio" type="radio" name="memGender" value="W" id="women">
                                           <label for="women">여성</label>
                                       </div>
                                   </div>
                               </div>
                           
                           <!-- 지역 -->
                               <div class="form-group">
                                   <label class="col-md-3 control-label" for="demo-password-input">관심지역</label>
                                   <div class="col-md-9">
                                       <input type="text" id="memArea" name="memArea" class="form-control" >
                                   </div>
                               </div>
                               
                               <!-- 관심사1 -->
                               <div class="form-group pad-ver" >
                                   <label class="col-md-3 control-label">관심사1</label>
                                   <div class="col-md-9">
                                      <div class="radio interest" id="interest1">
                                          
                                       </div>
                                   </div> 
                               </div>
                               
                               <!-- 관심사2 -->
                               <div class="form-group pad-ver">
                                   <label class="col-md-3 control-label">관심사2</label>
                                   <div class="col-md-9">
                                       <div class="radio interest" id="interest2">
                                           
                                       </div>
                                   </div> 
                               </div>
                           
                           <!-- 관심사3 -->
                               <div class="form-group pad-ver">
                                   <label class="col-md-3 control-label">관심사3</label>
                                   <div class="col-md-9">
                                       <div class="radio interest" id="interest3">
                                         
                                       </div>
                                   </div>
                               </div>
                               
                              <div class="panel-footer text-right">
                                      <button class="btn btn-success" id="btnUpload" type="button" >수정완료</button>
                              </div>
                           </form>
                           <!--===================================================-->
                           <!-- END BASIC FORM ELEMENTS -->            
               
                       </div>
                   </div>
            </div>
            <!--===================================================-->
            <!--End page content-->


         </div>
         <!--===================================================-->
         <!--END CONTENT CONTAINER-->
         <button id="btn_upload" type="button" >클릭 </button>


      </div>
      <!-- END BOXED -->

      <!-- FOOTER -->
      <%-- <%@ include file="../includes/footer.jsp"%> --%>
      <!-- END FOOTER -->

   </div>
   <!-- END CONTAINER -->
</div>

</body>

<script type="text/javascript">

$(document).ready(function() {

	Dropzone.autoDiscover = false;
	var previewNode = document.querySelector("#dz-template");
	previewNode.id = "";
	
	var previewTemplate = previewNode.parentNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);
	
	var uplodaBtn = $('#dz-upload-btn'); //TODO : 필요없음
	var removeBtn = $('#dz-remove-btn'); //TODO : 필요없음
	var myDropzone = new Dropzone("#userForm", { // Make the whole body a dropzone
		  //url: "/mypage/edit", // Set the url
		  thumbnailWidth: 80,
		  thumbnailHeight: 80,
		  parallelUploads: 20,
		  previewTemplate: previewTemplate,
		  autoQueue: false, // Make sure the files aren't queued until manually added
		  previewsContainer: "#dz-previews", // Define the container to display the previews
		  clickable: ".fileinput-button", // Define the element that should be used as click trigger to select files.
	});
});	


function checkAndsubmit()
{
	   // 정규식(길이,패턴) 체크 ~ 이것도 나중에
	   // 1) 생일 유효성 체크(길이, 숫자만)
	   
	   // 전송
	   if (confirm("회원정보를 수정하시겠습니까?")) 
	   {   
		   $('#userForm').submit(); 
	   }   
	   
}

</script>
</html>