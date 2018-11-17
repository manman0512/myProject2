/**
 * Created by web on 2018/10/30.
 */
function login(){
    var xhr=createXhr();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
            var res=xhr.responseText;
            if(res=="0"){
                alert("�������û���");
            }
            if(res=="1"){
                alert('����������');
            }
            if(res=="2"){
                location.href="../index.html";
            }
            if(res=="3"){
                alert('�û��������벻��ȷ');
            }
        }
    }
    xhr.open('post','/user/login',true);
    xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    var uname=$('uname').value;
    var upwd=$('upwd').value
    var formdata="uname="+uname+"&upwd="+upwd;
    xhr.send(formdata);
}