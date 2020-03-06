<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>
<th>聘用对象</th>
<th><input style="text"  value="行业经理"></th>
</tr>
<tr>
<th>聘用对象</th>
<th><input style="text"  value="2">人</th>
</tr>
<tr>
<th>工作地点</th>
<th><input style="text" value="上海"></th>
</tr>
<tr>
<th>工资待遇</th>
<th><input style="text" value="面议"></th>

</tr>
<tr>
<th>发布日期</th>
<th><input style="text" value="2005-12-18"></th>
</tr>
<tr>
<th>有效日期</th>
<th><input style="text" value="20">天</th></tr>
<tr>
<th>招聘要求</th>
<th>     <div id="div1">
    	<p>欢迎使用 wangEditor 富文本编辑器</p>
	</div>
	</th>

</tr>
<tr>
<th colspan="2"> 
	<button id="">确定</button>
	<button id="">取消</button> 
	</th>

</tr>
</table>

<script src="${pageContext.request.contextPath}/static/wangEditor.min.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E('#div1');
    // 自定义配置颜色（字体颜色、背景色）
    editor.customConfig.colors = [
        'blue',
        '#eeece0',
        'rgba(255,55,33,5)',
        'yellow',
        '#c24f4a',
        '#8baa4a',
      
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