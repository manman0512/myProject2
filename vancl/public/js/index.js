window.onload=function(){
  ajax({
    url:"http://127.0.0.1:3000/index",//转到路由处理
    type:"get",
    dataType:"json"
  })
  .then(res=>{//得到响应回来的数据
    
    //1楼加载
    var html="";
    for(var p of res.slice(0,4)){
      var{pic,title,href}=p;
      html+=`<div class="desc">
      <a href="${p.href}">
      <img src='${p.pic}' alt=""/>
      </a>
      <div class="detail">
      <a href="#">${p.title}</a>
      </div></div>`;
    }
    var f1Div=document.querySelector("#floor-01>.floor-content");
    //console.log(f1Div);
    f1Div.innerHTML=html;

    //2楼加载
    var html="";
    for(var p of res.slice(4,8)){
      var{pic,title,href}=p;
      html+=`<div class="desc">
      <a href="${p.href}">
      <img src='${p.pic}' alt=""/>
      </a>
      <div class="detail">
      <a href="#">${p.title}</a>
      </div></div>`;
    }
    var f2Div=document.querySelector("#floor-02>.floor-content");
    f2Div.innerHTML=html;

    //3楼加载
    var html="";
    for(var p of res.slice(8,12)){
      var{pic,title,href}=p;
      html+=`<div class="desc">
      <a href="${p.href}">
      <img src='${p.pic}' alt=""/>
      </a>
      <div class="detail">
      <a href="#">${p.title}</a>
      </div></div>`;
    }
    var f3Div=document.querySelector("#floor-03>.floor-content");
    f3Div.innerHTML=html;

    //3楼加载
    var html="";
    for(var p of res.slice(12)){
      var{pic,title,href}=p;
      html+=`<div class="desc">
      <a href="${p.href}">
      <img src='${p.pic}' alt=""/>
      </a>
      <div class="detail">
      <a href="#">${p.title}</a>
      </div></div>`;
    }
    var f4Div=document.querySelector("#floor-04>.floor-content");
    f4Div.innerHTML=html;
  })
}