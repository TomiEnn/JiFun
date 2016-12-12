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
	$("#filterSelect").mouseover(function(){
		var $this = $(this);
		var offset = $this.offset();
		var $menuWrap = $this.closest("div.menuWrap");
		var $popupMenu = $menuWrap.children("div.popupMenu");
		$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
		$menuWrap.mouseleave(function(){
			$popupMenu.hide();
		})
		
	});
});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; XXX列表
	</div>
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>删除
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>刷新
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="filterSelect" class="button">
						商品筛选<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="filterOption" class="check">
							<li>
								<a href="javascript:;" name="isMarketable" val="true"[#if isMarketable?? && isMarketable] class="checked"[/#if]>已上架</a>
							</li>
							<li>
								<a href="javascript:;" name="isMarketable" val="false"[#if isMarketable?? && !isMarketable] class="checked"[/#if]>未上架</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="isList" val="true"[#if isList?? && isList] class="checked"[/#if]>已列出</a>
							</li>
							<li>
								<a href="javascript:;" name="isList" val="false"[#if isList?? && !isList] class="checked"[/#if]>未列出</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="isTop" val="true"[#if isTop?? && isTop] class="checked"[/#if]>已置顶</a>
							</li>
							<li>
								<a href="javascript:;" name="isTop" val="false"[#if isTop?? && !isTop] class="checked"[/#if]>未置顶</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="isGift" val="true"[#if isGift?? && isGift] class="checked"[/#if]>赠品</a>
							</li>
							<li>
								<a href="javascript:;" name="isGift" val="false"[#if isGift?? && !isGift] class="checked"[/#if]>非赠品</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="isOutOfStock" val="false"[#if isOutOfStock?? && !isOutOfStock] class="checked"[/#if]>有货</a>
							</li>
							<li>
								<a href="javascript:;" name="isOutOfStock" val="true"[#if isOutOfStock?? && isOutOfStock] class="checked"[/#if]>缺货</a>
							</li>
							<li class="separator">
								<a href="javascript:;" name="isStockAlert" val="false"[#if isStockAlert?? && !isStockAlert] class="checked"[/#if]>库存正常</a>
							</li>
							<li>
								<a href="javascript:;" name="isStockAlert" val="true"[#if isStockAlert?? && isStockAlert] class="checked"[/#if]>库存紧张</a>
							</li>
						</ul>
					</div>
				</div>
				<a href="javascript:;" id="moreButton" class="button">更多选项</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						每页显示<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "name"] class="current"[/#if] val="name">名称</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "sn"] class="current"[/#if] val="sn">编号</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="sn">编号</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">名称</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="productCategory">商品分类</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="price">销售价</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="cost">成本价</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="stock">库存</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="isMarketable">是否上架</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">创建日期</a>
				</th>
				<th>
					<span>操作</span>
				</th>
			</tr>
			[#list page.content as product]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${product.id}" />
					</td>
					<td>
						${product.sn}
					</td>
					<td>
						<span title="${product.fullName}">
							${product.fullName}
							[#if product.isGift]
								<span class="gray">[赠品]</span>
							[/#if]
						</span>
					</td>
					<td>
						${product.productCategory.name}
					</td>
					<td>
						${product.price}
					</td>
					<td>
						${currency(product.cost)}
					</td>
					<td>
						[#if product.stock??]
							[#if product.allocatedStock == 0]
								<span[#if product.isOutOfStock] class="red"[/#if]>${product.stock}</span>
							[#else]
								<span[#if product.isOutOfStock] class="red"[/#if] title="库存: ${product.allocatedStock}">${product.stock}</span>
							[/#if]
						[/#if]
					</td>
					<td>
						<span class="${product.isMarketable?string("true", "false")}Icon">&nbsp;</span>
					</td>
					<td>
						<span title="${product.createDate?string("yyyy-MM-dd HH:mm:ss")}">${product.createDate}</span>
					</td>
					<td>
						<a href="edit.jhtml?id=${product.id}">[编辑]</a>
						[#if product.isMarketable]
							<a href="${base}${product.path}" target="_blank">[查看]</a>
						[#else]
							[不可看]
						[/#if]
					</td>
				</tr>
			[/#list]
		</table>
		</table>
</body>
</html>