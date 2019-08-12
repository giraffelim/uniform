<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>
<!--  로그인 했을 경우만  -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="pinfo" />
</sec:authorize>

<!--폰트어썸---------------------------------------------------------------------------->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<!--폰트어썸-->
<!--풀캘린더----------------------------------------------------------->
<link href="/resources/fullcalendar/fullcalendar.css" rel="stylesheet" />
<link href="/resources/fullcalendar/fullcalendar.print.css"
	rel='stylesheet' media="print" />
<script src="/resources/fullcalendar/lib/moment.min.js"></script>
<script src="/resources/fullcalendar/fullcalendar.js"></script>
<!--풀캘린더----------------------------------------------------------->

<link rel="stylesheet" href="/resources/css/style_lan.css">
<link rel="stylesheet" href="/resources/css/avg_star.css">


<!--지도 api-->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78b4abe6de9ef13e1faed34fe08afb6d&libraries=services"></script>


<style>
#whole {
	padding-top: 10px;
}

.inobox {
	height: 38em;
	border: 1px solid darkgray;
	box-sizing: border-box;
}

.inobox1 {
	height: 19em;
	border: 1px solid darkgray;
}

.inobox2 {
	height: 19em;
	border: 1px solid darkgray;
}

.reservation1 {
	width: 350px;
	height: 350px;
	border: 1px solid darkgray;
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

.comforts li, p {
	font-size: 15px;
	color: black;
	list-style: none;
}

#maps {
	width: 500px;
	height: 500px;
}

#inoPhotoNum1 {
	position: relative;
	border: 1px solid darkgray;
}

.num1 {
	/*background-image: url(/img/.jpg);
		            background-repeat: no-repeat;
		            background-size: cover;
		            background-position: center;*/
	/*overflow: hidden;*/
	width: 100%;
	height: 100%;
	display: block;
	position: absolute;
	top: 0;
	left: 0;
}

#carouselExampleIndicators {
	width: 100%;
	height: 80%;
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	visibility: hidden;
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
	width: 100%;
	height: 80%;
	display: block;
	position: absolute;
	top: 0;
	left: 0;
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

