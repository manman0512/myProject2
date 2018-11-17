const express=require('express');
const bodyParser=require('body-parser');
const userRouter=require('./routers/user.js');
const indexRouter=require('./routers/index.js');
var app=express();
app.listen(3000,function(){
	console.log('服务器创建成功');
});

app.use(bodyParser.urlencoded({
	extended:false
}));

app.use(express.static('public'));
app.use('/user',userRouter);
app.use("/index",indexRouter);

