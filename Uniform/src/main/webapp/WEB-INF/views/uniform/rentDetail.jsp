<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<!--폰트어썸---------------------------------------------------------------------------->
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
   integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
   crossorigin="anonymous">
<!--폰트어썸-->
<link rel="stylesheet" href="/resources/css/style_lan.css">
<link rel="stylesheet" href="/resources/css/avg_star.css">
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
   height: 350px;
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

#inoResultMap {
   box-sizing: border-box;
   width: 100%;
   height: 500px;
   overflow: hidden;
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
   #whole {
      margin-top: 70px;
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
   #whole {
      margin-top: 40px;
   }
}
</style>


<link rel="stylesheet" href="/resources/css/style_ino.css">
 <sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="pinfo"/>
 </sec:authorize>

    <script type="text/javascript"
    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=78b4abe6de9ef13e1faed34fe08afb6d&libraries=services"></script>
<script>
function clearSelect(){
   $('select').prop('selectedIndex',0);
   $("#timeSelect").find("input[name='reservation']").remove();
   $(".res option").removeAttr("disabled");
      var hourback = "${hourback}";
      var hourbacks = "${hourback}"*1;
      var hourfront = "${hourfront}";
      var hourfronts = "${hourfront}"*1;
      if(hourbacks < 10 || hourfronts < 10){
         hourback = "0"+"${hourback}";
         hourfronts = "0"+"${hourfronts}";
      }
      hourbackDisable(hourback, hourfront);
}

function hourbackDisable(hourback, hourfront){
      $(".res option").each(function(k, obj){
         var objs = $(this).data("res");
         objs += "";
         var arrayObjs = objs.split("~");
         arrayObjs[0] = arrayObjs[0]+"";
         arrayObjs[1] = arrayObjs[1]+"";
         arrayObjs[0] = arrayObjs[0].replace(":00","");
         arrayObjs[1] = arrayObjs[1].replace(":00","");
         if(arrayObjs[1] <= hourback){
            $(this).attr("disabled","true")
         }
         if(arrayObjs[0] <= hourfront){
            $(this).attr("disabled","true")
         } 
      });     
      sdisableOption();
}

function sdisableOption(){
      // shinChung List
      $("input[name='shinChung']").each(function(i, obj){
         var arrayObj = $(obj).val().split(",");
         for(var i=0; i<arrayObj.length; i++){
               $(".res option").each(function(j, obj){ 
                  if($(this).data("res") == arrayObj[i]){
                     $(this).attr("disabled","true")
                     return;
                  }
               });
         }
         });   
}

