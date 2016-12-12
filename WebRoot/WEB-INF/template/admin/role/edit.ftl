<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>角色编辑</title>
<meta name="author" content="U2SHOP" />
<meta name="copyright" content="U2SHOP" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">
.authorities label {
	min-width: 120px;
	_width: 120px;
	display: block;
	float: left;
	padding-right: 4px;
	_white-space: nowrap;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $selectAll = $("#inputForm .selectAll");
	
	
	$selectAll.click(function() {
		var $this = $(this);
		var $thisCheckbox = $this.closest("tr").find(":checkbox");
		if ($thisCheckbox.filter(":checked").size() > 0) {
			$thisCheckbox.prop("checked", false);
		} else {
			$thisCheckbox.prop("checked", true);
		}
		return false;
	});
	
	// 表单验证
	$inputForm.validate({
		rules: {
			name: "required",
			authorities: "required"
		}
	});
	
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 编辑角色
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${role.id}" />
		<table class="input">
			<tr>
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td>
					<input type="text" name="name" class="text" value="${role.name}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					描述:
				</th>
				<td>
					<input type="text" name="description" class="text" value="${role.description}" maxlength="200" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					&nbsp;
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="全选">商品管理</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:product" [#if role.authorities?seq_contains("admin:product")] checked="checked"[/#if] />商品管理
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:productCategory" [#if role.authorities?seq_contains("admin:productCategory")] checked="checked"[/#if] />商品分类管理
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:brand" [#if role.authorities?seq_contains("admin:brand")] checked="checked"[/#if] />品牌管理
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="全选">会议管理</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:member" [#if role.authorities?seq_contains("admin:member")] checked="checked"[/#if] />会员管理
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:memberAttribute" [#if role.authorities?seq_contains("admin:memberAttribute")] checked="checked"[/#if] />会员注册项
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="全选">内容管理</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:article" [#if role.authorities?seq_contains("admin:article")] checked="checked"[/#if] />文章管理
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:articleCategory" [#if role.authorities?seq_contains("admin:articleCategory")] checked="checked"[/#if] />文章分类管理
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:tag" [#if role.authorities?seq_contains("admin:tag")] checked="checked"[/#if] />标签管理
						</label>
					</span>
				</td>
			</tr>
			<tr class="authorities">
				<th>
					<a href="javascript:;" class="selectAll" title="全选">系统管理</a>
				</th>
				<td>
					<span class="fieldSet">
						<label>
							<input type="checkbox" name="authorities" value="admin:admin" [#if role.authorities?seq_contains("admin:admin")] checked="checked"[/#if] />管理员管理
						</label>
						<label>
							<input type="checkbox" name="authorities" value="admin:role" [#if role.authorities?seq_contains("admin:role")] checked="checked"[/#if] />角色管理
						</label>
					</span>
				</td>
			</tr>
			[#if role.isSystem]
				<tr>
					<th>
						&nbsp;
					</th>
					<td>
						<span class="tips">不容许编辑</span>
					</td>
				</tr>
			[/#if]
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="确定"[#if role.isSystem] disabled="disabled"[/#if] />
					<input type="button" class="button" value="返回" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>