<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/style_dong.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<%@include file="includes/header.jsp"%>


<style>

 
</style>

<script>

  $(document).ready(function(){
	  var oauth2LoginUser = '	<sec:authentication property="principal.member.mno"/>';
	  if(oauth2LoginUser != 0){
	  	location.href="/";
	  }
	  //서밋하기위해 플레그설정
	  var sFlag = [false,false,false,false,false,false];
	 
	
	//pw phone 정규식
	  var PW = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/;
      var Phone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
      var Email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	
	//userid에 입력된 값가져옴
	
	 
	 //userid에 포커싱이 벗어났을때
	 $("#userid").on("focusout",function(){
		 
		//userid에 입력된 값가져옴
		 var userid =  $("#userid").val(); 
		 console.log(userid);
		 
		 if(userid==""){
			 $("#id_null").css("display","block");
				$("#id_form").css("display","none");
		 }
		
		 $.ajax({
		        url : "/uniform/idcheck/"+userid,
		        type : "get",
		        success : function(result){
		        	console.log(result);
		        if(result == ""){
		        	$("#id_form").css("display","block");
		        	$("#id_null").css("display","none");
		        	 sFlag[0] = false;
		        }
		        	
		        	
		        else if(result == "okay"){
		        	$("#id_form").css("display","none");
		        	$("#id_null").css("display","none");
		        	 sFlag[0] = true;
		        }
		        }
		    });
	 
		 
		 
	 });
	 
	 //이름에 포커싱 벗어났을때
	 $("#name").on("focusout",function(){
			if($(this).val().length==0){
				$("#name_null").css("display","block");
				sFlag[3] = false;
			} 
			else {
				$("#name_null").css("display","none");
				 sFlag[3] = true;
			}
			
			
		 });
	 
	 //전화번호 포커싱벗어났을떄
	 
	 $("#phone").on("focusout",function(){
			if($(this).val().length==0){
				$("#phone_null").css("display","block");
			    $('#phone_form').css('display', 'none');
			    sFlag[4] = false;
			} 
			else if(!Phone.test($(this).val())){
	            $('#phone_null').css('display','none');
	            $('#phone_form').css('display', 'block');
	            sFlag[4] = false;
			}
	            else if(Phone.test($(this).val())){
	                $('#phone_null').css('display','none');
	                $('#phone_form').css('display', 'none');
	                sFlag[4] = true;
	                var name = $("#name").val();
	    				var enName = encodeURI(name);
		    			$.ajax({
		    				url : "/uniform/confirm/"+enName+"/"+$("#phone").val(),
		    				type : "get",
		    				dataType : "json",
		    				success : function(result){
		    					console.log(result);
		    					if(result != " "){
		    						var mno = result.mno;
		    						var result = confirm("이미 아이디가 존재합니다. 병합을 진행하시겠습니까?");
		    						if(result == false){
		    							alert("병합을 하셔야 기존 서비스 유지가 가능하십니다.");
		    							$("#exists").css("display","block");
		    							return false;
		    						}else{
		    							/* alert("병합을 진행합니다."); */
		    							var naverId = "<sec:authentication property = 'principal.member.naverId'/>";
		    							var csrfHeaderName = "${_csrf.headerName }";
		    							var csrfTokenValue = "${_csrf.token }";
		    							if(naverId != "null"){
		    								var sendData = {
		    										naverId : naverId,
		    										mno : mno
		    								}
		    								$.ajax({
												url : "/uniform/mergeMember",
												contentType : "application/json",
												beforeSend : function(xhr){
													xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
												},
												data : JSON.stringify(sendData),
												dataType : "json",
												type : "put",
												success : function(result){
													console.log(result);
												},
												error : function(err){
													console.log(err);
												}
											});	    				    								
		    							}else{
		    								var googleId = "<sec:authentication property = 'principal.member.googleId'/>";
		    								var sendData = {
		    										googleId : googleId,
		    										mno : mno
		    								}
		    								console.log(sendData);
		    								 $.ajax({
												url : "/uniform/mergeMember",
												contentType:"application/json",
												dataType : "json",
												beforeSend : function(xhr){
													xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
												},
												data : JSON.stringify(sendData),
												type : "put",
												success : function(result){
													console.log(result);
												},
												error : function(err){
													console.log(err);
												}
											});	    
		    							} 
		    						}
		    					}
		    				}
		    			});
	            }
		 });
	 
	 
	 //이메일에 포커싱 벗어났을때
	 $("#email").on("focusout",function(){
			if($(this).val().length==0){
				$("#email_null").css("display","block");
			    $('#email_form').css('display', 'none');
			    sFlag[5] = false;
			} 
			else if(!Email.test($(this).val())){
	            $('#email_null').css('display','none');
	            $('#email_form').css('display', 'block');
	            sFlag[5] = false;
	            
			}
	            else if(Email.test($(this).val())){
	                $('#email_null').css('display','none');
	                $('#email_form').css('display', 'none');
	                sFlag[5] = true;
	            }
			
		
		 });
	 
	 //가입버튼 눌렀을때 이벤트처리
	 $("#insertbtn").on("click",function(e){
		 e.preventDefault();
		 
		 
		//sFlag print
       
         
         //if All true submit
         if(sFlag[0] == true && sFlag[1] == true && sFlag[2] == true && sFlag[3] == true && sFlag[4] == true  && sFlag[5] == true){
			 
             $('#joinform').submit();
             alert("회원가입에 성공하였습니다.");
         }
			 
             			
          
	 })
	 
	 
	
	
	
	
});