@
keyframes ani { 0% {
	opacity: 0.3;
	transform: scale(1);
}

100%
{
opacity
:
 
1;
transform
:
 
scale
(1
.2
);

            
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
                          $(".sName").eq(i).data("mno", obj.mno);
                            }else{
                               if(obj.photo==null || obj.photo == 'null' || obj.photo ==''){
                                  $(".sName").eq(i).html(obj.name);
                                   $(".sReservation").eq(i).html(obj.reservation);
                                  $(".photoS").eq(i).attr("src","/resources/images/profileDefault.jpg");
                                  $(".sName").eq(i).data("mno", obj.mno);
                              }else{
                                 $(".sName").eq(i).html(obj.name);
                                   $(".sReservation").eq(i).html(obj.reservation);
                                   $(".photoS").eq(i).attr("src","/display?fileName="+obj.photo);
                                   $(".sName").eq(i).data("mno", obj.mno);
                              }
                               
                            }
                         });
        				
        			}
        		});
        	}
        	
        	displaySinchung();
        	
        	/* 삭제 */
        	$("#refuseParent").on("click",".refusePeople",function(){
        		
        		var mno = $(this).prev().prev().prev().data("mno");
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
                //console.log(scrollTop);
                if (scrollTop < 900) {
                    scrollTop = 0;
                    $(".reservation1").animate({
                        "top": scrollTop
                    });
                }

                $(".reservation1").stop();

                if (2625 > scrollTop && scrollTop > 900) {
                    $(".reservation1").animate({
                        "top": scrollTop - 880
                    });
                }

                if (2625 < scrollTop) {
                    scrollTop = 2625;
                    $(".reservation1").animate({
                        "top": scrollTop - 880
                    });
                }
            });

            var windowWidth = $(window).width();
            if (windowWidth < 575) {
            	$("#reservationTap").hide();
                $("#inofooter").css("display", "block");
                $("#carouselExampleIndicators").css("visibility", "visible");
                $("#mainthumbnail").css("visibility","hidden");
            }

            if (windowWidth >= 575) {
            	$("#reservationTap").show();
                $("#inofooter").css("display", "none");
                $("#carouselExampleIndicators").css("visibility", "hidden");
                $("#mainthumbnail").css("visibility","visible");
            }


            $(window).resize(function() {
                //현재 width
                var windowWidth = $(window).width();
                //console.log(windowWidth);

                if (windowWidth < 575) {
                	$("#reservationTap").hide();
                    $("#inofooter").css("display", "block");
                    $("#carouselExampleIndicators").css("visibility", "visible");
                    $("#mainthumbnail").css("visibility","hidden");

                }

                if (windowWidth >= 575) {
                	 $("#reservationTap").show();
                     $("#inofooter").css("display", "none");
                     $("#carouselExampleIndicators").css("visibility", "hidden");
                     $("#mainthumbnail").css("visibility","visible");
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
                       if(result.photo == "" || result.photo == null || result.photo == 'null' ){
                             $(".userPhotoD").attr("src","/resources/images/profileDefault.jpg");
                       }else{
                             $(".userPhotoD").attr("src","display?fileName="+result.photo);
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
            	$(".sName").each(function(i, obj){
            		var mno = $(obj).data("mno");
            		var loginMno = "${pinfo.member.mno}";
            		if(mno == loginMno){
            			flag = true;
            			return;
            		}
            	});
            	console.log($(".sName").eq(0).data("mno"));
            	
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
            		success : function(result){
            			location.href='/uniform/myPage?mno=${pinfo.member.mno}';
            		}
            	});
            });
            // 확정 end
            
            
            //추가
          //추가
            var Thumbnail=$("#thumbnailImg").val();
            //console.log(Thumbnail);
            var encodeThumbnail = encodeURIComponent(Thumbnail);
            //console.log(encodeThumbnail);
            $("#mainthumbnail").attr("src","/display?fileName="+encodeThumbnail);
            
            //캐러셀
            $("input[name=inoCarousel]").each(function(i,obj){
             //console.log($(obj).val());
             var carouselStr;
             if (i == 1) {
                carouselStr = '<div class="carousel-item active">';
                carouselStr += '<img src="/display?fileName='+encodeURIComponent($(obj).val())+'" class="d-block w-100" alt="..."></div>';
                $("#carouselImg").append(carouselStr);
             } else {
                carouselStr = '<div class="carousel-item">';
                carouselStr += '<img src="/display?fileName='+encodeURIComponent($(obj).val())+'" class="d-block w-100" alt="..."></div>';
                $("#carouselImg").append(carouselStr);
             }
          });
            
            //이미지 박스 4개
            $("input[name=inoCarousel]").each(function(i,obj){
             //console.log($(obj).val());
             switch (i) {
             case 0:
                $("#img1").attr("src","/display?fileName="+encodeURIComponent($(obj).val()));   
             break;
             case 1:
                $("#img2").attr("src","/display?fileName="+encodeURIComponent($(obj).val()));
             break;
             case 2:
                $("#img3").attr("src","/display?fileName="+encodeURIComponent($(obj).val()));
             break;
             case 3:
                $("#img4").attr("src","/display?fileName="+encodeURIComponent($(obj).val()));
             break;

             }
          });
            
            var userid ="${pinfo.member.userID}"; 
            console.log("userID"+userid);
            var smno = "${pinfo.member.mno}";
            //console.log("smno"+smno);
          var starWidth;

        //댓글 목록 구해오기!
          function readReview(page) {
        	  
             $("#reviewDiv").html("");
             
             
             $
                   .ajax({
                	   url : "/uniform/readReviewListS/"+${workplaceVO.sno}+"/"+page,
                      type : "get",
                      success : function(result) {
                         console.log(result.replyCnt);
                         console.log(result.list);

                         var BtnStr;
                         var noBtnStr;

                         if(page == -1){
                        	 pageNum = Math.ceil(result.replyCnt/5.0);
                        	 readReview(pageNum);
                        	 return;
                         }
                         
                         if(result.list == null || result.list.length == 0){
                        	$("#reviewDiv").html("");
                        	$(".card-footer").html("");
     						return;
     					}
                         
                         for(var i = 0, len = result.list.length || 0; i < len; i++){
                        	 var wmno = result.list[i].mno;
                        	 console.log("wmno : " + wmno);
                        	 var wphoto = result.list[i].photo;
                        	 console.log("wphoto : " + wphoto);
                        	 var date = new Date(result.list[i].regDate);
                             var ISOdate = date.toISOString().slice(0,10);
                             console.log("ISOdate : " + ISOdate);
                             
                             if (smno == wmno) {
                                 BtnStr = '<div style="" class="row">'
                                 BtnStr += '<div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">'
                                 BtnStr += '<div style="" class="col-xs-1 col-sm-1 col-md-1 col-lg-1 text-center">';

                                 if (result.list[i].userID.length > 20) {
                                     console
                                           .log("1111length>20"
                                                 + result.list[i].userID.length)
                                     BtnStr += '<img class="userPhotoS" src="'+result.list[i].photo+'" alt="">';
                                  } else {
                                     if (wphoto !== null) {
                                        console
                                              .log("1111length<20"
                                                    + result.list[i].userID.length)
                                        BtnStr += '<img class="userPhotoS" src="/uniform/display?fileName='
                                              + result.list[i].photo
                                              + '" alt="">';
                                     } else {
                                        console
                                              .log("1111photo == null")
                                        BtnStr += '<img class="userPhotoS" src="/resources/images/profileDefault.jpg" alt="">';
                                     }
                                  }
                                 
                                 BtnStr += '</div>';
                                 BtnStr += '<div style="height:100px;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">';
                                 BtnStr += '<b style="font-size: 30px;">' + result.list[i].name
                                       + '</b> <br>';
                                 BtnStr += '<b>' + ISOdate
                                       + '</b> <br>';
                                 BtnStr += '<button style="position: absolute; top:1em; right: 10px;" class="btn btn-primary float-right delete" onclick="return confirm(\'정말삭제하시겠습니까?\')">삭제</button>';
                                 BtnStr += '<button style="position: absolute; top:1em; right: 75px;" class="btn btn-primary float-right modify">수정</button>';
                                 BtnStr += '<input type="hidden" name="hno" value="'+result.list[i].hno+'">';
                                 BtnStr += '</div>';
                                 BtnStr += '</div>';
                                 BtnStr += '<div style="margin-left: 15px;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">';
                                 BtnStr += '<b id="content'+result.list[i].hno+'">'
                                       + result.list[i].content
                                       + '</b>';
                                 BtnStr += '</div>';
                                 BtnStr += '</div>';
                                 BtnStr += '</div><br><hr>';
                                 
                              } else {
                                 BtnStr = '<div style="" class="row">'
                                 BtnStr += '<div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">'
                                 BtnStr += '<div style="" class="col-xs-1 col-sm-1 col-md-1 col-lg-1 text-center">';

                                 if (result.list[i].userID.length > 20) {
                                    console
                                          .log("1111length>20"
                                                + result.list[i].userID.length)
                                    BtnStr += '<img class="userPhotoS" src="'+result.list[i].photo+'" alt="">';
                                 } else {
                                    if (wphoto !== null) {
                                       console
                                             .log("1111length<20"
                                                   + result.list[i].userID.length)
                                       BtnStr += '<img class="userPhotoS" src="/uniform/display?fileName='
                                             + result.list[i].photo
                                             + '" alt="">';
                                    } else {
                                       console
                                             .log("1111photo == null")
                                       BtnStr += '<img class="userPhotoS" src="/resources/images/profileDefault.jpg" alt="">';
                                    }
                                 }

                                 BtnStr += '</div>';
                                 BtnStr += '<div style="height:100px;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">';
                                 BtnStr += '<b style="font-size: 30px;">' + result.list[i].name
                                       + '</b><br>';
                                 BtnStr += '<b>' + ISOdate
                                       + '</b><br>';
                                 BtnStr += '</div>';
                                 BtnStr += '</div>';
                                 BtnStr += '<div style="margin-left: 15px;" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">';
                                 BtnStr += '<b>'
                                       + result.list[i].content
                                       + '</b>';
                                 BtnStr += '</div>';
                                 BtnStr += '</div><br><hr>';

                              }
                             $("#reviewDiv").append(BtnStr);
                             
                         }
                         showReplyPage(result.replyCnt); 
                               
                      }//success
                   })//ajax
          }//function
          readReview(-1);

          var getStar;
          var hno;
          var result_star = 0;
          //댓글 수정모달 띄우기
          $("#reviewDiv").on('click', ".modify", function() {
             //console.log("modify1111");
             hno = $(this).next('input').val();
             //console.log("hno : " + hno);

             $.ajax({
                url : "/uniform/readReview?hno=" + hno,
                type : "get",
                success : function(result) {
                   console.log("content1111 : " + result.content);
                   $("#review-content").val(result.content);
                   getStar = result.star;
                   $("#review").modal("show");
                   
                   var reviewSno = $("#starSno").val();
                   var reviewIno;
                   console.log(reviewSno, reviewIno);
                   starRating(reviewSno, reviewIno);
                }

             })
          })
          
          
          function starRating(reviewSno, reviewIno) {
         var $star = $(".star-input"), $result = $star.find("output>b");

         $(document).on("focusin", ".star-input>.input", function() {
            $(this).addClass("focus");
         }).on("focusout", ".star-input>.input", function() {
            var $this = $(this);
            setTimeout(function() {
               if ($this.find(":focus").length === 0) {
                  $this.removeClass("focus");
               }
            }, 100);
         }).on("change", ".star-input :radio", function() {
            $result.text($(this).next().text());
         }).on("mouseover", ".star-input label", function() {
            $result.text($(this).text());
         }).on("mouseleave", ".star-input>.input", function() {
            var $checked = $star.find(":checked");
            if ($checked.length === 0) {
               $result.text("0");
            } else {
               $result.text($checked.next().text());
               result_star = $checked.next().text();
               
            }
         });
      };
          
      $("#review_update").on("click", function(e) {
     	 if (result_star == 0) {
     		 alert("별점을 설정해주세요.");
     		 return;
     	 }
         console.log("review_update click" + result_star);
         $.ajax({
            url : "/uniform/updateReview",
            data : {
               hno : hno,
               content : $("#review-content").val(),
               star : result_star
            },
            type : "post",
            success : function(result) {
               console.log("content : " + result + $("#review-content").val() + " : " + result_star + " : " + hno);
               $("#review-content").val("")
               $("#review").modal("hide");
               readReview(-1);
            }
         });
      });
          
             
          
          var csrfHeaderName = $("#csrf").attr('name');
          var csrfTokenValue = $("#csrf").val();

          // ajax csrf 토큰 전송하기!!!!!!
          $(document).ajaxSend(
                function(e, xhr, options) {
                   xhr.setRequestHeader(csrfHeaderName,
                         csrfTokenValue);
                });
          

        //댓글 삭제
          $("#reviewDiv").on('click', ".delete", function() {
             hno = $(this).next().next('input').val();
             $.ajax({
                url : "/uniform/removeReview?hno="+hno,
                type : "get",
                success : function(result) {
                   readReview(-1);
                   location.reload();
                }
             });
          })

          var num = $("#starAvg").val();
          var width = num * 15;
          var starSno = $("#starSno").val();
          console.log(num + " : " + width + " : " + starSno);
          $(".star-input" + starSno + ">.input").css("background-position",
                "0 bottom").css("width", width + "px").css("z-index", "100");
          
          console.log($("#myPageUserid").val());
          
          if ($("#myPageUserid").val().length < 20) {
              if($("#myPagePhoto").val() === "") {
                 $("#reviewProfile").append("<img src='/resources/images/default.png'>");
              } else {
                 $("#reviewProfile").append("<img src='/uniform/display?fileName="+$("#myPagePhoto").val()+"'>");
              }
           } else {
              $("#reviewProfile").append("<img src='"+$("#myPagePhoto").val()+"'>");
           }
          
       // 댓글 페이징
  		var pageNum = 1;
  		var replyPageFooter = $(".card-footer");
  		
  		function showReplyPage(replyCnt) {
  			
  			var endNum = Math.ceil(pageNum / 5.0) * 5;
  			var startNum = endNum - 4;
  			
  			var prev = startNum != 1;
  			var next = false;
  			
  			
  			if(endNum * 5 >= replyCnt){
  				endNum = Math.ceil(replyCnt/5.0);
  			}
  			// 다음페이지가 있으면 
  			if(endNum * 5 < replyCnt){
  				next = true;
  			}
  			
  			var str ="<ul style='position: absolute; top:2em; left:25em;' class='pagination float-right'>";
  			
  			if(prev){
  				str += "<li class = 'page-item'><a class = 'page-link' href='"+(startNum -1)+"'>Previous</a></li>";
  				
  			}
  			
  			for(var i = startNum; i<=endNum; i++){
  				var active = pageNum ==i? "active":"";
  				
  				str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
  				
  			}
  			if(next){
  				str += "<li class = 'page-item'><a class = 'page-link' href='"+(endNum -1)+"'>Next</a></li>";
  			}
  			
  			str += "</ul></div>";
  			
  			console.log(str);
  			
  			replyPageFooter.html(str);
  		}
  		
  	// 댓글페이징 페이지번호 이벤트 처리
		replyPageFooter.on("click","li a", function(e){
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum : " + targetPageNum); // 1,2,3 페이지
			
			pageNum = targetPageNum;
			
			readReview(pageNum);
		});
          
		var comforts= "${workplaceVO.comforts}";
		var arrayC = comforts.split(",");
		console.log(arrayC);
		var imageC;
		for(var i = 1; i<arrayC.length+1; i++){
			console.log("arrayC[i-1] : "+arrayC[i-1]);
			verifyComforts(arrayC[i-1])
			if(i%2 == 0){
				$("#liNum2").append(imageC);
				
			}else{
				$("#liNum1").append(imageC);
				
			}
		
			
		}
		function verifyComforts(comforts){
				console.log("comforts : "+comforts);
				switch (comforts){
			    case "WIFI" :
			    	imageC ='<li><img style="width:30px; height:30px; margin-right:10px; margin-bottom:10px;" src="/resources/images/wifi.png">WIFI</li>';
			        break;
			    case "앰프" :
			    	imageC ='<li><img style="width:30px; height:30px; margin-right:10px; margin-bottom:10px;" src="/resources/images/amp.png">앰프</li>';
			        break;
			    case "마이크" :
			    	imageC ='<li><img style="width:30px; height:30px; margin-right:10px; margin-bottom:10px;" src="/resources/images/mic.png">마이크</li>';
			        break;
			    case "화장실" :
			    	imageC ='<li><img style="width:30px; height:30px; margin-right:10px; margin-bottom:10px;" src="/resources/images/toilet.png">화장실</li>';
			        break;
			    case "에어컨":
			    	imageC ='<li><img style="width:30px; height:30px; margin-right:10px; margin-bottom:10px;" src="/resources/images/conditioner.png">에어컨</li>';
			        break;
			    case "냉장고":
			    	imageC ='<li><img style="width:30px; height:30px; margin-right:10px; margin-bottom:10px;" src="/resources/images/refrigerator.png">냉장고</li>';
			        break;
			    case "선풍기":
			    	imageC ='<li><img style="width:30px; height:30px; margin-right:10px; margin-bottom:10px;" src="/resources/images/fan.png">선풍기</li>';
			        break;
			    case "공기청정기":
			    	imageC ='<li><img style="width:30px; height:30px; margin-right:10px; margin-bottom:10px;" src="/resources/images/cleaner.png">공기청정기</li>';
			        break;
				}
		}
   });
