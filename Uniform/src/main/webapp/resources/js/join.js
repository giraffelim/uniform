/**
 * 
 */



  $(document).ready(function(){
     
     //서밋하기위해 플레그설정
     var sFlag = [false,false,false,false,false,false];
    
   
   //정규식 선언
      var PW = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/;
      var Phone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
      var Email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      var idReg = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;

    
    
   
   
    
    
   
   
    
    //userid에 포커싱이 벗어났을때
    $("#userid").on("focusout",function(){
       
      //userid에 입력된 값가져옴
       var userid =  $("#userid").val(); 
       console.log(userid);
   
       
       
       
       //id 입력되지않았을떄
       if(userid===""){
          $("#id_null").css("display","block");
            $("#id_form").css("display","none");
            $("#id_check").css("display","none");
             sFlag[0] = false;
       }
       
      
      
       
       else if(!idReg.test($(this).val())){  
             
             $("#id_null").css("display","none");
             $("#id_form").css("display","none");
               $("#id_check").css("display","block");
               
                sFlag[0] = false;
          } else{
   
          
       
       //아이디중복체크
      
       $.ajax({
              url : "/uniform/idcheck/"+userid,
              type : "get",
              success : function(result){
                 console.log(result);
              if(result == ""){
                 $("#id_form").css("display","block");
                 $("#id_null").css("display","none");
                 $("#id_check").css("display","none");
                  sFlag[0] = false;
              }
                 
                 
              else if(result == "okay"){
                 $("#id_form").css("display","none");
                 $("#id_null").css("display","none");
                 $("#id_check").css("display","none");
                  sFlag[0] = true;
              }
              }
          });
          }
       
      
    
       
       
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
       
   
       
         
         //if All true submit
         if(sFlag[0] == true && sFlag[1] == true && sFlag[2] == true && sFlag[3] == true && sFlag[4] == true  && sFlag[5] == true){
          
             $('#joinform').submit();
             alert("회원가입에 성공하였습니다.");
         }
          
                      
          
    })
    
    
   
   
   
   
});



