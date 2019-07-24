<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/style_dong.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<%@include file="../includes/header.jsp"%>


<style>

 
</style>

<script>

  $(document).ready(function(){
	  
	  //서밋하기위해 플레그설정
	  var sFlag = [false,false,false,false,false,false];
	 
	
	//pw phone 정규식
	  var PW = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/;
      var Phone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
      var Email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	
	//userid에 입력된 값가져옴
	 
	 console.log(userid);
	
	
	 
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
	 
	 //password에 포커싱 벗어낫을때
	 $("#password").on("focusout",function(){
		//userpw에 입력된 값가져옴
		 var password = $("#password").val();
		if($(this).val().length==0){
			$("#pw_null").css("display","block");
		    $('#pw_form').css('display', 'none');
		    sFlag[1] = false;
		} 
		else if(!PW.test($(this).val())){
            $('#pw_null').css('display','none');
            $('#pw_form').css('display', 'block');
            sFlag[1] = false;
		}
            else if(PW.test($(this).val())){
                $('#pw_null').css('display','none');
                $('#pw_form').css('display','none');
                sFlag[1] = true;
            }
		
	 });
	 
	 //비밀번호 확인에 포커싱 벗어났을떄
	 $("#passwordcheck").on("focusout",function(){
		//userpw에 입력된 값가져옴
		 var passwordcheck = $("#passwordcheck").val();
		 var password = $("#password").val();
		 console.log($(this).val());
		 console.log(passwordcheck);
			if($(this).val().length==0){
				$("#pw_null2").css("display","block");
				$('#pw_check').css('display', 'none');
				sFlag[2] = false;
			} 
			else if(password != $(this).val()){
	            $('#pw_null2').css('display','none');
	            $('#pw_check').css('display', 'block');
	            sFlag[2] = false;
	        
			}
	            else if(password === $(this).val()){
	                $('#pw_null2').css('display','none');
	                $('#pw_check').css('display','none');
	                sFlag[2] = true;
	            }
			
			
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
         <div class="container-fluid">
           
           <div class="row block-9 justify-content-end">
              <div class="col-md-10">
                 <div class="row">
                   <div class="col-md-10">
                <div class="jumbotron" id="jumbotron">
                   <i class="fas fa-sign-in-alt fa-4x"></i> <h1>회원가입</h1>
                </div>      
                     <form action="/uniform/join" class="bg-white p-5 contact-form" method="post" id ="joinform">
                       <input type="hidden"
			name="${_csrf.parameterName }" value="${_csrf.token }">
                       
                       <div class="form-group a">
                              <div class="memberupdateid"><i class="fa fa-id-card fa-2x"></i></div>
                         <input type="text" class="memberupdate" id="userid" name="userID" value="" placeholder="아이디">
                         <p id="id_null" style="margin-left: 55px; height: 10px;">아이디를 입력해주세요</p>
                         <p id="id_form" style="margin-left: 55px; height: 10px;">아이디가 중복되었습니다</p>
                         
                       </div>
                       <div class="form-group">
                              <div class="memberupdateid"><i class="fa fa-user-lock  fa-2x"></i></div>
                         <input type="password" class="memberupdate" id="password" name="userPW" value=""  placeholder="비밀번호(영문 숫자 특수문자 2가지 이상 6~15자 이내)">
                          <p id="pw_null" style="margin-left: 55px; height: 10px;" >비밀번호를 입력해주세요.</p>
                           <p id="pw_form" style="margin-left: 55px; height: 10px;a" >영문, 숫자, 특수문자 1가지 이상 6~15자 이내로 입력해주세요.</p>
                       </div>
                       <div class="form-group">
                              <div class="memberupdateid"><i class="fa fa-user-check  fa-2x"></i></div>
                         <input type="password" class="memberupdate" id="passwordcheck" name="userPW2" value=""  placeholder="비밀번호 확인">
                         <p id="pw_check" style="margin-left: 55px; height: 10px;">비밀번호가 일치하지 않습니다</p>
                         <p id="pw_null2" style="margin-left: 55px; height: 10px;">비밀번호를 입력해주세요</p>
                       </div>
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




	<%@include file="../includes/footer.jsp"%>