function cdisableOption(val){
   $(".res option").each(function(i,obj){
      if($(this).data("res") == val){
         $(this).attr("disabled","true");
      }
   })
}

   $(function() {
      $.ajax({
         url : "/uniform/memberByMno?mno=${workplaceVO.mno}",
         type : "get",
         success : function(result){
               console.log("getMember: "+result);
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
      
      $("input[type=submit]").click(function(e){
         e.preventDefault();
         $("#timeSelect").submit();
      });
      
      var hourback = "${hourback}";
      var hourbacks = "${hourback}"*1;
      var hourfront = "${hourfront}";
      var hourfronts = "${hourfront}"*1;
      if(hourbacks < 10 || hourfronts < 10){
         hourback = "0"+"${hourback}";
         hourfronts = "0"+"${hourfronts}";
      }
      hourbackDisable(hourback, hourfront);
      

      $("select").on("change", function(e){
         $("#timeSelect").append("<input type='hidden' name='reservation' value='"+$(this).val()+"'>");
         cdisableOption($(this).val());
      });
      
      //
      var imageLength = "${workplaceVO.attachList.size()}";
      console.log(imageLength.length);
      
      for(var i=0; i<imageLength; i++){
         // div img 동적 생성
      }
      //파일이미지 등록하기
      var atthachList = new Array();
      attachList = "${workplaceVO.attachList}";
      
      
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

 //follow quick menu
        $(window).scroll(function(){
        var scrollTop = $(this).scrollTop();
        if (scrollTop < 900) {
            scrollTop = 0;
            $(".reservation1").animate( { "top" : scrollTop} );
        }
        
        $(".reservation1").stop();
            
        if(1520> scrollTop && scrollTop > 900){
            $(".reservation1").animate( { "top" : scrollTop-880 });
        }
            
        if(1520 < scrollTop){
            scrollTop = 1520;
            $(".reservation1").animate( { "top" : scrollTop-880 });
            }    
        });

        
        var windowWidth = $(window).width();
        if(windowWidth < 575){
                $("#reservationTap").hide();
                $("#inofooter").css("display", "block");
                $("#carouselExampleIndicators").css("visibility", "visible");
                $("#mainthumbnail").css("visibility","hidden");
            }
            
            if(windowWidth >= 575){
                $("#reservationTap").show();
                $("#inofooter").css("display", "none");
                $("#carouselExampleIndicators").css("visibility", "hidden");
                $("#mainthumbnail").css("visibility","visible");
            }


        
            $(window).resize(function(){
                //현재 width
                var windowWidth = $(window).width();
                
                if(windowWidth < 575){
                    $("#reservationTap").hide();
                    console.log("삭제완료!");
                    $("#inofooter").css("display", "block");
                    $("#carouselExampleIndicators").css("visibility", "visible");
                    $("#mainthumbnail").css("visibility","hidden");
                    
                }
                
                if(windowWidth >= 575){
                    $("#reservationTap").show();
                    $("#inofooter").css("display", "none");
                    $("#carouselExampleIndicators").css("visibility", "hidden");
                    $("#mainthumbnail").css("visibility","visible");
                }
            })

        //pc용 예약
        var timeClone = $('#inoClone').html();
        
        $('#inoplus').on('click', function() {
            console.log($("#addSelect").children().size());
            if($("#addSelect").children().size() > 1){
                alert("최대 6시간만 예약이 가능합니다.");
            }else{
                $('#addSelect').append(timeClone);
            }
        });
        
        $("#inoMinus").on('click',function(){
            if($("#addSelect select")){
            $("#addSelect select:last-child").remove();
            }else{
                alert("더 이상 삭제가 불가능합니다.");
            }
        })
        
        //모달용 예약
        var timeClone2 = $('#inoClone2').html();
        
        $('#inoplus2').on('click', function() {
            
            console.log($("#addSelect2").children().size());
            if($("#addSelect2").children().size() > 1){
                alert("최대 6시간만 예약이 가능합니다.");
            }else{
                $('#addSelect2').append(timeClone2);
            }
        });
        
        $("#inoMinus2").on('click',function(){
            if($("#addSelect2 select")){
            $("#addSelect2 select:last-child").remove();
            }else{
                alert("더 이상 삭제가 불가능합니다.");
            }
        })
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
      function readReview() {
         $("#reviewDiv").html("");
         
         $
               .ajax({
                  url : "/uniform/readReviewList?ino=${workplaceVO.ino}",
                  type : "get",
                  success : function(result) {
                     console.log(result);

                     var BtnStr;
                     var noBtnStr;

                     $
                           .each(
                                 result,
                                 function(i, obj) {
                                    //console.log(obj);
                                    var wmno = obj.mno;
                                    var wphoto = obj.photo;
                                    /* var objDate =obj.regDate; */
                                    var date = new Date(obj.regDate);
                                    var ISOdate = date.toISOString().slice(0,10)
                                    ///console.log("objDate :"+ date.toISOString().slice(0, 10));
                                    //console.log("photo :" + wphoto);
                                    //console.log("wmno"+wmno); 

                                    if (smno == wmno) {
                                       BtnStr = '<div style="border: 1px solid black;" class="row">'
                                       BtnStr += '<div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">'
                                       BtnStr += '<div style="border: 1px solid black;" class="col-xs-1 col-sm-1 col-md-1 col-lg-1 text-center">';

                                       if (obj.userID.length > 20) {
                                          console
                                                .log("length>20 :"
                                                      + obj.userID.length)
                                          BtnStr += '<img class="userPhotoS" src="'+obj.photo+'" alt="">';
                                       } else {
                                          if (wphoto !== null
                                                || wphoto !== "null"
                                                || wphoto !== "") {
                                             console
                                                   .log("length<20 :"
                                                         + obj.userID.length)
                                             BtnStr += '<img class="userPhotoS" src="/uniform/display?fileName='
                                                   + obj.photo
                                                   + '" alt="">';
                                          } else {
                                             console
                                                   .log("photo == null")
                                             BtnStr += '<img class="userPhotoS" src="/resources/images/profileDefault.jpg" alt="">';
                                          }
                                       }
                                       BtnStr += '</div>';
                                       BtnStr += '<div style="border: 1px solid black;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">';
                                       BtnStr += '<b>' + obj.name
                                             + '</b> <br>';
                                       BtnStr += '<b>' + ISOdate
                                             + '</b> <br>';
                                       BtnStr += '<button style="margin: 5px;" class="btn btn-primary float-right delete">삭제</button>';
                                       BtnStr += '<button style="margin: 5px;" class="btn btn-primary float-right modify">수정</button>';
                                       BtnStr += '<input type="hidden" name="hno" value="'+obj.hno+'">';
                                       BtnStr += '</div>';
                                       BtnStr += '</div>';
                                       BtnStr += '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">';
                                       BtnStr += '<b id="content'+obj.hno+'">'
                                             + obj.content
                                             + '</b>';
                                       BtnStr += '</div>';
                                       BtnStr += '</div>';
                                       
                                    } else {
                                       BtnStr = '<div style="border: 1px solid black;" class="row">'
                                       BtnStr += '<div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">'
                                       BtnStr += '<div style="border: 1px solid black;" class="col-xs-1 col-sm-1 col-md-1 col-lg-1 text-center">';

                                       if (obj.userID.length > 20) {
                                          console
                                                .log("1111length>20"
                                                      + obj.userID.length)
                                          BtnStr += '<img class="userPhotoS" src="'+obj.photo+'" alt="">';
                                       } else {
                                          if (wphoto !== null) {
                                             console
                                                   .log("1111length<20"
                                                         + obj.userID.length)
                                             BtnStr += '<img class="userPhotoS" src="/uniform/display?fileName='
                                                   + obj.photo
                                                   + '" alt="">';
                                          } else {
                                             console
                                                   .log("1111photo == null")
                                             BtnStr += '<img class="userPhotoS" src="/resources/images/profileDefault.jpg" alt="">';
                                          }
                                       }

                                       BtnStr += '</div>';
                                       BtnStr += '<div style="border: 1px solid black;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">';
                                       BtnStr += '<b>' + obj.name
                                             + '</b><br>';
                                       BtnStr += '<b>' + ISOdate
                                             + '</b><br>';
                                       BtnStr += '</div>';
                                       BtnStr += '</div>';
                                       BtnStr += '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">';
                                       BtnStr += '<b>'
                                             + obj.content
                                             + '</b>';
                                       BtnStr += '</div>';
                                       BtnStr += '</div>';

                                    }
                                    $("#reviewDiv").append(BtnStr);
                                    
                                    starWidth = obj.star * 15;
                                    //console.log(obj.star + " : " + starWidth + " : " + obj.hno);
                                    $(".star-input" + obj.hno + ">.input").css("background-position",
                                    "0 bottom").css("width", starWidth + "px").css("z-index", "100");
                              
                                 });//each
                           
                  }//success
               })//ajax
      }//function
      readReview();

      var getStar;
      var hno;
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
               
               var reviewSno;
               var reviewIno = $("#starIno").val();
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
               
               review_update(result_star);
            }
         });
      };
      
      function review_update(result_star) {
         $("#review_update").on("click", function(e) {
            console.log("review_update click");
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
                  readReview();
               }
            });
         });
      }
         
      
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
               readReview();
            }
         });
      })

      var num = $("#starAvg").val();
      var width = num * 15;
      var starIno = $("#starIno").val();
      console.log(num + " : " + width + " : " + starIno);
      $(".star-input" + starIno + ">.input").css("background-position",
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

   });
