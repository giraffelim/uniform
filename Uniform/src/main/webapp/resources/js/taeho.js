/**
 * 
 */
var num;
var num2;
var str;


$(function() {

   /* 핫토픽 프로필 등록 */
   var firstBestShareProfileIP = $("#firstBestShareProfileIP").val();
   var secondBestShareProfileIP = $("#secondBestShareProfileIP").val();
   var thirdBestShareProfileIP = $("#thirdBestShareProfileIP").val();
   var firstBestImdeProfileIP = $("#firstBestImdeProfileIP").val();
   var secondBestImdeProfileIP = $("#secondBestImdeProfileIP").val();
   var thirdBestImdeProfileIP = $("#thirdBestImdeProfileIP").val();

   /* 공유 등록자 프로필 사진 */

   var firstBestShareUserid = $("#firstBestShareUserid").val();
   var secondBestShareUserid = $("#secondBestShareUserid").val();
   var thirdBestShareUserid = $("#thirdBestShareUserid").val();

   console.log("firstBestShareUserid : " + firstBestShareUserid);
   console.log("secondBestShareUserid : " + secondBestShareUserid);
   console.log("thirdBestShareUserid : " + thirdBestShareUserid);

   if (firstBestShareUserid.length > 20) {
      $("#firstBestShareProfile").append(
            "<img class='bestProfileImg' src='" + firstBestShareProfileIP
                  + "'>");
      $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
            "border-radius", "50%");

   } else {
      if (firstBestShareProfileIP == "") {
         $("#firstBestShareProfile").css("background-image",
               "url(/resources/images/default.png)");
      } else {

         $("#firstBestShareProfile").append(
               "<img class='bestProfileImg' src='/uniform/display?fileName="
                     + firstBestShareProfileIP + "'>");
         $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
               "border-radius", "50%");
      }


   }

   if (secondBestShareUserid.length > 20) {
      $("#secondBestShareProfile").append(
            "<img class='bestProfileImg' src='" + secondBestShareProfileIP
                  + "'>");
      $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
            "border-radius", "50%");

   } else {
      if (secondBestShareProfileIP == "") {
         $("#secondBestShareProfile").css("background-image",
               "url(/resources/images/default.png)");
      } else {
         $("#secondBestShareProfile").append(
               "<img class='bestProfileImg' src='/uniform/display?fileName="
                     + secondBestShareProfileIP + "'>");
         $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
               "border-radius", "50%");
      }

      
   }


   if (thirdBestShareUserid.length > 20) {
      $("#thirdBestShareProfile").append(
            "<img class='bestProfileImg' src='" + thirdBestShareProfileIP
                  + "'>");
      $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
            "border-radius", "50%");

   } else {

      if (thirdBestShareProfileIP == "") {
         $("#thirdBestShareProfile").css("background-image",
               "url(/resources/images/default.png)");
      } else {
         $("#thirdBestShareProfile").append(
               "<img class='bestProfileImg' src='/uniform/display?fileName="
                     + thirdBestShareProfileIP + "'>");
         $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
               "border-radius", "50%");
      }
      
      
   }
   /* 임대 등록자 프로필 사진 */

   var firstBestImdeUserid = $("#firstBestImdeUserid").val();
   var secondBestImdeUserid = $("#secondBestImdeUserid").val();
   var thirdBestImdeUserid = $("#thirdBestImdeUserid").val();

   console.log("firstBestImdeUserid : " + firstBestImdeUserid);
   console.log("secondBestImdeUserid : " + secondBestImdeUserid);
   console.log("thirdBestImdeUserid : " + thirdBestImdeUserid);

   if (firstBestImdeUserid.length > 20) {
      $("#firstBestImdeProfile").append(
            "<img class='bestProfileImg' src='" + firstBestImdeProfileIP
                  + "'>");
      $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
            "border-radius", "50%");

   } else {

      if (firstBestImdeProfileIP == "") {
         $("#firstBestImdeProfile").css("background-image",
               "url(/resources/images/default.png)");
      } else {
         $("#firstBestImdeProfile").append(
               "<img class='bestProfileImg' src='/uniform/display?fileName="
                     + firstBestImdeProfileIP + "'>");
         $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
               "border-radius", "50%");
      }



   }

   if (secondBestImdeUserid.length > 20) {
      $("#secondBestImdeProfile").append(
            "<img class='bestProfileImg' src='" + secondBestImdeProfileIP
                  + "'>");
      $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
            "border-radius", "50%");

   } else {

      if (secondBestImdeProfileIP == "") {
         $("#secondBestImdeProfile").css("background-image",
               "url(/resources/images/default.png)");
      } else {
         $("#secondBestImdeProfile").append(
               "<img class='bestProfileImg' src='/uniform/display?fileName="
                     + secondBestImdeProfileIP + "'>");
         $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
               "border-radius", "50%");
      }


   }

   if (thirdBestImdeUserid.length > 20) {
      $("#thirdBestImdeProfile").append(
            "<img class='bestProfileImg' src='" + thirdBestImdeProfileIP
                  + "'>");
      $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
            "border-radius", "50%");

   } else {

      if (thirdBestImdeProfileIP == "") {
         $("#thirdBestImdeProfile").css("background-image",
               "url(/resources/images/default.png)");
      } else {
         $("#thirdBestImdeProfile").append(
               "<img class='bestProfileImg' src='/uniform/display?fileName="
                     + thirdBestImdeProfileIP + "'>");
         $(".bestProfileImg").css("width", "3em").css("height", "3em").css(
               "border-radius", "50%");
      }

   }

   var firstBestShareImg = $("#firstBestShareImg").val();
   var secondBestShareImg = $("#secondBestShareImg").val();
   var thirdBestShareImg = $("#thirdBestShareImg").val();

   var firstBestImg = $("#firstBestImg").val();
   var secondBestImg = $("#secondBestImg").val();
   var thirdBestImg = $("#thirdBestImg").val();

   var firstBestImgEncode = encodeURIComponent(firstBestImg);
   var secondBestImgEncode = encodeURIComponent(secondBestImg);
   var thirdBestImgEncode = encodeURIComponent(thirdBestImg);

   var firstBestShareImgEncode = encodeURIComponent(firstBestShareImg);
   var secondBestShareImgEncode = encodeURIComponent(secondBestShareImg);
   var thirdBestShareImgEncode = encodeURIComponent(thirdBestShareImg);


   $("#firstImdeImg").append(
	        "<a href='/uniform/rentDetail?type=imde&no="+$("#firstBestImdeNo").val()+"'> <img src='/display?fileName=" + firstBestImgEncode + "'> </a>");
	  $("#secondImdeImg").append(
	        "<a href='/uniform/rentDetail?type=imde&no="+$("#secondeBestImdeNo").val()+"'><img src='/display?fileName=" + secondBestImgEncode + "'> </a>");
	  $("#thirdImdeImg").append(
	        "<a href='/uniform/rentDetail?type=imde&no="+$("#thirdBestImdeNo").val()+"'><img src='/display?fileName=" + thirdBestImgEncode + "'> </a>");
	  $("#firstShareImg").append(
	        "<a href='/uniform/rentDetail?type=share&no="+$("#firstBestShareNo").val()+"'> <img src='/display?fileName=" + firstBestShareImgEncode + "'>");
	  $("#secondShareImg").append(
	        "<a href='/uniform/rentDetail?type=share&no="+$("#secondBestShareNo").val()+"'> <img src='/display?fileName=" + secondBestShareImgEncode + "'>");
	  $("#thirdShareImg").append(
	        "<a href='/uniform/rentDetail?type=share&no="+$("#thirdBestShareNo").val()+"'> <img src='/display?fileName=" + thirdBestShareImgEncode + "'>");
   

   $("#shareBtn").on("click", function() {
      console.log("공유 등록 버튼 클릭!!");
      location.href = "/uniform/shareInsert";
   });

   $("#imdeBtn").on("click", function() {
      console.log("임대 버튼 클릭 !!");
      location.href = "/uniform/leaseInsert";
   });

    /*핫토픽 별점 처리*/ 
   console.log($("#bestShareStar2").val());
   
   var result = $(".stardiv");

   result.each(function(index, item) {

      index = index + 1;

      var num = $("#bestShareStar" + index).val();
      var num2 = $("#bestImdeStar" + index).val();

      var width = num * 15;
      var width2 = num2 * 15;
      
   
      
      console.log(index + " 번째 공유 별점 값 : " +  num);
      console.log(index + " 번째 공유 width : " + width);
      console.log(index + " 번째 임대 별점 값: "  + num2 );
      console.log(index + " 번째 임대 width :" + width2);
      
      

      $("#bestShareStar" + index).next().find(".star-input>.input").css(
            "background-position", "0 bottom").css("width", width + "px")
            .css("z-index", "100");

      $("#bestImdeStar" + index).next().find(".star-input>.input").css(
            "background-position", "0 bottom").css("width", width2 + "px")
            .css("z-index", "100");

   });


   var currentDate = $("#currentDate").val();

   var splitDate = currentDate.split('-');

   var currentYear = splitDate[0];
   var currentMonth = splitDate[1];
   var currentDay = splitDate[2];

   $("#inputFirstDate, #inputLastDate").datepicker({
      minDate : 0,
      dateFormat : 'yy-mm-dd'

   });

   $("#inputFirstDate").change(function() {

      var firstDate = $("#inputFirstDate").val();

      var splitSelectDate = firstDate.split('-');

      var selectYear = splitSelectDate[0];
      var selectMonth = splitSelectDate[1];
      var selectDay = splitSelectDate[2];

      if (selectYear < currentYear) {
         alert("선택할 수 없는 날짜 입니다.");
         $("#inputFirstDate").val("");

      } else if (selectMonth < currentMonth) {
         alert("선택할 수 없는 날짜 입니다.");
         $("#inputFirstDate").val("");

      } else if (selectMonth == currentMonth && selectDay < currentDay) {
         alert("선택할 수 없는 날짜 입니다.");
         $("#inputFirstDate").val("");

      } else {
         return true;
      }

   });

   $("#inputLastDate").change(
         function() {

            var lastDate = $("#inputLastDate").val();

            var splitSelectDate = lastDate.split('-');

            var selectYear = splitSelectDate[0];
            var selectMonth = splitSelectDate[1];
            var selectDay = splitSelectDate[2];

            var firstDate = $("#inputFirstDate").val();

            var splitFirstSelectDate = firstDate.split('-');

            var selectFirstYear = splitFirstSelectDate[0];
            var selectFirstMonth = splitFirstSelectDate[1];
            var selectFirstDay = splitFirstSelectDate[2];

            if (selectYear < currentYear) {
               alert("선택할 수 없는 날짜 입니다.");
               $("#inputLastDate").val("");
               return false;
            } else if (selectMonth < currentMonth) {
               alert("선택할 수 없는 날짜 입니다.");
               $("#inputLastDate").val("");
               return false;
            } else if (selectDay < currentDay
                  && selectMonth == currentMonth) {
               alert("선택할 수 없는 날짜 입니다.");
               $("#inputLastDate").val("");
               return false;
            } else if (selectYear < selectFirstYear) {
               alert("끝 날짜가 시작 날짜보다 이전일 수 없습니다. ");
               $("#inputLastDate").val("");
               return false;
            } else if (selectMonth < selectFirstMonth) {
               alert("끝 날짜가 시작 날짜보다 이전일 수 없습니다. ");
               $("#inputLastDate").val("");
               return false;
            } else if (selectDay < selectFirstDay
                  && selectMonth == selectFirstMonth) {
               alert("끝 날짜가 시작 날짜보다 이전일 수 없습니다. ");
               $("#inputLastDate").val("");
               return false;
            } else {
               return true;
            }

         });

   /*--날짜비교 끝--*/

   /* 검색버튼을 클릭했을 경우 이벤트 */

   $("#btnSelect").on(
         "click",
         function(e) {

            e.preventDefault();
            if ($("#typeChoice").val() == "select"
                  || $("#inputLocation").val() == "") {
               alert("위치와 종류는 필수 선택 항목입니다.");
               return;
            } else {
               $("#select_form").submit();
            }
         });

});