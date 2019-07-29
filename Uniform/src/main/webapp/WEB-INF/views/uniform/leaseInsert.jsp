<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 2019/7/25일
		작성자 : 임태양
		임대작업실 등록 화면  -->
    <style>
        #comforts label{
            margin: 10px 3px 10px 3px;
        }
        
        #comforts {
            margin-left: 15px;
        }
        
        	#imgRes{
        		background-image : url("/resources/images/work-1.jpg");
        		background-repeat:no-repeat;
    		background-size:cover;
        	}
        
    </style>
<%@include file="../includes/header.jsp"%>

<script>
var oauth2LoginUser = '	<sec:authentication property="principal.member.mno"/>';
if(oauth2LoginUser == 0){
	location.href="/addInfo";
}
</script>

<!-- 검증 -->
<section class="ftco-section ftco-bread ftco-extend-mb">
                <div class="container-fluid px-3 px-md-0">
                    <div class="row no-gutters slider-text justify-content-end align-items-center">
                        <div class="col-md-10 ftco-animate">
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html"><sec:authentication property="principal.member.mno"/></a></span> <span>Collection</span></p>
                            <h1 class="bread">임대 작업실 등록</h1>
                            <div style="width: 100%; height: 1100px; margin-top: 50px;" id="totalDiv">
                                <div class="row" id="divRows">
                                    <div class="col-sm-6" id="section1">
                                        <label for="leaseTitle">
                                            <b>제목</b>
                                            <div style="width: 100%; height: 1.5px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        <input type="text" class="form-control form-group" id="leaseTitle" name="leaseTitle" style="display: inline; margin-left: 15px;"><label for="leaseLocation"><b>위치</b>
                                            <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        <input type="text" class="form-control form-group" name="leaseLocation" id="leaseLocation" style="display: inline; margin-left: 15px;">

                                        <label><b>편의시설</b>
                                        <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        
                                        <div style="width: 100%; height: 100px;" id="comforts">
                                            <input type="checkbox" value="WIFI" id="wifi" name="wifi"><label for="wifi">WIFI</label>
                                            <input type="checkbox" value="convi" id="convi" name="convi"><label for="convi">편의점</label>
                                            <input type="checkbox" value="sauna" id="sauna" name="sauna"><label for="sauna">사우나</label>
                                            <input type="checkbox" value="restroom" id="restroom" name="restroom"><label for="restroom">화장실</label>
                                            <br>
                                            <input type="checkbox" value="aircon" name="aircon" id="aircon"><label for="aircon">에어컨</label>
                                            <input type="checkbox" value="refrigerator" name="refrigerator" id="refrigerator"><label for="refrigerator">냉장고</label>
                                            <input type="checkbox" value="fan" name="fan" id="fan"><label for="refrigerator">선풍기</label>
                                            <input type="checkbox" value="airclean" name="airclean" id="airclean"><label for="airclean">공기청정기</label>
                                        </div>

<!--
                                        <label><b>예약가능 날짜</b>
                                            <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        <input type="date" class="form-control form-group" name="leaseRes" style="display: inline; margin-left: 15px;">
-->

                                        <label><b>가격</b>
                                            <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        <input type="text" class="form-control form-group" name="leasePrice" style="display: inline; margin-left: 15px;">
                                         <label><b>상세설명</b>
                                            <div style="width: 100%; height: 2px; background-color: black; position: relative; top: -5px;"></div>
                                        </label>
                                        <textarea name="" id="" cols="50" rows="10" style="width: 100%; margin-left: 15px;"></textarea>
                                        <input type="file" multiple style="margin-left: 15px; margin-top: 10px;">
                                    </div>
                                    <div class="col-sm-6" style="margin-top: 20px;" id="section2">
                                        <div style="width: 100%; height: 300px;" id="imgRes">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
 				<input type="button" class="btn btn-primary float-right" value="등록">
            </section>
            
            <script>
            	$(function(){
            		var section2 = $("#section2").clone();
            		var width = $(this).width();
            		console.log(width);
            		if(width < 400){
            			$("#section2").remove();
            			$("#divRows").prepend(section2);
            			$("#totalDiv").css("height","1100");
            		}else{
            			$("#section2").remove();
            			$("#divRows").append(section2);
            			$("#totalDiv").css("height","800");
            		}
            		
            		$(window).on("resize",function(){
            			var widths = $(this).width();
            			if(widths < 400){
            				$("#section2").remove();
                			$("#divRows").prepend(section2);
                			$("#totalDiv").css("height","1100");
            			}else{
            				$("#section2").remove();
                			$("#divRows").append(section2);
                			$("#totalDiv").css("height","800");
            			}
            		});
            	});
            </script>

<%@include file="../includes/footer.jsp"%>