</script>

<input id='csrf' type="hidden" name="${_csrf.headerName }" value="${_csrf.token }">
<link rel="stylesheet" href="/resources/css/style_ino.css">

<!--  shin Chung  -->
<c:forEach var="shinChung" items="${shinChungList }">
<input type="hidden" name="shinChung" value="${shinChung.reservation }">
</c:forEach>

<!-- photo -->
<c:forEach var="attach" items="${workplaceVO.attachList}">
   <input type="hidden" name="inoCarousel"
      value="${attach.path}/${attach.uuid}_${attach.fileName}">
</c:forEach>

<!--시작-->
        <div id="colorlib-main">

            <section class="ftco-section ftco-bread ftco-extend-mb">
                <div class="container-fluid px-3 px-md-0">
                    <div class="row no-gutters slider-text justify-content-end align-items-center">
                        <div class="col-md-10 ftco-animate">
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact</span></p>
                            <h1 class="bread">상세페이지 임대</h1>
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

               <%-- <div class="inobox boxx col-xs-12 col-sm-6 col-md-6 col-lg-6">
                               <c:forEach items="${workplaceVO.attachList }" var="attach">
                               <div>
                               <img src="/display?fileName=${attach.path}/${attach.uuid}_${attach.fileName}">
                               </div>
                               </c:forEach>
                            </div> --%>
            </div>
            <!-- // 사진 출력 -->

                        <!--상세정보 및 기타-->
                        <div id="whole">
                            <!--찜하기-->
                            <div class="row">


                                <!--타이틀 및 상세제목, 등록자 프사와 이름-->
                                <div style="border: 1px solid black;" class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                   <div class="row">
                                    <input type="hidden" id="thumbnailImg"
                           value="${workplaceVO.thumbnail }">
                                       <div style="border: 1px solid black;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                           <div class="text-center">
                                                <h2><b>${workplaceVO.title }</b></h2>
                                           </div>
                                       </div>
                                       <div style="border: 1px solid black; text-align: center;" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                           <img class="userPhotoD" src=""><br>
                                           <p id="addNames"></p>                                           
                                       </div>
                                       
                                   </div>
                                    
                                    <!--상세내용-->
                                    <div>
                                        <div class="comforts">
                                            <b><i class="far fa-comment-dots"></i> 상세설명</b>
                                            <p>${workplaceVO.context }</p>
                                        </div>

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

                                        <div class="comforts">
                                            <b><i class="far fa-compass"></i> 주소</b>

                                        </div>

                                        <div>
                                            <div id="inoResultMap" style='box-sizing:border-box; width: 100%; height: 500px; overflow: hidden;'>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!--예약 스크롤------------------------------------------------>
                                <div id="boxReservationI" style="border: 1px solid black" class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <!--예약 탭-->
                                    <div id="reservationTap" class="reservation1">
                                        <div class="text-center">
                                            <p><b>2시간당 : ${workplaceVO.price } 원</b></p>
                                            <hr>
                                        </div>
                                        <!-- 1set-->
                                        <div>
                                            <form action="/uniform/insertShinChung" method="post" id="timeSelect">
                                                  <input type="hidden" name="ino" value="${workplaceVO.ino }">
                                                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                                                  <input type="hidden" name="mno" value="${pinfo.member.mno }">
    <!-- 1set-->
                                 <sec:authorize access="isAuthenticated()">
                                        <div id="iBtn">
                                            <input type="submit" class="btn btn-danger" value="예약하기">
                                            <input type="button" class="btn btn-danger" value="초 기 화" onclick="clearSelect();">
                                        </div>
                                        </sec:authorize>
                                            </form>
                                            <!-- selectBox-->
                                                <div id="inoClone">
                                                    <select  name="reservation"  class="browser-default custom-select selectBox res" id="select1">
                                                        <option data-res="25" value="">사용시간 선택</option>
                                                        <option data-res="00:00~02:00"  value="00:00~02:00">00 : 00 ~ 02 : 00</option>
                                                        <option data-res= "02:00~04:00" value="02:00~04:00">02 : 00 ~ 04 : 00</option>
                                                        <option data-res= "04:00~06:00" value="04:00~06:00">04 : 00 ~ 06 : 00</option>
                                                        <option data-res= "06:00~08:00"  value="06:00~08:00">06 : 00 ~ 08 : 00</option>
                                                        <option data-res= "08:00~10:00"  value="08:00~10:00">08 : 00 ~ 10 : 00</option>
                                                        <option data-res= "10:00~12:00"  value="10:00~12:00">10 : 00 ~ 12 : 00</option>
                                                        <option data-res= "12:00~14:00"  value="12:00~14:00">12 : 00 ~ 14 : 00</option>
                                                        <option data-res= "14:00~16:00"  value="14:00~16:00">14 : 00 ~ 16 : 00</option>
                                                        <option data-res= "16:00~18:00"  value="16:00~18:00">16 : 00 ~ 18 : 00</option>
                                                        <option data-res= "18:00~20:00"  value="18:00~20:00">18 : 00 ~ 20 : 00</option>
                                                        <option data-res= "20:00~22:00"  value="20:00~22:00">20 : 00 ~ 22 : 00</option>
                                                        <option data-res= "22:00~24:00"  value="22:00~24:00">22 : 00 ~ 24 : 00</option>
                                                    </select>
                                                </div>
                                                <!-- //selectBox-->
                                                <div id="addSelect">
                                              <select name="reservation"  class="browser-default custom-select selectBox res"  id="select2">
                                                        <option data-res="25" value="">사용시간 선택</option>
                                                        <option data-res="00:00~02:00"  value="00:00~02:00">00 : 00 ~ 02 : 00</option>
                                                        <option data-res= "02:00~04:00" value="02:00~04:00">02 : 00 ~ 04 : 00</option>
                                                        <option data-res= "04:00~06:00" value="04:00~06:00">04 : 00 ~ 06 : 00</option>
                                                        <option data-res= "06:00~08:00"  value="06:00~08:00">06 : 00 ~ 08 : 00</option>
                                                        <option data-res= "08:00~10:00"  value="08:00~10:00">08 : 00 ~ 10 : 00</option>
                                                        <option data-res= "10:00~12:00"  value="10:00~12:00">10 : 00 ~ 12 : 00</option>
                                                        <option data-res= "12:00~14:00"  value="12:00~14:00">12 : 00 ~ 14 : 00</option>
                                                        <option data-res= "14:00~16:00"  value="14:00~16:00">14 : 00 ~ 16 : 00</option>
                                                        <option data-res= "16:00~18:00"  value="16:00~18:00">16 : 00 ~ 18 : 00</option>
                                                        <option data-res= "18:00~20:00"  value="18:00~20:00">18 : 00 ~ 20 : 00</option>
                                                        <option data-res= "20:00~22:00"  value="20:00~22:00">20 : 00 ~ 22 : 00</option>
                                                        <option data-res= "22:00~24:00"  value="22:00~24:00">22 : 00 ~ 24 : 00</option>
                                                    </select>
                                                       <select  name="reservation"  class="browser-default custom-select selectBox res"  id="select3">
                                                        <option data-res="25" value="">사용시간 선택</option>
                                                        <option data-res="00:00~02:00"  value="00:00~02:00">00 : 00 ~ 02 : 00</option>
                                                        <option data-res= "02:00~04:00" value="02:00~04:00">02 : 00 ~ 04 : 00</option>
                                                        <option data-res= "04:00~06:00" value="04:00~06:00">04 : 00 ~ 06 : 00</option>
                                                        <option data-res= "06:00~08:00"  value="06:00~08:00">06 : 00 ~ 08 : 00</option>
                                                        <option data-res= "08:00~10:00"  value="08:00~10:00">08 : 00 ~ 10 : 00</option>
                                                        <option data-res= "10:00~12:00"  value="10:00~12:00">10 : 00 ~ 12 : 00</option>
                                                        <option data-res= "12:00~14:00"  value="12:00~14:00">12 : 00 ~ 14 : 00</option>
                                                        <option data-res= "14:00~16:00"  value="14:00~16:00">14 : 00 ~ 16 : 00</option>
                                                        <option data-res= "16:00~18:00"  value="16:00~18:00">16 : 00 ~ 18 : 00</option>
                                                        <option data-res= "18:00~20:00"  value="18:00~20:00">18 : 00 ~ 20 : 00</option>
                                                        <option data-res= "20:00~22:00"  value="20:00~22:00">20 : 00 ~ 22 : 00</option>
                                                        <option data-res= "22:00~24:00"  value="22:00~24:00">22 : 00 ~ 24 : 00</option>
                                                    </select>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                                <!--//예약 스크롤---->



                            </div>

                            <!--후기 ---------------------------------------------------------------------------------------------------------->
                            <div class="row">

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
                           style="border: 1px solid black;">
                           <div class="row">
                              <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                 <b class="hugi">후기</b>
                                 <div class='hugiStar' style="display: inline">
                                    <input type="hidden" id="starAvg" value="${starAvg.avg }">
                                    <input type="hidden" id="starIno" value="${workplaceVO.ino }">
                                    <!-- 빨간 -->
                                    <div class="star-wrap" data-ino="${workplaceVO.ino }">
                                       <span class="star-input${workplaceVO.ino }"> <span
                                          class="input"> </span>
                                       </span>
                                    </div>
                                    <!-- 하얀 -->
                                    <div class="result-wrap">
                                       <span class="star-input${workplaceVO.ino }"> <span
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
                        <div id="reviewDiv"></div>
         
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
                                          <form action="/uniform/updateReview" method="post" id="review_form">
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
               <div id="inofooter">
                  <div id="inofooterBtn" class="text-center"
                     style="margin-top: 20px;">
                     <b style="font-size: 15px">당신의 작업실을 예약하세요!</b>
                     <button style="margin-left: 5px; margin-right: 5px;"
                        class="btn btn-danger btn-sm float-right">초 기 화</button>
                     <button class="btn btn-danger btn-sm float-right"
                        data-toggle="modal" data-target="#myModal">예약하기</button>
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
                                  <h4 class="modal-title">시간당 가격</h4>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div>
                                               <div id="inoClone">
                                                    <select  name="reservation"  class="browser-default custom-select selectBox res" id="select1">
                                                        <option data-res="25" value="">사용시간 선택</option>
                                                        <option data-res="00:00~02:00"  value="00:00~02:00">00 : 00 ~ 02 : 00</option>
                                                        <option data-res= "02:00~04:00" value="02:00~04:00">02 : 00 ~ 04 : 00</option>
                                                        <option data-res= "04:00~06:00" value="04:00~06:00">04 : 00 ~ 06 : 00</option>
                                                        <option data-res= "06:00~08:00"  value="06:00~08:00">06 : 00 ~ 08 : 00</option>
                                                        <option data-res= "08:00~10:00"  value="08:00~10:00">08 : 00 ~ 10 : 00</option>
                                                        <option data-res= "10:00~12:00"  value="10:00~12:00">10 : 00 ~ 12 : 00</option>
                                                        <option data-res= "12:00~14:00"  value="12:00~14:00">12 : 00 ~ 14 : 00</option>
                                                        <option data-res= "14:00~16:00"  value="14:00~16:00">14 : 00 ~ 16 : 00</option>
                                                        <option data-res= "16:00~18:00"  value="16:00~18:00">16 : 00 ~ 18 : 00</option>
                                                        <option data-res= "18:00~20:00"  value="18:00~20:00">18 : 00 ~ 20 : 00</option>
                                                        <option data-res= "20:00~22:00"  value="20:00~22:00">20 : 00 ~ 22 : 00</option>
                                                        <option data-res= "22:00~24:00"  value="22:00~24:00">22 : 00 ~ 24 : 00</option>
                                                    </select>
                                                </div>
                                                <!-- //selectBox-->
                                                <div id="addSelect">
                                              <select name="reservation"  class="browser-default custom-select selectBox res"  id="select2">
                                                        <option data-res="25" value="">사용시간 선택</option>
                                                        <option data-res="00:00~02:00"  value="00:00~02:00">00 : 00 ~ 02 : 00</option>
                                                        <option data-res= "02:00~04:00" value="02:00~04:00">02 : 00 ~ 04 : 00</option>
                                                        <option data-res= "04:00~06:00" value="04:00~06:00">04 : 00 ~ 06 : 00</option>
                                                        <option data-res= "06:00~08:00"  value="06:00~08:00">06 : 00 ~ 08 : 00</option>
                                                        <option data-res= "08:00~10:00"  value="08:00~10:00">08 : 00 ~ 10 : 00</option>
                                                        <option data-res= "10:00~12:00"  value="10:00~12:00">10 : 00 ~ 12 : 00</option>
                                                        <option data-res= "12:00~14:00"  value="12:00~14:00">12 : 00 ~ 14 : 00</option>
                                                        <option data-res= "14:00~16:00"  value="14:00~16:00">14 : 00 ~ 16 : 00</option>
                                                        <option data-res= "16:00~18:00"  value="16:00~18:00">16 : 00 ~ 18 : 00</option>
                                                        <option data-res= "18:00~20:00"  value="18:00~20:00">18 : 00 ~ 20 : 00</option>
                                                        <option data-res= "20:00~22:00"  value="20:00~22:00">20 : 00 ~ 22 : 00</option>
                                                        <option data-res= "22:00~24:00"  value="22:00~24:00">22 : 00 ~ 24 : 00</option>
                                                    </select>
                                                       <select  name="reservation"  class="browser-default custom-select selectBox res"  id="select3">
                                                        <option data-res="25" value="">사용시간 선택</option>
                                                        <option data-res="00:00~02:00"  value="00:00~02:00">00 : 00 ~ 02 : 00</option>
                                                        <option data-res= "02:00~04:00" value="02:00~04:00">02 : 00 ~ 04 : 00</option>
                                                        <option data-res= "04:00~06:00" value="04:00~06:00">04 : 00 ~ 06 : 00</option>
                                                        <option data-res= "06:00~08:00"  value="06:00~08:00">06 : 00 ~ 08 : 00</option>
                                                        <option data-res= "08:00~10:00"  value="08:00~10:00">08 : 00 ~ 10 : 00</option>
                                                        <option data-res= "10:00~12:00"  value="10:00~12:00">10 : 00 ~ 12 : 00</option>
                                                        <option data-res= "12:00~14:00"  value="12:00~14:00">12 : 00 ~ 14 : 00</option>
                                                        <option data-res= "14:00~16:00"  value="14:00~16:00">14 : 00 ~ 16 : 00</option>
                                                        <option data-res= "16:00~18:00"  value="16:00~18:00">16 : 00 ~ 18 : 00</option>
                                                        <option data-res= "18:00~20:00"  value="18:00~20:00">18 : 00 ~ 20 : 00</option>
                                                        <option data-res= "20:00~22:00"  value="20:00~22:00">20 : 00 ~ 22 : 00</option>
                                                        <option data-res= "22:00~24:00"  value="22:00~24:00">22 : 00 ~ 24 : 00</option>
                                                    </select>
                                                </div>
                                        </div>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                 <input type="submit" class="btn btn-danger" value="예약하기">
                                 <input type="button" class="btn btn-danger" value="초 기 화" onclick="clearSelect();">
                                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                              </div>
                            </div>
                          </div>
                       <!-- The Modal ---------------------------------------------------------------------------------------------------------->


                </section>
            </div>


   <!------------------------------------------------------------------------------------------------------------------------------------------------------>


   <%@ include file="../includes/footer.jsp"%>