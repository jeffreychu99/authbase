
//左边菜单栏目点击
$(".layui-logo").click(function(){
 
    if($(".left-menu").css("display")=='block'){
      $(".left-menu").css("display","none");
      $(".layui-body,.layui-footer").css("left","0px");
    }else{
      $(".left-menu").css("display","block");
      $(".layui-body,.layui-footer").css("left","200px");
    }
});

function ToLink(url){
  $("iframe").attr('src',url);
}

/*iframe打开弹窗*/
function LayerOpen(url){
 
  layer.open({
      type: 2,
      //title: '添加',
      shadeClose: true,
      shade: false,
      maxmin: true, //开启最大化最小化按钮
      area: ['893px', '600px'],
      content: url
  });
  
}

//弹出框
function alert(data='操作成功~',url=''){

  //不作任何操作
  if(url==''){
      layer.open({
        title: '提示',
        content: data
      }); 
  //刷新
  }else if(url=='1' || url=='reload'){
    layer.open({
        title: '提示',
        content: data,
        yes: function(){
            location.reload();
        },cancel: function(){ 
            location.reload();
        }
    }); 
  //跳转
  }else{
     layer.open({
        title: '提示',
        content: data,
        yes: function(){
            location.href=url;
        },cancel: function(){ 
            location.href=url;
        }
      });  
  }
 
}

/*修改状态*/
function setstatus(url,id,status,type){
    if(type){

      layer.confirm('是否确认当前操作?', {icon: 3, title:'提示'}, function(index){
        $.post(url,{"id":id,"status":status},function(data){
            alert(data.msg,1);
        },'JSON');
      
      });
    }else{
      $.post(url,{"id":id,"status":status},function(data){
        alert(data.msg,1);
      },'JSON');
    }    
}

/*表单提交*/
function FormAjax(href, data='', table='table'){

    $.ajax({
        url: href,
        type: 'PUT',
        dataType:"json",
        data:data,
        success: function(res) {
            if(typeof(parent.table)  != 'undefined'){
              parent.table.reload(table);
            }

            layer.alert(res.msg, function(){
              
              if(typeof(parent.table)  != 'undefined'){
                parent.layer.closeAll();
              }else if(res.url !=''){
                location.href = res.url;
              }

            }); 
        }

    });

    return false;
}

/*初始化表单请求数据*/
function FormGet( obj={} ){

  if(typeof (obj.href) == "undefined"){
    obj.href =location.href;
  }

  if(typeof (obj.id) == "undefined"){
    obj.id ="form";
  }


  $.get(obj.href,{},function(data){
      
      if(typeof (obj.inc) != "undefined" ){
        obj.inc(data);
        console.log(data);
      }

      form.val(obj.id, data);


    },'json');

}

/*删除数据*/
function Delete(href, data='', obj, msg ='真的删除本条数据吗？'){

    layer.confirm(msg, function(index){

        $.ajax({
            url: href,
            type: 'delete',
            dataType:"json",
            data:data,
            success: function(res) {
                
                if(res.code=='1'){
                    alert(res.msg);
                    obj.del();
                    layer.close(index);
                 }else{
                   alert(res.msg);
                 }

            }

        });
        
    });

    return false;
}

/*修改状态*/
function Status(href, data, tip='error',table='table'){
  
    $.ajax({
        url: href,
        type: 'PUT',
        dataType:"json",
        data:data,
        success: function(res) {

            if(res.code =='0'){
               alert(res.msg);
            }else{

              alert('状态修改成功~');
              
            }
        }

    });

}

var admin = {

    init : function(arr=[]){


      for ( i in arr ) {

        eval("this."+arr[i]+"()"); 
        
      }
      
    },
    aa : function(){
      alert('sadfd');
    },
    add : function(){

      form.on('submit(submit)', function(data){
        

        $.ajax({
            url: location.href,
            type: 'PUT',
            dataType:"json",
            data:data,
            success: function(res) {
                if(typeof(parent.table)  != 'undefined'){
                  parent.table.reload(table);
                }

                layer.alert(res.msg, function(){
                  
                  if(typeof(parent.table)  != 'undefined'){
                    parent.layer.closeAll();
                  }else if(res.url !=''){
                    location.href = res.url;
                  }

                }); 
            },
            error: function(){
              alert("上传失败");
            }

        });

        return false;
       
      });

    },
    submit : function(){

      form.on('submit(submit)', function(data){

        $.ajax({
            url: location.href,
            type: 'PUT',
            dataType:"json",
            data:data.field,
            success: function(res) {

                if(typeof(parent.table)  != 'undefined' ){
                  parent.table.reload(table);
                }

                layer.alert(res.msg, function(){
                  
                  if(typeof(parent.table)  != 'undefined'){
                    parent.layer.closeAll();
                  }else if(res.url !=''){
                    location.href = res.url;
                  }else{
                    location.href = location.href;
                  }

                }); 
            }

        });

        return false;

      });

    },
    //上传
    fileupload : function ( object={} ){


        if(typeof(object.elem) == 'undefined'){
            object.elem = '.fileupload';
        }

        if(typeof(object.url) == 'undefined'){
            object.url = '/admin.php/common/fileupload.html';
        }

        if(typeof(object.field) == 'undefined'){
            object.field = 'file';
        }

        console.log(object);

        upload.render({
          elem: object.elem //绑定元素
          ,url: object.url  //上传接口
          ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。

            layer.load(); //上传loading
          }
          ,done: function(res,index){ 

              layer.closeAll('loading');

              if(res.status=='1'){ 
                  
                  //alert("上传成功~"); 

                  if(typeof (object.inc) != "undefined" ){
                     object.inc(res);
                  }else{
                   
                    $(object.elem).parents(".layui-form-item").find(".layui-input-inline, input").val(res.path);
                    //$(object.elem).parents(".layui-input-inline").prev(".layui-input-inline").find("img").attr('src',res.path);
                    //$(object.elem).parents(".layui-input-inline").prev(".layui-input-inline").show();
                  }

              }else{
                alert("上传失败,请重试！");
              }
          }
          ,error: function(){
              layer.closeAll('loading');
              alert("上传失败,请重试！");
          }
          ,field:object.field

        });

    },

    edit : function edit( obj={} ){

      if(typeof (obj.href) == "undefined"){
        obj.href =location.href;
      }

      if(typeof (obj.id) == "undefined"){
        obj.id ="form";
      }


      $.get(obj.href,{},function(data){
          
          if(typeof (obj.inc) != "undefined" ){
            obj.inc(data);
          }

          form.val(obj.id, data);


        },'json');

    },
    //搜索
    search : function(){

      form.on('submit(search)', function(data){
   
        var field=data.field;

        if($(data.elem).html()=="重置"){

            $("input").val("");
            field="";
        }

        table.reload('table', {
           where: field
        });

        return false; 
      });

    },
    //时间选择
    laydate : function (start ="#start", end = "#end"){

      laydate.render({
        elem: start,
        max: 0
      });
      laydate.render({
        elem: end,
        max: 1
      });

    }

};





