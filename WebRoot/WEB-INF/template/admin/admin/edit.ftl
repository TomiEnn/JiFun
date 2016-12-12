<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理员编辑</title>
<meta name="author" content="U2SHOP" />
<meta name="copyright" content="U2SHOP" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">
.roles label {
	width: 150px;
	display: block;
	float: left;
	padding-right: 5px;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	
	// 表单验证
	$inputForm.validate({
		rules: {
			password: {
				pattern: /^[^\s&\"<>]+$/,
				minlength: 4,
				maxlength: 20
			},
			rePassword: {
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			},
			roleIds: "required"
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 编辑管理员 
	</div>
	<form id="inputForm" action="save.jhtml" method="post">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="基本信息" />
			</li>
			<li>
				<input type="button" value="个人信息" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					用户名:
				</th>
				<td>
					${admin.username}
				</td>
			</tr>
			<tr>
				<th>
					密码:
				</th>
				<td>
					<input type="password" id="password" name="password" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>确认密码:
				</th>
				<td>
					<input type="password" name="rePassword" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>E-mail:
				</th>
				<td>
					<input type="text" name="email" class="text" value="${admin.email}" maxlength="200" />
				</td>
			</tr>
			<tr class="roles">
				<th>
					<span class="requiredField">*</span>角色:
				</th>
				<td>
					<span class="fieldSet">
						[#list roles as role]
							<label>
								<input type="checkbox" name="roleIds" value="${role.id}"[#if admin.roles?seq_contains(role)] checked="checked"[/#if] />${role.name}
							</label>
						[/#list]
					</span>
				</td>
			</tr>
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true"[#if admin.isEnabled] checked="checked"[/#if] />无效
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
					[#if admin.isLocked]
						<label>
							<input type="checkbox" name="isLocked" value="true" checked="checked" />上锁
							<input type="hidden" name="_isLocked" value="false" />
						</label>
					[/#if]
				</td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr>
				<th>
					部门:
				</th>
				<td>
					<input type="text" name="department" class="text" value="${admin.department}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					姓名:
				</th>
				<td>
					<input type="text" name="name" class="text" value="${admin.name}" maxlength="200" />
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确认" />
					<input type="button" class="button" value="返回" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>