const express=require('express');
var router=express.Router();
const pool=require('../pool.js');
//登录路由
router.post('/login',function(req,res){
	var obj=req.body;
	var $uname=obj.uname;
	if(!$uname){
		res.send("0");
		return;
	}
	var $upwd=obj.upwd;
	if(!$upwd){
		res.send("1");
		return;
	}

	pool.query('SELECT * FROM vancl_user WHERE uname=? AND upwd=?',[$uname,$upwd],function(err,result){
		if(err)throw err;
		if(result.length>0){
			res.send("2");
		}else{
			res.send("3");
		}
	});  
});
//检测用户名是否存在
router.get('/check_uname',function(req,res){
	var obj=req.query;
	var $uname=obj.uname;
	if(!$uname){
		res.send("0");
		return;
	}
	pool.query('SELECT * FROM vancl_user WHERE uname=?',$uname,function(err,result){
		if(err) throw err;
		if(result.length>0){
			res.send('1');
		}else{
			res.send('2');
		}
	});
});
//检测邮箱是否存在
router.get('/check_email',function(req,res){
	var $email=req.query.email;
	if(!$email){
		
		res.send("0");
		return;
	}
    console.log($email+"5252");
	pool.query('SELECT * FROM vancl_user WHERE email=?',$email,function(err,result){
		if(err)throw err;
		if(result.length){
			res.send('1');
		}else{
			res.send('2');
		}
	});
});
//检测电话号码是否存在
router.get('/check_phone',function(req,res){
	var $phone=req.query.phone;
	if(!$phone){
		res.send('0');
		return;
	}
	pool.query('SELECT * FROM vancl_user WHERE phone=?',$phone,function(err,result){
		if(err) throw err;
		if(result.length>0){
			res.send('1');
		}else{
			res.send('2');
		}
	});
});

//登录路由
router.post('/reg',function(req,res){
	var obj=req.body;
	var $uid=obj.uid;
	obj.gender=null;
	obj.uid=null;
	obj.avatar=null;
	pool.query('INSERT INTO vancl_user SET?',obj,function(err,result){
		if(err)throw err;
		if(result.affectedRows>0){
			res.send('1');
		}else{
			res.send('0');
		}
	});
});

//注册路由
router.post('/reg',function(req,res){
	var obj=req.body;
	var $uname=obj.uname;
	if(!$uname){
		res.send({code:400,msg:'uname required'});
		return;
	}
	var $upwd=obj.upwd;
	if(!$upwd){
		res.send({code:401,msg:'upwd required'});
		return;
	}
	var $email=obj.email;
	if(!$email){
		res.send({code:402,msg:'email required'});
		return;
	}
	var $phone=obj.phone;
	if(!$phone){
		res.send({code:403,msg:'phone required'});
		return;
	}
	pool.query('SELECT * FROM vancl_user WHERE uname=?',$uname,function(err,result){
		if(err)throw err;
		if(result.length>0){
			res.send({code:400,msg:'用户名已经被占用'});
			return;
		}
	}); 
	pool.query('INSERT INTO vancl_user VALUES(NULL,?,?,?,?,NULL,0)',[$uname,$upwd,$email,$phone],function(err,result){
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:200,msg:'reg success'});
		}else{
			res.send({code:400,msg:'reg error'});
		}
	});
});

//更改信息
//1.先查找到当前用户的信息
router.get('/sel',function(req,res){
	var $uid=req.query.uid;
	pool.query('SELECT * FROM vancl_user WHERE uid=?',$uid,function(err,result){
		if(err)throw err;
		if(result.length>0){
			res.send(result[0]);
		}else{
			res.send('1');
		}
	});
});
//2.提交修改后的数据给服务器
router.post('/update',function(req,res){
	var obj=req.body;
	var $uid=obj.uid;
	var $upwd=obj.upwd;
	if(!$upwd){
		res.send("<script>window.alert('用户密码不能为空');</script>");
		return;
	}
	var $gender=obj.gender;
	if(!$gender){
		res.send("<script>window.alert('用户性别不能为空');</script>");
		return;
	}
	var $avatar=obj.avatar;
	if(!$avatar){
		res.send("<script>window.alert('用户头像不能为空');</script>");
		return;
	}
	/*
	var $user_name=obj.uname;
	if(!user_name){
		res.send("<script>window.alert('用户姓名不能为空');</script>");
	}
	*/
	pool.query('UPDATE vancl_user SET ?WHERE uid=?',[obj,$uid],function(err,result){
		if(err) throw err;
		if(result.affectedRows>0){
			res.send('1');
		}else{
			res.send('0');
		}
	});
});

//查询所有用户的全部信息
router.get('/select',function(req,res){
	pool.query('SELECT * FROM vancl_user ',function(err,result){
		if(err)throw err;
		if(result.length>0){
			res.send(result);
		}else{
			res.send('0');
		}
	});
});

//查询某个用户的全部信息
router.get('/sel',function(req,res){
	var $uid=req.query.uid;
	pool.query('SELECT * FROM  vancl_user WHERE uid=?',$uid,function(err,result){
		if(err)throw err;
		if(result.length>0){
			res.send(result[0]);
		}else{
			res.send('0');
		}
	});
});

//注销某个用户的信息
router.get('/delete',function(req,res){
	var obj=req.query;
	var $uid=obj.uid;
	pool.query('DELETE FROM vancl_user WHERE uid=?',$uid,function(err,result){
		if(result.affectedRows>0){
			res.send("1");
		}else{
			res.send("0");
		}
	});
});

module.exports=router;