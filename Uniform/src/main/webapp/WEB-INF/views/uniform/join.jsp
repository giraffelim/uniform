<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/style_dong.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

<%@include file="../includes/header.jsp"%>
<script src="/resources/js/join.js"></script>







<section class="ftco-section contact-section ftco-no-pt">
         <div class="container-fluid">
           
           <div class="row block-9 justify-content-end">
              <div class="col-md-10">
                 <div class="row">
                   <div class="col-md-10">
                
           
             <div class="col-md-10 ftco-animate">
               <h1 class="bread" id="kaip">회원가입 </h1>
             </div>
          
                     <form action="/uniform/join" class="p-5 contact-form" method="post" id ="joinform">
                       <input type="hidden"
         name="${_csrf.parameterName }" value="${_csrf.token }">
                       
                       <div class="form-group a">
                              <div class="memberupdateid"><i class="fa fa-id-card fa-2x"></i></div>
                         <input type="text" class="memberupdate" id="userid" name="userID" value="" placeholder="아이디">
                         <p id="id_null" style="margin-left: 55px; height: 10px;">아이디를 입력해주세요</p>
                         <p id="id_form" style="margin-left: 55px; height: 10px;">아이디가 중복되었습니다</p>
                         <p id="id_check" style="margin-left: 55px; height: 10px;">양식에 맞는 아이디를 입력해주세요</p>
                         
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