<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>类型添加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">竞赛类别</label>
        <div class="layui-input-block">
            <%--name和id 由mapper接口中select得到--%>
            <select name="name" id="name" lay-verify="required">
                <option value="">请选择</option>
                <option value="热身赛">热身赛</option>
                <option value="校赛">校赛</option>
                <option value="省赛">省赛</option>
                <option value="国赛">国赛</option>
                <option value="亚洲区赛">亚洲区赛</option>
                <option value="全球赛">全球赛</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注信息</label>
        <div class="layui-input-block">
            <textarea name="remarks" class="layui-textarea" placeholder="请输入备注信息"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">该比赛所占权值分数</label>
        <div class="layui-input-block">
            <input type="text" name="score" lay-verify="required" lay-reqtext="类型名称不能为空" placeholder="请输入类型名称" value="" class="layui-input">
            <tip>填写参加该比赛所得分数</tip>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        //监听提交
        form.on('submit(saveBtn)', function (data) {
            var datas=data.field;//form单中的数据信息
            //向后台发送数据提交添加
            $.ajax({
                url:"addTypeSubmit",
                type:"POST",
                data:datas,
                success:function(result){
                    if(result.code==0){//如果成功
                        layer.msg('添加成功',{
                            icon:6,
                            time:500
                        },function(){
                            parent.window.location.reload();
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                        })
                    }else{
                         layer.msg("类型添加失败");
                    }
                }
            })
            return false;
        });

    });
</script>
</body>
</html>
