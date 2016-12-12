<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员注册项添加</title>
<meta name="author" content="U2SHOP" />
<meta name="copyright" content="U2SHOP" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $memberAttributeTable = $("#memberAttributeTable");
	var $type = $("#type");
	
	
// 表单验证
	$inputForm.validate({
		rules: {
			type: "required",
			name: "required",
			order: "digits"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 编辑会员注册项 <span>
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${memberAttribute.id}" />
		<input type="hidden" name="type" value="text" />
		<table id="memberAttributeTable" class="input">
			<tr>
				<th>
					类型:
				</th>
				<td>
					文本
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" value="${memberAttribute.name}" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td>
					<input type="text" name="order" value="${memberAttribute.order}" class="text" maxlength="9" />
				</td>
			</tr>
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true" [#if memberAttribute.isEnabled] checked="checked"[/#if]/>是否启用
						<input type="hidden" name="_isEnabled" value="false"  />
					</label>
					<label>
						<input type="checkbox" name="isRequired" value="true"  [#if memberAttribute.isRequired] checked="checked"[/#if]/>是否必填
						<input type="hidden" name="_isRequired" value="false" />
					</label>
				</td>
			</tr>
			<tr id="addOptionTr" class="hidden">
				<th>
					&nbsp;
				</th>
				<td>
					<a href="javascript:;" id="addOptionButton" class="button">添加</a>
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定" />
					<input type="button" class="button" value="返回" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>