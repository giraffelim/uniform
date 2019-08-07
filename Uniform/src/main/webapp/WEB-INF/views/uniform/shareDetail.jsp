<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ include file="../includes/header.jsp"%>
<!--  로그인 했을 경우만  -->
 <sec:authorize access="isAuthenticated()">
 	<sec:authentication property="principal" var="pinfo"/>
 </sec:authorize>

<!--폰트어썸---------------------------------------------------------------------------->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<!--폰트어썸-->
<!--풀캘린더----------------------------------------------------------->
<link href="/resources/fullcalendar/fullcalendar.css" rel="stylesheet" />
<link href="/resources/fullcalendar/fullcalendar.print.css" rel='stylesheet' media="print" />
<script src="/resources/fullcalendar/lib/moment.min.js"></script>
<script src="/resources/fullcalendar/fullcalendar.js"></script>
<!--풀캘린더----------------------------------------------------------->

<link rel="stylesheet" href="/resources/css/style_ino.css">


<!--지도 api-->
<script type="text/javascript"
src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78b4abe6de9ef13e1faed34fe08afb6d&libraries=services"></script>


    <style>
        #whole {
            padding-top: 10px;
        }

        .row {
            margin-bottom:
        }

        .inobox {
            height: 38em;
            border: 1px solid black;
            box-sizing: border-box;
        }

        .inobox1 {
            height: 19em;
            border: 1px solid black;
            box-sizing: border-box;
        }

        .inobox2 {
            height: 19em;
            border: 1px solid black;
            box-sizing: border-box;
        }

        .reservation1 {
            width: 350px;
            height: 400px;
            border: 1px solid red;
            margin-top: 10px;
            top: 0px;
            display: block;
            position: relative;
        }

        #heart {
            color: red;
        }

        #inoplus {
            margin-top: 15px;
            cursor: pointer;
        }

        #inoMinus {
            margin-top: 15px;
            cursor: pointer;
        }

        #inoplus2 {
            margin-top: 15px;
            cursor: pointer;
        }

        #inoMinus2 {
            margin-top: 15px;
            cursor: pointer;
        }

        .selectBox {
            margin-bottom: 15px;
        }

        .selectBox2 {
            margin-bottom: 10px;
        }

        #iBtn {
            position: absolute;
            bottom: 15px;
            padding-left: 5.5em;
        }

        .userPhotoD {
            margin-top: 0px;
            width: 70px;
            height: 70px;
            border-radius: 50%;
        }

        .userPhotoS {
            margin-top: 10px;
            width: 70px;
            height: 70px;
            border-radius: 50%;
        }

        .hrLine {
            border-bottom: 1px solid lightcoral;
        }

        .comforts {
            font-size: 25px;
        }

        .comforts li,
        p {
            font-size: 15px;
            color: black;
            list-style: none;
        }

        #maps {
            width: 500px;
            height: 500px;

        }

        #inoPhotoNum1{
            position: relative;
        }
       .num1{
            /*background-image: url(/img/.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;*/
            /*overflow: hidden;*/
           width: 100%; 
           height: 100%;
           display: block;           
           position:absolute;
           top:0;
           left:0;

        }

        #inoPhotoNum2 {
            /*background-image: url(/img/2.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;*/
            overflow: hidden;
        }

        #inoPhotoNum3 {
            /*background-image: url(/img/3.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;*/
            overflow: hidden;
        }

        #inoPhotoNum4 {
            /*background-image: url(/img/4.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;*/
            overflow: hidden;
        }

        #inoPhotoNum5 {
            /*background-image: url(/img/5.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;*/
            overflow: hidden;
        }

        #inoplus {
            animation-name: ani;
            animation-duration: 1.2s;
            animation-iteration-count: infinite;
            animation-delay: 0s;
        }

        #inoMinus {
            animation-name: ani;
            animation-duration: 1.5s;
            animation-iteration-count: infinite;
            animation-delay: 0s;
        }

        #inofooter {
            display: none;
            border-top: 1px solid gray;
            background-color: white;
            width: 100%;
            height: 5rem;
            position: fixed;
            bottom: 0;
        }

        #carouselExampleIndicators {
            visibility: hidden;
        }

        .hugi {
            margin-left: 15px;
            font-size: 30px;
        }

        .hugiStar {
            margin-left: 15px;
            margin-top: 15px;
        }

        #replyInsert {
            margin-top: 7px;
            margin-right: 50px;
        }
        #calendar {
            max-width: 700px;
            margin: 15px auto;
            background-color: white;
       }

        @keyframes ani {
            0% {
                opacity: 0.3;
                transform: scale(1);
            }

            100% {
                opacity: 1;
                transform: scale(1.2);
            }
        }


        @media screen and (max-width: 800px) {
            .inobox2 {
                display: none;
            }

            .reservation1 {
                width: 200px;
            }

            #iBtn {
                padding-left: 1em;
            }
        }

        @media screen and (max-width: 576px) {
            .inobox1 {
                display: none;
            }

            .boxx {
                display: none;
            }

            #inoPhotoNum1 {
                height: 20em;
            }
        }

        @media screen and (max-width: 450px) {
            .inobox1 {
                display: none;
            }

            .boxx {
                display: none;
            }

            #inoPhotoNum1 {
                height: 17em;
            }
        }

    </style>
   
    <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78b4abe6de9ef13e1faed34fe08afb6d&libraries=services"></script>

    <script>
    var csrfHeaderName = "${_csrf.headerName }";
	var csrfTokenValue = "${_csrf.token }";

        $(function() {
        	var sinchungCount = 0;
        	// TODO
        	function displaySinchung(){
        		$.ajax({
        			url : "/uniform/getSinchungBySno?sno=${workplaceVO.sno}",
        			type : "get",
        			success : function(result){
        				sinChungCount = result.length;
        				$(result).each(function(i,obj){
        					if(obj.userID.length > 20){
        						$(".sName").eq(i).html(obj.name);
							$(".sReservation").eq(i).html(obj.reservation);
							$(".photoS").eq(i).attr("src",obj.photo);
							$(".refusePeople").eq(i).data("mno", obj.mno);
        					}else{
        						$(".sName").eq(i).html(obj.name);
        						$(".sReservation").eq(i).html(obj.reservation);
        						$(".photoS").eq(i).attr("src","/display?fileName="+obj.photo);
        						$(".refusePeople").eq(i).data("mno", obj.mno);
        						console.log($(".refusePeople").eq(i).data("mno"));
        					}
        				});
        			}
        		});
        	}
        	
        	displaySinchung();
        	
        	/* 삭제 */
        	$("#refuseParent").on("click",".refusePeople",function(){
        		
        		var mno = $(this).data("mno");
        		var sno = "${workplaceVO.sno}"
        		
        		$.ajax({
        			url : "/uniform/removeSinchung/"+mno+"/"+sno,
        			type : "delete",
        			beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
        			success : function(result){
        				if(result == 'OK'){
        					alert("요청이 처리되었습니다.");
        					//TODO 전부 clear
        					$(".photoS").attr("src","");
        					$(".sName").html("");
        					$(".sReservation").html("");
        					$(".refusePeople").data("mno","");
        					displaySinchung();
        				}else{
        					alert("다시 시도해주세요.");
        				}
        			},
        			
        		});
        	});
         	/* 삭제  end */
       
            //지도 생성을 위한 javascript, jquery
        var mapContainer = document.getElementById('inoResultMap'), // 지도를 표시할 div
        mapOption = {
            center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level : 3
        // 지도의 확대 레벨
        };
    
        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);
    
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
    
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(
                        '${workplaceVO.location}',
                        function(result, status) {
   
                            // 정상적으로 검색이 완료됐으면
                            if (status === kakao.maps.services.Status.OK) {
                                console.log("로드 성공");
    
                                var coords = new kakao.maps.LatLng(result[0].y,
                                        result[0].x);
    
                                // 결과값으로 받은 위치를 마커로 표시합니다
                                var marker = new kakao.maps.Marker({
                                    map : map,
                                    position : coords
                                });
    
                                // 인포윈도우로 장소에 대한 설명을 표시합니다
                                var infowindow = new kakao.maps.InfoWindow(
                                        {
                                            content : '<div style="width:150px;text-align:center;padding:6px 0;">현재 선택한 작업실</div>'
                                        });
                                infowindow.open(map, marker);
    
                                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                map.setCenter(coords);
                            } else {
                                console.log("로드 실패")
                            }
                        });
      /*카카오맵 api 끝*/
            
            var now = new Date();
            var year = now.getFullYear();
            var month = now.getMonth()+1;
            var day = now.getDate();
            var today = year +"-"+month+"-"+day;
            console.log(today);
            //follow quick menu
            $(window).scroll(function() {
                var scrollTop = $(this).scrollTop();
                console.log(scrollTop);
                if (scrollTop < 900) {
                    scrollTop = 0;
                    $(".reservation1").animate({
                        "top": scrollTop
                    });
                }

                $(".reservation1").stop();

                if (2000 > scrollTop && scrollTop > 900) {
                    $(".reservation1").animate({
                        "top": scrollTop - 880
                    });
                }

                if (2130 < scrollTop) {
                    scrollTop = 2130;
                    $(".reservation1").animate({
                        "top": scrollTop - 880
                    });
                }
            });

            var windowWidth = $(window).width();
            if (windowWidth < 575) {
                $("#reservationTap").hide();
                console.log("삭제완료!");
                $("#inofooter").css("display", "block");
                $("#carouselExampleIndicators").css("visibility", "visible");
                //$("#inoPhotoNum1").css("background-image", "none");
            }

            if (windowWidth >= 575) {
                $("#reservationTap").show();
                $("#inofooter").css("display", "none");
                $("#carouselExampleIndicators").css("visibility", "hidden");
                //$("#inoPhotoNum1").css("background-image", "url(/img/1.jpg)");
            }


            $(window).resize(function() {
                //현재 width
                var windowWidth = $(window).width();
                //console.log(windowWidth);

                if (windowWidth < 575) {
                    $("#reservationTap").hide();
                    console.log("삭제완료!");
                    $("#inofooter").css("display", "block");
                    $("#carouselExampleIndicators").css("visibility", "visible");
                    //$("#inoPhotoNum1").css("background-image", "none");

                }

                if (windowWidth >= 575) {
                    $("#reservationTap").show();
                    $("#inofooter").css("display", "none");
                    $("#carouselExampleIndicators").css("visibility", "hidden");
                    //$("#inoPhotoNum1").css("background-image", "url(/img/1.jpg)");
                }
            });
            
            $.ajax({
                url : "/uniform/memberByMno?mno=${workplaceVO.mno}",
                type : "get",
                success : function(result){
                   $("#addName").html("등록자명: "+result.name);
                   $("#addNames").html(result.name);
                   $("#addPhone").html("등록자번호: "+result.phone);
                   $("#addEmail").html("등록자이메일: "+result.email);
                   if(result.userID.length > 20){
                      $(".userPhotoD").attr("src", result.photo);
                   }else{
                      if(result.photo == ""){
                            $(".userPhotoID").attr("src","/resources/image/profileDefault.jpg");
                      }else{
                            $(".userPhotoID").attr("src","display?fileName="+resultPhoto);
                      }
                   }
                },
                error : function(err){
                   console.log(err);
                }
             });
			
            var startDate = "";
            var endDate = "";
            var shareDate = "${workplaceVO.myDate}";
            var splitShareDate = shareDate.split(",");
           	$(splitShareDate).each(function(i, obj){
           		obj = obj+"";
           		var index = obj.split("-");
           		$(index).each(function(k, objs){
           			objs = objs *1;
           			if(i == 0){
           				startDate += objs+"-";
           			}
           			if(i == 1){
           				if(k == 2){
           					objs += 1;
           				}
           				endDate += objs+"-";
           			}
           		});
           	});
           	
           	startDate = startDate.substring(0,startDate.lastIndexOf("-"));
           	endDate = endDate.substring(0,endDate.lastIndexOf("-"));
           	console.log(endDate);

            $('#calendar').fullCalendar({
         header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month'
         },
         defaultDate: today,
         navLinks: true, // can click day/week names to navigate views
         editable: true,
         eventLimit: true, // allow "more" link when too many events
         events: [
            {
               title: '공유 기간',
               start: startDate,
               end: endDate
            }
         ]
      });
            
            $("#resBtn").on("click",function(){
            	// 신청은 pCount까지
            	displaySinchung();
            	var pCount = "${workplaceVO.PCount}";
            	pCount = pCount * 1;
            	if(sinChungCount >= pCount){
            		alert("신청이 꽉 찼습니다.");
            		return;
            	}
            	// 신청은 pCount까지 end
            	
            	// 사용자당 신청은 1회만 가능
            	var flag = false;
            	$(".refusePeople").each(function(i, obj){
            		var mno = $(obj).data("mno");
            		var loginMno = "${pinfo.member.mno}";
            		if(mno == loginMno){
            			flag = true;
            			return;
            		}
            	});
            	
            	if(flag == true){
            		alert("신청은 1회만 가능합니다.");
            		return;
            	}
            	// 신청 1회 end
            	
            	// 글 등록자는 신청불가
            	var workplaceMno = "${workplaceVO.mno}";
            	var loginsMno = "${pinfo.member.mno}";
            	if(loginsMno == workplaceMno){
            		alert("등록자는 신청이 불가능합니다.");
            		return;
            	}
            	// 글 등록자는 신청불가 end
            	
            	// 23 ~ 5 이런식으로 입력을 막기/ 오름차순으로만 신청
            	var input1 = $("input[name='reservation']").eq(0).val();
            	var input2 = $("input[name='reservation']").eq(1).val();
            	input1 = input1 * 1;
            	input2= input2 * 1;
            	if(input1 > input2){
            		alert("신청하실경우 앞 시간이 뒷 시간보다 작게 신청해주세요.");
            		return;
            	}
            	var reservation = $("input[name='reservation']").eq(0).val() + "," + $("input[name='reservation']").eq(1).val();
            	var jsonData = {
            			reservation : reservation,
            			mno : "${pinfo.member.mno}",
            			sno : "${workplaceVO.sno}"
            	};
            	console.log(reservation);
            	$.ajax({
            		url : "/uniform/insertShareSinchung",
            		type : "post",
            		data : JSON.stringify(jsonData),
            		contentType:"application/json; charset=utf-8",
            		beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
            		success : function(result){
            			console.log(result);
            			result *= 1;
            			if(result == 1){
            				alert("시간이 중복되었습니다. 다시 신청해주세요.");
            				return;
            			}else{
            				alert("신청이 완료되었습니다.");
            				displaySinchung();
            				return;
            			}
            		}
            	});
            });
            
            // 확정
            $(".confirmPeople").click(function(){
            	var sno = "${workplaceVO.sno}";
            	$.ajax({
            		url : "/uniform/shareConfirm",
            		beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
            		type : "POST",
            		data : {
            			sno : sno
            		},
            		dataType : "text/plain;",
            		success : function(result){
            			console.log(result);
            		}
            	});
            });
            // 확정 end
            
        });

    </script>
        <!--시작-->
        <div id="colorlib-main">

            <section class="ftco-section ftco-bread ftco-extend-mb">
                <div class="container-fluid px-3 px-md-0">
                    <div class="row no-gutters slider-text justify-content-end align-items-center">
                        <div class="col-md-10 ftco-animate">
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
                            <h1 class="bread">상세페이지 공유</h1>
                        </div>
                    </div>
                </div>
            </section>
            <!---------------------------메인----------------------------------------------------->
            <div class="row">
                <div class="col-md-2"></div>
                <section class="ftco-section contact-section ftco-no-pt col-md-10">
                    <!-- 사진 출력위치-------------------------------------->
                    <div class="container-fluid">

                        <div class="row">
                            <div id="inoPhotoNum1" class="inobox col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <img class="num1" src="/display?fileName=${workplaceVO.thumbnail }">
                               <!---->
                                <!--캐러셀------------------------------------------------------------------------------------>
                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                      
                                      <div class="carousel-inner">
                                        <div class="carousel-item active">
                                          <img class="num1" src="/display?fileName=${workplaceVO.thumbnail}">
                                        </div>
                                        <div class="carousel-item">
                                          <img class="num1" src="/display?fileName=${workplaceVO.attachList[0].path}/${workplaceVO.attachList[0].uuid}_${workplaceVO.attachList[0].fileName}">
                                        </div>
                                        <div class="carousel-item">
                                          <img class="num1" src="/display?fileName=${workplaceVO.attachList[1].path}/${workplaceVO.attachList[1].uuid}_${workplaceVO.attachList[1].fileName}">
                                        </div>
                                        <div class="carousel-item">
                                          <img class="num1" src="/display?fileName=${workplaceVO.attachList[2].path}/${workplaceVO.attachList[2].uuid}_${workplaceVO.attachList[2].fileName}">
                                        </div>
                                        <div class="carousel-item">
                                          <img class="num1" src="/display?fileName=${workplaceVO.attachList[3].path}/${workplaceVO.attachList[3].uuid}_${workplaceVO.attachList[3].fileName}">
                                        </div>
                                      </div>
                                      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                      </a>
                                      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                      </a>
                                    </div>
                                <!--캐러셀------------------------------------------------------------------------------------>
                                
                            </div>
                            
                            <div class="inobox boxx col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="row">
                                    <div id="inoPhotoNum2" class="inobox1 col-xs-12 col-sm-12 col-md-6 col-lg-6"><img class="num1" src="/display?fileName=${workplaceVO.attachList[0].path}/${workplaceVO.attachList[0].uuid}_${workplaceVO.attachList[0].fileName}"></div>
                                    <div id="inoPhotoNum3" class="inobox2 col-xs-12 col-sm-12 col-md-3 col-lg-6"><img class="num1" src="/display?fileName=${workplaceVO.attachList[1].path}/${workplaceVO.attachList[1].uuid}_${workplaceVO.attachList[1].fileName}"></div>

                                </div>
                                <div class="row">
                                    <div id="inoPhotoNum4" class="inobox1 col-xs-12 col-sm-12 col-md-6 col-lg-6"><img class="num1" src="/display?fileName=${workplaceVO.attachList[2].path}/${workplaceVO.attachList[2].uuid}_${workplaceVO.attachList[2].fileName}"></div>
                                    <div id="inoPhotoNum5" class="inobox2 col-xs-12 col-sm-12 col-md-3 col-lg-6"><img class="num1" src="/display?fileName=${workplaceVO.attachList[3].path}/${workplaceVO.attachList[3].uuid}_${workplaceVO.attachList[3].fileName}"></div>
                                </div>
                            </div>
                        <!-- // 사진 출력 -->
                        <!--상세정보 및 기타-->
                        <div id="whole">
                            <!--찜하기-->
                            <div class="row" style="margin-left: 0px;">


                                <!--타이틀 및 상세제목, 등록자 프사와 이름-->
                                <div style="border: 1px solid black;" class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                                    <div class="row">
                                        <div style="border: 1px solid black;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                            <div class="text-center">
                                                <h2><b>${workplaceVO.title }</b></h2>
                                            </div>
                                        </div>
                                        <div style="border: 1px solid black; text-align: center;" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                            <img class="userPhotoD" src=""><br>
                                            <p id="addNames">파이리</p>
                                        </div>

                                    </div>

                                    <!--상세설명---------------------------------------------------------------------------->
                                    <div>
                                        <div class="comforts">
                                            <b><i class="far fa-comment-dots"></i> 상세설명</b>
                                            <p>${workplaceVO.context }</p>
                                        </div>
                                    <!--편의시설---------------------------------------------------------------------------->
                                        <div class="comforts">
                                            <b><i class="far fa-building"></i> 편의시설</b>
                                            <div class="row">
                                                <div style="border: 1px solid black;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                	<c:forEach items="${workplaceVO.comforts } " var="comforts">
                                                       <li>${comforts }</li>
                                                    </c:forEach>
                                                </div>

                                            </div>
                                        </div>
                                    <!--등록자 정보---------------------------------------------------------------------------->
                                        <div class="comforts">
                                            <b><i class="far fa-building"></i> 등록자 정보</b>
                                            <div class="row">
                                                <div style="border: 1px solid black;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                     <li id="addName">등록자명</li>
                                                    <li id="addPhone">등록자 번호</li>
                                                    <li id="addEmail">등록자 email</li>
                                                </div>

                                            </div>
                                        </div>
                                    <!--주소---------------------------------------------------------------------------->
                                        <div class="comforts">
                                            <b><i class="far fa-compass"></i> 주소</b>

                                        </div>
                                        <!--지도-->
                                        <div>
                                            <div id="inoResultMap" style='box-sizing:border-box; width: 100%; height: 500px; border: 1px solid black; background-image: url();background-size: cover; background-position: center; overflow: hidden;'>
                                            </div>
                                        </div>
                                        <!--지도-->
                                    <!--//주소---------------------------------------------------------------------------->
                                        <!--캘린더-->
                                        <div class="comforts">
                                            <b><i class="far fa-calendar"></i> 공유기간</b>

                                        </div>
                                        <div style="border: 1px solid black;" id="calendar">

                                        </div>
                                        
                                        <div class="comforts">
                                            <b><i class="fas fa-users"></i> 신청 List</b>
                                            	<c:if test="${pinfo.member.mno == workplaceVO.mno }">
                                            <button style="margin:5px;" class="btn btn-primary confirmPeople">확정</button>
											</c:if>
                                        </div>	
                                        	  <div style="margin-bottom: 5px;" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" id="refuseParent">
                                        	<c:forEach begin = "1"  end ="${workplaceVO.PCount }" >
                                        <!--신청인원 1명-->
                                            <div style="border: 1px solid black;" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
                                                <img class="userPhotoS photoS" src="" alt="">
                                            </div>
                                            <div style="border: 1px solid black;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                                <b class="sName"style="font-size: 20px;" >이름</b>
                                                <br>
                                                <b class="sReservation" style="font-size: 20px;">시간</b>
												<c:if test="${pinfo.member.mno == workplaceVO.mno }">
	                                            <input type="button" style="margin-right: 5px;" class="btn btn-danger float-right refusePeople" value="거부">
												</c:if>
                                            </div>
                                        <!--신청인원 1명-->
										</c:forEach>
										            </div>
                                    </div>
                                   
                                    
                                    
                                    
                                </div>








                                <!--예약 스크롤------------------------------------------------>
                                <div id="boxReservationI" style="border: 1px solid black" class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <!--예약 탭-->
                                    <div id="reservationTap" class="reservation1">
                                        <div class="text-center">
                                           <p><b>사용할 시간을 HH 형식으로 입력해주세요</b></p>
                                            <p><b>등록자 사용시간 : ${workplaceVO.myTime }</b></p>
                                            <p>별점공간</p>
                                            <hr>
                                        </div>
                                        <!-- 1set-->
                                        <div>
                                            <form action="login.jsp" method="post" id="timeSelect">
                                                
                                                <div class="text-center">
                                                <input style="width: 100px; text-align: center;" type="text" name="reservation"> ~ <input style="width: 100px; text-align: center;" type="text" name="reservation">
                                                </div>
                                                
                                            </form>
                                        </div>
                                        <!-- 1set-->
                                         <sec:authorize access="isAuthenticated()">
                                              <div id="iBtn">
	                                            <button type="button" class="btn btn-danger" id="resBtn">예약하기</button>
	                                            <button type="button" class="btn btn-danger">찜 하 기</button>
                                       		 </div>
 										</sec:authorize>
                                    </div>
                                </div>
                                <!--//예약 스크롤---->



                            </div>

                            <!--후기 ---------------------------------------------------------------------------------------------------------->
                            <div class="row" style="margin-left: 0px;">

                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="border: 1px solid black;">
                                    <div class="row">
                                        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                            <b class="hugi">후기</b>
                                            <b class='hugiStar'>총별점</b>
                                            <button id="replyInsert" type="button" class="btn btn-primary float-right">후기등록</button>
                                        </div>
                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>

                                    </div>
                                </div>
                            </div>



                            <!--실제 댓글공간-------------------------------------------------------------------------------------------------->
                            <div style="border: 1px solid black; margin-left: 0px;" class="row">

                                <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div style="border: 1px solid black;" class="col-xs-1 col-sm-1 col-md-1 col-lg-1 text-center">
                                        <img class="userPhotoS" src="" alt="">
                                    </div>

                                    <div style="border: 1px solid black;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                        <b>후기등록인</b>
                                        <br>
                                        <b>후기등록일</b>
                                        <br>
                                        <b>별점</b>


                                        <button style="margin: 5px;" class="btn btn-primary float-right reviewDeleteBtn">삭제</button>
                                        <button style="margin: 5px;" class="btn btn-primary float-right reviewUpdataBtn">수정</button>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <b>생각한 것처럼 좋았어요!!!~</b>s
                                </div>
                            </div>

                            <div style="border: 1px solid black; margin-left: 0px;" class="row">
                                <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div style="border: 1px solid black;" class="col-xs-1 col-sm-1 col-md-1 col-lg-1 text-center">
                                        <img class="userPhotoS" src="" alt="">
                                    </div>

                                    <div style="border: 1px solid black;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                        <b>후기등록인</b>
                                        <br>
                                        <b>후기등록일</b>
                                        <br>
                                        <b>별점</b>


                                        <button style="margin: 5px;" class="btn btn-primary float-right reviewDeleteBtn">삭제</button>
                                        <button style="margin: 5px;" class="btn btn-primary float-right reviewUpdataBtn">수정</button>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <b>생각한 것처럼 좋았어요!!!~</b>
                                </div>
                            </div>

                            <!--580px 이하시 예약-->
                            <div id="inofooter">
                                <div id="inofooterBtn" class="text-center" style="margin-top: 20px;">
                                    <b style="font-size: 15px">당신의 작업실을 예약하세요!</b>
                                    <button style="margin-left: 5px; margin-right: 5px;" class="btn btn-danger btn-sm float-right">찜 하 기</button>
                                    <button class="btn btn-danger btn-sm float-right" data-toggle="modal" data-target="#myModal">예약하기</button>
                                </div>
                            </div>






                        </div>
                    </div>
                    <!--//container-fluid-->

                    <!-- The Modal ---------------------------------------------------------------------------------------------------------->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">사용할 시간을 HH형식으로 입력해주세요</h4>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div>
                                        <form action="login.jsp" method="post" id="timeSelect2">
                                           <div class="text-center">
                                                <input style="width: 100px; text-align: center;" type="text" name="reservation"> ~ <input style="width: 100px; text-align: center;" type="text" name="reservation">
                                                	
                                            </div>
                                            
                                        

                                        </form>
                                    </div>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" >예약하기</button>
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- The Modal ---------------------------------------------------------------------------------------------------------->

                    </div>
                </section>
            </div>

   <%@ include file="../includes/footer.jsp"%> 