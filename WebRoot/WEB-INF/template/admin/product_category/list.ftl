<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>kkk  </title>
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
			content: "您确定要删除吗？",
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
						if (message.type == "error") {
							$.dialog({
								type: "warn",
								content: message.content
							});
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
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 商品分类列表
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
					<a href="javascript:;" class="sort" name="name">名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="logo">排列</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			
			[#list productCategoryTree as productCategory]
				<tr>
					<td>
						<span style="margin-left: ${productCategory.grade * 20}px;[#if productCategory.grade == 0]color: #000000;[/#if]">
							${productCategory.name}
						</span>
					</td>
					<td>
						${productCategory.order}
					</td>
					<td>
						<a href="${base}${productCategory.path}" target="_blank">[查看]</a>
						<a href="edit.jhtml?id=${productCategory.id}">[编辑]</a>
						<a href="javascript:;" class="delete" val="${productCategory.id}">[删除]</a>
					</td>
				</tr>
			[/#list]
		</table>
</body>
</html>