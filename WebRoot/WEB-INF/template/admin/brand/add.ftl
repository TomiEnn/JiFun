<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>kkk  </title>
<meta name="author" content="U2SHOP" />
<meta name="copyright" content="U2SHOP" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/editor/kindeditor.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
        
	$().ready(function() {
		var $inputForm = $("#inputForm");
		var $type = $("#type");
		var $logo = $("#logo");
		var $browserButton = $("#browserButton");
		
		$type.change(function() {
			if ($(this).val() == "text") {
				alert($(this).val());
				$logo.val("").prop("disabled", true);
				$browserButton.prop("disabled", true);
			} else {
				$logo.prop("disabled", false);
				$browserButton.prop("disabled", false);
			}
		});
		
		// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			logo: "required",
			order: "digits"
		}
	});
		
	});	
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 添加品牌
	</div>
	<form id="listForm" action="save.jhtml" method="post">
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					类型:
				</th>
				<td>
					<select id="type" name="type">
						[#list types as type]
							<option value="${type}">[#if type == "text"]文本[#else]图片[/#if]</option>
						[/#list]
					</select>
				</td>
			</tr>
			<tr>
				<th>
					logo:
				</th>
				<td>
					<span class="fieldSet">
						<input type="text" id="logo" name="logo" class="text" maxlength="200" disabled="disabled" />
						<input type="button" id="browserButton" class="button" value="选择文件" disabled="disabled" />
					</span>
				</td>
			</tr>
			<tr>
				<th>
					网址:
				</th>
				<td>
					<input type="text" name="url" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="order" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					介绍:
				</th>
				<td>
					<textarea id="editor" name="introduction" class="editor" style="height:350px"></textarea>
				</td>
			</tr>
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确 定" />
					<input type="button" class="button" value="返 回" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>