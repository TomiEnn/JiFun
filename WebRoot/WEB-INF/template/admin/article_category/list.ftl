<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>文章分类管理 </title>
<meta name="author" content="U2SHOP" />
<meta name="copyright" content="U2SHOP" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $delete = $("#listTable a.delete");
	// 删除
	$delete.click(function() {
		var $this = $(this);
		$.dialog({
			type: "warn",
			content: "你确定要删除?",
			onOk: function() {
				$.ajax({
					url: "delete.jhtml",
					type: "POST",
					data: {id: $this.attr("val")},
					dataType: "json",
					cache: false,
					success: function(message) {
						if (message.type == "success") {
							$this.closest("tr").remove();
						}
					}
				});
			}
		});
		return false;
	});

});

</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 文章分类列表 
	</div>
	<div class="bar">
		<a href="add.jhtml" class="iconButton">
			<span class="addIcon">&nbsp;</span>添加
		</a>
		<a href="javascript:;" id="refreshButton" class="iconButton">
			<span class="refreshIcon">&nbsp;</span>刷新
		</a>
	</div>
	<table id="listTable" class="list">
		<tr>
			<th>
				<span>名称</span>
			</th>
			<th>
				<span>排序</span>
			</th>
			<th>
				<span>操作</span>
			</th>
		</tr>
		[#list articleCategoryTree as articleCategory]
			<tr>
				<td>
					<span style="margin-left: ${articleCategory.grade * 20}px;[#if articleCategory.grade == 0] color: #000000;[/#if]">
						${articleCategory.name}
					</span>
				</td>
				<td>
					${articleCategory.order}
				</td>
				<td>
					<a href="${base}${articleCategory.path}" target="_blank">[查看]</a>
					<a href="edit.jhtml?id=${articleCategory.id}">[编辑]</a>
					<a href="javascript:;" class="delete" val="${articleCategory.id}">[删除]</a>
				</td>
			</tr>
		[/#list]
	</table>
</body>
</html>