</script>
<!-- 토큰 -->
<input id='csrf' type="hidden" name="${_csrf.headerName }"
	value="${_csrf.token }">
<!-- photo -->
<c:forEach var="attach" items="${workplaceVO.attachList}">
	<input type="hidden" name="inoCarousel"
		value="${attach.path}/${attach.uuid}_${attach.fileName}">
</c:forEach>

<!--시작-->
<div id="colorlib-main">

	<section class="ftco-section ftco-bread ftco-extend-mb">
		<div class="container-fluid px-3 px-md-0">
			<div
				class="row no-gutters slider-text justify-content-end align-items-center">
				<div class="col-md-10 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span>
					</p>
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
					<div id="inoPhotoNum1"
						class="inobox col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<img id="mainthumbnail" class="num1" src="">

						<!--캐러셀------------------------------------------------------------------------------------>
						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">

							<div class="carousel-inner" id="carouselImg"></div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
						<!--캐러셀------------------------------------------------------------------------------------>

					</div>

					<div class="inobox boxx col-xs-12 col-sm-6 col-md-6 col-lg-6">
						<div class="row">
							<div id="inoPhotoNum2"
								class="inobox1 col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<img id="img1" class="num1" src="">
							</div>
							<div id="inoPhotoNum3"
								class="inobox2 col-xs-12 col-sm-12 col-md-3 col-lg-6">
								<img id="img2" class="num1" src="">
							</div>

						</div>
						<div class="row">
							<div id="inoPhotoNum4"
								class="inobox1 col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<img id="img3" class="num1" src="">
							</div>
							<div id="inoPhotoNum5"
								class="inobox2 col-xs-12 col-sm-12 col-md-3 col-lg-6">
								<img id="img4" class="num1" src="">
							</div>

						</div>
					</div>
				</div>
				<!-- // 사진 출력 -->
				<!--상세정보 및 기타-->
				<div id="whole">
					<!--찜하기-->
					<div class="row" style="margin-left: 0px;">


						<!--타이틀 및 상세제목, 등록자 프사와 이름-->
						<div
							style="margin-left: 100px; background-color: #F6F6F6; box-shadow: 1px 2px 4px rgba(0, 0, 0, .5); padding: 0 2em; margin-top: 1em;"
							class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<div class="row">
								<input type="hidden" id="thumbnailImg"
									value="${workplaceVO.thumbnail }">
								<div style="margin-top: 10px;"
									class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
									<div class="text-center">
										<br>
										<h2>
											<b>${workplaceVO.title }</b>
										</h2>
									</div>
								</div>
								<div style="text-align: center; margin-top: 10px;"
									class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
									<br>
									<img class="userPhotoD" src=""><br>
									<p id="addNames"></p>
								</div>

							</div>
							<hr>

							<!--상세설명---------------------------------------------------------------------------->
							<div>
								<div class="comforts">
									<b><i class="far fa-comment-dots"></i> 상세설명</b>
									<p>${workplaceVO.context }</p>
								</div>
								<hr>
								<!--편의시설---------------------------------------------------------------------------->
								<div class="comforts">
									<b><i class="far fa-building"></i>편의시설</b> <br>
									<div class="row">
										<div id="liNum1" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

										</div>
										<div id="liNum2" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

										</div>

									</div>
								</div>
								<hr>
								<!--등록자 정보---------------------------------------------------------------------------->
								<div class="comforts">
									<b><i class="far fa-building"></i> 등록자 정보</b>
									<div class="row">
										<div style="" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<li id="addName">등록자명</li>
											<li id="addPhone">등록자 번호</li>
											<li id="addEmail">등록자 email</li>
										</div>

									</div>
								</div>
								<hr>
								<!--주소---------------------------------------------------------------------------->
								<div class="comforts">
									<b><i class="far fa-compass"></i> 주소</b>

								</div>
								<br>
								<div>
									<div id="inoResultMap"
										style='box-sizing: border-box; width: 80%; height: 500px; overflow: hidden; margin: auto;'>
									</div>
								</div>
								<br>
								<hr>
								<!--지도-->
								<!--//주소---------------------------------------------------------------------------->
								<!--캘린더-->
								<div class="comforts">
									<b><i class="far fa-calendar"></i> 공유기간</b>

								</div>
								<div style="width: 80%; height: 500px;" id="calendar"></div>
								<br>
								<hr>

								<div class="comforts">
									<b><i class="fas fa-users"></i> 신청 List</b>
									<c:if test="${pinfo.member.mno == workplaceVO.mno }">
										<button style="margin: 5px;"
											class="btn btn-primary confirmPeople">확정</button>
									</c:if>
								</div>
								<div style="margin-bottom: 5px;"
									class="row col-xs-12 col-sm-12 col-md-12 col-lg-12"
									id="refuseParent">
									<c:forEach begin="1" end="${workplaceVO.PCount }">
										<!--신청인원 1명-->
										<div style="border: 1px solid darkgray;"
											class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
											<img class="userPhotoS photoS" src="" alt="">
										</div>
										<div style="border: 1px solid darkgray;"
											class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
											<b class="sName" style="font-size: 20px;">이름</b> <br> <b
												class="sReservation" style="font-size: 20px;">시간</b>
											<c:if test="${pinfo.member.mno == workplaceVO.mno }">
												<input type="button" style="margin-right: 5px;"
													class="btn btn-danger float-right refusePeople" value="거부">
											</c:if>
										</div>
										<!--신청인원 1명-->
									</c:forEach>
								</div>
								<hr>
							</div>




						</div>








						<!--예약 스크롤------------------------------------------------>
						<div id="boxReservationI"
							class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
							<!--예약 탭-->
							<div id="reservationTap" class="reservation1"
								style="box-shadow: 1px 2px 4px rgba(0, 0, 0, .5); margin-top: 1em; background-color: #F6F6F6;">
								<div class="text-center">
									<p>
										<b>사용할 시간을 HH 형식으로 입력해주세요</b>
									</p>
									<p>
										<b>등록자 사용시간 : ${workplaceVO.myTime }</b>
									</p>
									<p>${workplaceVO.price }원</p>
									<hr>
								</div>
								<!-- 1set-->
								<div>
									<form action="login.jsp" method="post" id="timeSelect">

										<div class="text-center">
											<input style="width: 100px; text-align: center;" type="text"
												name="reservation" placeholder="8"> ~ <input
												style="width: 100px; text-align: center;" type="text"
												name="reservation" placeholder="19">
										</div>

									</form>
								</div>
								<!-- 1set-->
								<sec:authorize access="isAuthenticated()">
									<c:if test="${flag != 1 }">
										<div id="iBtn">
											<button type="button" class="btn btn-danger" id="resBtn">예약하기</button>
											<button type="button" class="btn btn-danger">찜 하 기</button>
										</div>
									</c:if>

									<c:if test="${flag == 1 }">
										<br>
										<br>
										<div style='' class="text-center">
											<b>이미 예약이 끝난 작업실입니다!! :)</b>
										</div>
									</c:if>

								</sec:authorize>
							</div>
						</div>
						<!--//예약 스크롤---->



					</div>

					<!--후기 ---------------------------------------------------------------------------------------------------------->
					<br>
					<div class="row" style="margin-left: 100px;">

						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="">
							<div class="row">
								<div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
									<b class="hugi">후기</b>
									<div class='hugiStar'
										style="display: inline; position: absolute; top: 0;">
										<input type="hidden" id="starAvg" value="${starAvg.avg }">
										<input type="hidden" id="starSno" value="${workplaceVO.sno }">
										<!-- 빨간 -->
										<div class="star-wrap" data-sno="${workplaceVO.sno }">
											<span class="star-input${workplaceVO.sno }"> <span
												class="input"> </span>
											</span>
										</div>
										<!-- 하얀 -->
										<div class="result-wrap">
											<span class="star-input${workplaceVO.sno }"> <span
												class="result"> </span>
											</span>
										</div>

									</div>
								</div>
								<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>

							</div>
						</div>
					</div>



					<!--실제 댓글공간-------------------------------------------------------------------------------------------------->
					<div class="row" style="margin-left: 100px;">
						<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							<div id="reviewDiv"></div>
							<div style="position: relative;" class="card-footer"></div>
						</div>
					</div>

					<!-- last추가 -->
					<c:if test="${pinfo.member.mno == workplaceVO.mno }">
						<button style="position: absolute; right: 300px;"
							class="btn btn-danger float-right"
							onclick="location.href='/uniform/shareUpdate?sno=${workplaceVO.sno}'">글
							수정하기</button>
					</c:if>

					<!-- 추가 모달  -->
					<!-- Modal -->
					<div class="modal fade" id="review" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">후기 수정</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<div class="row review-body">
										<div class="col-md-3">
											<div class="profile-image" id="reviewProfile">
												<input type="hidden" id="myPageUserid"
													value="${pinfo.member.userID}"> <input
													type="hidden" id="myPagePhoto"
													value="${pinfo.member.photo}">
											</div>
										</div>
										<div class="col-md-9">
											<form action="/uniform/updateReview" method="post"
												id="review_form">
												<input type="hidden" name="${_csrf.parameterName }"
													value="${_csrf.token }" /> <input type="hidden" id="ino"
													name="ino"> <input type="hidden" id="sno"
													name="sno"> <input type="hidden" id="cno"
													name="cno">
												<div>
													<sec:authorize access="isAuthenticated()">
														<input type="hidden" id="mno" name="mno"
															value='<sec:authentication property="principal.member.mno"/>' />
														<span>이름 : ${pinfo.member.name }</span>

													</sec:authorize>
													<sec:authorize access="isAnonymous ()">
														<span>회원정보없음</span>
													</sec:authorize>
													<span class="star-input"> <span class="input">
															<input type="radio" name="star-input" value="1" id="p1">
															<label for="p1">1</label> <input type="radio"
															name="star-input" value="2" id="p2"> <label
															for="p2">2</label> <input type="radio" name="star-input"
															value="3" id="p3"> <label for="p3">3</label> <input
															type="radio" name="star-input" value="4" id="p4">
															<label for="p4">4</label> <input type="radio"
															name="star-input" value="5" id="p5"> <label
															for="p5">5</label> <input type="radio" name="star-input"
															value="1" id="p6"> <label for="p6">6</label> <input
															type="radio" name="star-input" value="2" id="p7">
															<label for="p7">7</label> <input type="radio"
															name="star-input" value="3" id="p8"> <label
															for="p8">8</label> <input type="radio" name="star-input"
															value="4" id="p9"> <label for="p9">9</label> <input
															type="radio" name="star-input" value="5" id="p10">
															<label for="p10">10</label>
													</span>
													</span> <input type="hidden" id="review_star" name="star" value="" />
												</div>
												<div>
													<textArea id="review-content" name="content"></textArea>
												</div>
											</form>
										</div>
									</div>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-info" id="review_update">수정</button>
								</div>
							</div>
						</div>
					</div>

					<!-- ///추가 모달  -->

					<!--580px 이하시 예약-->
					<sec:authorize access="isAuthenticated()">
						<c:if test="${flag != 1 }">
							<div id="inofooter">
								<div id="inofooterBtn" class="text-center"
									style="margin-top: 20px;">
									<b style="font-size: 15px">당신의 작업실을 예약하세요!</b>
									<button class="btn btn-danger btn-sm float-right"
										data-toggle="modal" data-target="#myModal">예약하기</button>
								</div>
							</div>
						</c:if>
					</sec:authorize>






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
										<input style="width: 100px; text-align: center;" type="text"
											name="reservation" placeholder="8"> ~ <input
											style="width: 100px; text-align: center;" type="text"
											name="reservation" placeholder="18">

									</div>



								</form>
							</div>
						</div>

						<!-- Modal footer -->
						<sec:authorize access="isAuthenticated()">
							<c:if test="${flag == 1 }">
								<div class="modal-footer">
									<b>예약이 끝난 작업실입니다. :)</b>
								</div>
							</c:if>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<c:if test="${flag != 1 }">
								<div class="modal-footer">
									<button type="button" class="btn btn-danger">예약하기</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
								</div>
							</c:if>
						</sec:authorize>

					</div>
				</div>
			</div>
			<!-- The Modal ---------------------------------------------------------------------------------------------------------->

		</section>
	</div>

	<%@ include file="../includes/footer.jsp"%>