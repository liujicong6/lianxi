<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="">
<table  border="1">
<tr>
<th>
<input type="button" value="添加产品内容">
</th>
<th>产品类别：</th>
<th>
	<select name=""> 
		<option value="">请选择</option> 
		
	</select>
 </th>
 <th>
 关键字搜索：<input type="texy">
 <input type="button" value="搜索">
 </th>

</tr>
<tr>
	<th><input type="button" value="产品列表"></th>
	<th  colspan="3"></th>
</tr>
<tr>
	<th>选择语言</th>
	<th  colspan="3"><input type="radio">中文</th>
</tr>
<tr>
		<th>产品分类</th>
		<th>
	<select name=""> 
		<option value="">TSI</option> 
		
	</select>
 </th>
 
 <th> 发布日期</th>
 <th><input  type="text" value="2005-12-18"></th>
</tr>
<tr>
		<th>产品名称</th>
		<th>
	<input  type="text" value="YSI Level Scout">
 </th>
 
 <th> 附件名称</th>
 <th><input  type="text"></th>

</tr>
<tr>
		<th>添加附件</th>
		<th>
	<input type="text" value="../../resourcefoldert">
 </th>
 
 <th> &nbsp;&nbsp;&nbsp;</th>
 <th>
 	<input type="button" value="删除">
 	<input type="button" value="复位">	
 	<input type="button" value="查看">
 </th>


</tr>
<tr>
	<th>
	简要介绍<br><br>

	</th>
	<th>
	<textarea name="DIVCSS5" cols="1" rows="2"> 
      <p> 发布日期：2006年12月6日</p>
		当前状态
    </textarea>  
 </th>
 
 <th> <input type="button" value="添加产品介绍"></th>
 <th>
 	<img src="${pageContext.request.contextPath}/static/logo_bwf.png">
 	<input type="button" value="删除">
 	<input type="button" value="复位">	
 	
 </th>



</tr>
<tr > 
<th rowspan="4">产品内容</th>
<th colspan="3">
	<div id="div1">
    	<p>欢迎使用 wangEditor 富文本编辑器</p>
	</div>

</th>
</tr>

</table>



</form>

<script src="${pageContext.request.contextPath}/static/wangEditor.min.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E('#div1');
    editor.customConfig.pasteFilterStyle= true;// 关闭粘贴样式的过滤
    editor.customConfig.pasteIgnoreImg = true;// 忽略粘贴内容中的图片
    editor.customConfig.menus=[
		'fontName',
		'fontSize',
		'italic',
		'underline',
		'strikeThrough',
		'foreColor',
		'backColor',
	
		'image'
	];
    
    
    
    
    // 自定义配置颜色（字体颜色、背景色）
    editor.customConfig.colors = [
        'blue',
        '#eeece0',
        'rgba(255,55,33,5)',
        'yellow',
        '#c24f4a',
        '#8baa4a',
      'pink',
      'rgba(255,14,73,1)'
    ];
    
    editor.customConfig.fontNames=[
    	'宋体',
    	
    	'华文新魏'
    	
    	
    ];
    
    
    editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/upload';
 	// 隐藏“网络图片”tab
    editor.customConfig.showLinkImg = false;
 	// 将图片大小限制为 3M
    editor.customConfig.uploadImgMaxSize = 8 * 1024 * 1024;
 	// 限制一次最多能传几张图片，默认为 10000 张（即不限制），需要限制可自己配置
	// 限制一次最多上传 5 张图片
	editor.customConfig.uploadImgMaxLength = 4;
 	// 监听函数，可使用监听函数在上传图片的不同阶段做相应处理
 	editor.customConfig.uploadImgHooks = {
		// 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
    	// （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
    	// 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
    	customInsert: function (insertImg, result, editor) {
        	// insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
        	// 举例：假如上传图片成功后，服务器端返回的是 [url,url,...] 这种格式，即可这样插入图片：
        	for(var i in result){// result 必须是一个 JSON 格式字符串！！！否则报错
        		insertImg('${pageContext.request.contextPath}/static/file/'+result[i]);
        	}
    	}
    }
    
    editor.create();
</script>

</body>
</html>