</script>

<section class="ftco-section contact-section ftco-no-pt">
	<sec:authentication property="principal" var="pinfo"/>
         <div class="container-fluid">
           
           <div class="row block-9 justify-content-end">
              <div class="col-md-10">
                 <div class="row">
                   <div class="col-md-10">
                <div class="jumbotron" id="jumbotron">
                   <i class="fas fa-sign-in-alt fa-4x"></i> <h1>추가 정보 입력</h1>
                </div>      
                     <form action="/uniform/join" class="bg-white p-5 contact-form" method="post" id ="joinform">
                       <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                       <input type="hidden" name="naverId" value="${pinfo.member.naverId }">
                       <input type="hidden" name="googleId" value="${pinfo.member.googleId }">
                       <input type="hidden" name="photo" value="${pinfo.member.photo }">
                         
                       <div class="form-group">
                              <div class="memberupdateid"><i class="fa fa-user fa-2x"></i></div>
                         <input type="text" class="memberupdate" id="name" name="name" value=""  placeholder="이름">
                   <p id="name_null" style="margin-left: 55px; height: 10px;">이름을 입력해주세요</p>
                       </div>
                       <div class="form-group">
                              <div class="memberupdateid"><i class="fas fa-mobile-alt fa-2x"></i></i></div>
                         <input type="text" class="memberupdate" id="phone" name="phone" value=""  placeholder="휴대폰 번호">
                      <p id="phone_null" class="under" style="margin-left: 55px; height: 10px;">핸드폰 번호를 입력해주세요</p>
                       <p id="phone_form" class="under" style="margin-left: 55px; height: 10px;">핸드폰 번호를 양식에 맞게 입력해주세요</p>
                       <p id="exists" class="under" style="margin-left: 55px; height: 10px; color:red; display:none;">병합을 진행해주세요!.</p>
                       </div>
                       <div class="form-group">
                              <div class="memberupdateid"><i class="fa fa-envelope fa-2x"></i></div>
                         <input type="text" class="memberupdate" id="email" name="email" value=""  placeholder="이메일">
                       <p id="email_null" style="margin-left: 55px; height: 10px;">이메일을 입력해주세요</p>
                        <p id="email_form" style="margin-left: 55px; height: 10px;">형식에 맞는 이메일을 입력해주세요</p>
                       </div>
                       <div class="form-group">
                         <input  type="reset" value="취소" class="inoUpdateBtn1 btn btn-primary float-right">
                         <input  type="submit" id="insertbtn" value="가입"  class="inoUpdateBtn2 btn btn-primary float-right">
                       </div>
                     </form>
                   
                   </div>

                   
                     </div>
               </div>
           </div>
         </div>
         
         
       </section>
       <script>
       		$("#name").val("${pinfo.member.name}");
       		$("#email").val("${pinfo.member.email}");
       		$("#insertbtn").on("click",function(e){
       			$("#joinform").submit();
       		});
       </script>

	<%@include file="includes/footer.jsp"%>
