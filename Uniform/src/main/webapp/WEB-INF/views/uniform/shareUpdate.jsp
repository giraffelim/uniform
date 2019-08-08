<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/workplaceI.css">

<!-- 2019/8/5일
		작성자 : 임태양
		공유 작업실 수정 화면  -->
<%@include file="../includes/header.jsp"%>

<script>
var oauth2LoginUser = '	<sec:authentication property="principal.member.mno"/>';
if(oauth2LoginUser == 0){
	location.href="/addInfo";
}
</script>

<!-- 검증 -->
<section class="ftco-section ftco-bread ftco-extend-mb" id="leaseSection">
                <div class="container-fluid px-3 px-md-0">
                    <div class="row no-gutters slider-text justify-content-end align-items-center">
                        <div class="col-md-10 ftco-animate">
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html"><sec:authentication property="principal.member.mno"/></a></span> <span>Collection</span></p>
                            <h1 class="bread">공유 작업실 등록</h1>
                            <div style="width: 100%; margin-top: 50px;" id="totalDiv">
                               <div class="row" id="divRows">
                                    <div class="col-sm-6" id="section1">
                                     <form action="/uniform/updateWorkplaceS" method="post">
                                    <input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" />
									<input type="hidden" name="mno" value="<sec:authentication property='principal.member.mno'/>">
									<input type="hidden" name="sno" value="${vo.sno }">
									
                                    
                                        <label for="leaseTitle">
                                            <b>제목</b>
                                            <div style="width: 100%; height: 1.5px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        <input type="text" class="form-control form-group" id="leaseTitle" name="title" style="display: inline; margin-left: 15px;" value="${vo.title }"><label for="leaseLocation">
                                        <b>위치</b>
                                        <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
    									<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
                                        <input type="text" class="form-control form-group" name="location" id="leaseLocation" style="display: inline; margin-left: 15px;" value="${vo.location }">
                                        <label><b>편의시설</b>
                                        <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        	   <div style="width: 100%; height: 100px; margin-left:20px;" id="comforts">	
                                            <input type="checkbox" value="WIFI" id="wifi" name="comforts"><label for="wifi" class="labelMargin">WIFI</label>
                                            <input type="checkbox" value="앰프" id="amp" name="comforts"><label for="amp" class="labelMargin">앰프</label>
                                            <input type="checkbox" value="마이크" id="mike" name="comforts"><label for="mike" class="labelMargin">마이크</label>
                                            <input type="checkbox" value="화장실" id="restroom" name="comforts"><label for="restroom" class="labelMargin">화장실</label>
                                        	
                                            <br>
                                             <input type="checkbox" value="에어컨" name="comforts" id="aircon"><label for="aircon" class="labelMargin">에어컨</label>
                                            <input type="checkbox" value="냉장고" name="comforts" id="refrigerator"><label for="refrigerator" class="labelMargin">냉장고</label>
                                            <input type="checkbox" value="선풍기" name="comforts" id="fan"><label for="fan" class="labelMargin">선풍기</label>
                                            <input type="checkbox" value="공기청정기" name="comforts" id="airclean"><label for="airclean" class="labelMargin">공기청정기</label>

                                        </div>

                                        <label><b>예약가능 날짜</b>
                                            <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        	<div class="row">
                                        	<div class="col-sm-12">
                                        		<input type="date" class="form-control form-group" name="myDate" style="display: inline; margin-left: 15px; width:45%" value=""> ~
                                        		 <input type="date" class="form-control form-group" name="myDate" style="display: inline; width:45%">
                                        	</div>
										</div>
										<label><b>내가 사용할 시간</b>
                                            <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
										<div class="row">
										<div class="col-sm-6">
											 <input type="text" class="form-control form-group" name="myTime" style="display: inline; margin-left: 15px;" id="timeSelect" placeholder="ex) 9:00 ~ 18:00" value="${vo.myTime }">
										</div>
										</div>
                                        <label><b>가격</b>
                                            <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        	<div class="row">
										<div class="col-sm-12">
											        <input type="text" class="form-control form-group" name="price" style="display: inline; margin-left: 15px; width : 40%" id="leasePrice" placeholder="가격" value="${vo.price }"> 원 
											        <input type="text" class="form-control form-group" name="pCount" style="display: inline; margin-left:10px; width : 40%" id="leasePrice" placeholder="인원" value="${vo.PCount }"> 명 
										</div>
										</div>
                                         <label><b>상세설명</b>
                                            <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                         <textarea name="context" id="" cols="50" rows="10" style="width: 100%; margin-left: 15px;" id="leaseContext">${vo.context }</textarea>
                                        </form>
                                        	<div id="thumbnailDiv" style="margin-top:10px;">
                                        	<b>썸네일 이미지</b>
                                        <input type="file" style="margin-left: 15px; margin-top: 10px;" id="thumbnail">
                                        </div>
                                        	<div id="workplaceImgs" style="margin-top:10px;">
                                        	<b>작업실 이미지</b>
                                        <input type="file" style="margin-left: 15px; margin-top: 10px;" id="workplaceImg" multiple>
                                        </div>
                                        	<div class="uploadResult">
                                        	<ul>
                                        	       	<c:forEach items="${vo.attachList }" var="attach">
                                        	<li data-path="${attach.path }" data-uuid="${attach.uuid }" data-filename="${attach.fileName }"><div>
											<span style='color:white;'>${attach.fileName }</span>
											<button type='button' data-file="${attach.path }/Is_${attach.uuid}_${attach.fileName}" class='btn btn-warning btn-circle'>&times;</button><br>
											<img src="/display?fileName=${attach.path }/Is_${attach.uuid}_${attach.fileName}"  class="displayAttach">
										</div>
										</li>			
										</c:forEach>		
                                        	</ul>
                                        	</div>
                                    </div>
                                                                        <div class="col-sm-6" style="margin-top: 20px; height:500px;" id="section2">
                                    
                                        <div style="width: 100%; height: 300px;" id="imgRes">
                                                                                		<img src="/resources/images/no-img.png" id="thumbnailImg"  id="thumbnailg">
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
 				<input type="submit" class="btn btn-primary float-right" value="등록">
            </section>
            
                       
            <script>
            function execPostCode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                       // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                       var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                       var extraRoadAddr = ''; // 도로명 조합형 주소 변수
        
                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraRoadAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraRoadAddr !== ''){
                           extraRoadAddr = ' (' + extraRoadAddr + ')';
                       }
                       // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                       if(fullRoadAddr !== ''){
                           fullRoadAddr += extraRoadAddr;
                       }
        
                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
                       console.log(data.zonecode);
                       console.log(fullRoadAddr);
                       
                       $("#leaseLocation").val(fullRoadAddr);
                       
                       /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                       document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                       document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
                   }
                }).open();
            }


            	$(function(){
            		var section2 = $("#section2").clone();
            		var width = $(this).width();
            		console.log(width);
            		if(width < 400){
            			$("#section2").remove();
            			$("#divRows").prepend(section2);
            		}else{
            			$("#section2").remove();
            			$("#divRows").append(section2);
            			$("#thumbnailImg").attr({
            				width : "450px",
            				height : "450px"
            			});
            			$("#leaseSection").css("margin-left","100px");
            			$("#imgRes").css("margin-left","30px");
            		}
            		
            		$(window).on("resize",function(){
            			var widths = $(this).width();
            			if(widths < 400){
            				$("#section2").remove();
                			$("#divRows").prepend(section2);
                			$("#thumbnailImg").attr({
                				width : "200px",
                				height : "200px"
                			});
                			$("#leaseSection").css("margin-left","0px");

            			}else{
            				$("#section2").remove();
                			$("#divRows").append(section2);
                			$("#thumbnailImg").attr({
                				width : "450px",
                				height : "450px"
                			});
                			$("#leaseSection").css("margin-left","100px");
            			}
            		});
            		// 파일의 확장자 검사
            		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            		var maxSize = 5242880;
            		
            		function checkExtension(fileName, fileSize){
            			if(fileSize >= maxSize){
            				alert("파일 사이즈 초과");
            				return false;
            			}
            			if(regex.test(fileName)){
            				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
            				return false;
            			}
            			return true;
            		}
            		var uploadResult = $(".uploadResult ul");
            		
            		$("input[type='file']").on("change",function(){
            			// input file에 변화가 있을 때 서버로 request
            			console.log("HH");
            			var formData = new FormData();
            			var inputFile = $(this);
            			var where = $(this).attr("id");
            		 	var files = inputFile[0].files;
            			var csrfHeaderName = "${_csrf.headerName }";
						var csrfTokenValue = "${_csrf.token }";
						for(var i=0; i<files.length; i++){
	            			if(!checkExtension(files[i].name, files[i].size)){
	            				return false;
	            			}
	            			
	            			formData.append("uploadFile",files[i]);
            			}
            			if(where == 'thumbnail'){
            				$.ajax({
                				url : "/uploadLeaseThumbnail",
                				beforeSend : function(xhr){
    								xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    							},
                				processData : false,
                				contentType : false,
                				data : formData,
                				type : "post",
                				success : function(result){
                						var fileCallPath = encodeURIComponent(result[0].uploadPath+"/Is_"+result[0].uuid+"_"+result[0].fileName);
                						$("#thumbnailImg").attr("src","/display?fileName="+fileCallPath);
                				}
                			});
            			}else{
	            			$.ajax({
	            				url : "/uploadLeaseThumbnail",
	            				beforeSend : function(xhr){
									xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
								},
	            				processData : false,
	            				contentType : false,
	            				data : formData,
	            				type : "post",
	            				success : function(result){
	            						var str = "";
	            						$(result).each(function(i,obj){
	            							var fileCallPath = encodeURIComponent(obj.uploadPath+"/Is_"+obj.uuid+"_"+obj.fileName);
	            				               str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'><div>";
	            				               str += "<span style='color:white;'>"+obj.fileName+"</span>";
	            				               str += "<button type='button' data-file=\'"+fileCallPath+"\' class='btn btn-warning btn-circle'>&times;</button><br>";
	            				               str += "<img src = '/display?fileName="+fileCallPath+"'>";
	            				               str += "</div>";
	            				               str += "</li>";
	            						});
	            						uploadResult.append(str);
	            				}
	            			});
            			}
            		});
            		var formObj = $("form");
            		
            		$("input[type='submit']").on("click",function(e){
            			
            			e.preventDefault();
            			if($("#leaseTitle").val().length == 0){
            				alert("제목은 필수 입력 사항입니다.");
            				$("#leaseTitle").focus();
            				return false;
            			}
            			if($("#leaseLocation").val().length == 0){
            				alert("위치는 필수 입력 사항입니다.");
            				$("#leaseLocation").focus();
            				return false;
            			}
            			
            			if($("#leasePrice").val().length == 0){
            				alert("가격은 필수 입력 사항입니다.");
            				$("#leasePrice").focus();
            				return false;
            			}
            			
            			var leasePrices = $("#leasePrice").val();
            			if(isNaN(leasePrices) == true) {
            				alert("가격은 숫자를 입력하셔야 합니다.");
            				$("#leasePrice").focus();
            				return false;
            			}

            			var str = "";
            			
            			var thumbnail = $("#thumbnailImg").attr("src").substring(18);
            			
            			str += "<input type='hidden' name='thumbnail' value='"+decodeURIComponent(thumbnail)+"'>";
            			
            			$(".uploadResult ul li").each(function(i, obj){
            				var jobj = $(obj);
            				console.log(jobj);
            				str += "<input type = 'hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
            				str += "<input type = 'hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
            				str += "<input type = 'hidden' name='attachList["+i+"].path' value='"+jobj.data("path")+"'>";
            			});
            			formObj.append(str).submit();
            		});
            		
            		// checkbox
            		var comforts = '${vo.comforts}';
            		var checkList = comforts.split(",");
            		var comfortsList = ['wifi' , 'amp' , 'mike','restroom','aircon','refrigerator','fan','airclean'];
            		var ajaxComforts = ['WIFI','앰프','마이크','화장실','에어컨','냉장고','선풍기','공기청정기'];
            		$(checkList).each(function(i, o){
            			for(var i=0; i<comfortsList.length; i++){
            				if(o == ajaxComforts[i]){
            					o = comfortsList[i];
            					break;
            				}
            			}
            			$("#"+o).attr("checked",true);
            		});
            		
            		//date
            		var myDates = "${vo.myDate}";
            		var myDate = $("input[name='myDate']");
            		var splitDates = myDates.split(",");
            		$(splitDates).each(function(i, obj){
            			obj = obj.replace("/","-");
            			$(myDate[i]).val(obj);
            		});
            		
            		// 썸네일 이미지 띄우기 [업데이트]
            		var isThumbnail = '${vo.thumbnail}';
            		if(isThumbnail != ""){
            			var fileCallPath = encodeURIComponent(isThumbnail);
            			$("#thumbnailImg").attr("src","/display?fileName="+fileCallPath);
            		}
            		
            		// 삭제 이벤트 처리 
            		$(".uploadResult").on("click","button",function(e){
            			var targetLi = $(this).closest("li");
            			var csrfHeaderName = "${_csrf.headerName }";
						var csrfTokenValue = "${_csrf.token }";
            			targetLi.remove();
            		});
            		
            		// 첨부파일 리스트
            		
            	});
            </script>


<%@include file="../includes/footer.jsp"%>