<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Powered By U2SHOP</title>
<meta name="author" content="Tomi_Jay" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/admin/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<style type="text/css">
*{
	font: 12px tahoma, Arial, Verdana, sans-serif;
}
html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $nav = $("#nav a:not(:last)");
	var $menu = $("#menu dl");
	var $menuItem = $("#menu a");
	
	$nav.click(function() {
		var $this = $(this);
		$nav.removeClass("current");
		$this.addClass("current");
		var $currentMenu = $($this.attr("href"));
		$menu.hide();
		$currentMenu.show();
		return false;
	});
	
	$menuItem.click(function() {
		var $this = $(this);
		$menuItem.removeClass("current");
		$this.addClass("current");
	});

});
</script>
</head>
<body>
	<script type="text/javascript">
		if (self != top) {
			top.location = self.location;
		};
	</script>
	<table class="main">
		<tr>
			<th class="logo">
				<a href="main.jhtml">
					<!-- <img src="${base}/resources/admin/images/header_logo.gif" alt="U2SHOP" /> -->
					U2SHOP
				</a>
			</th>
			<th>
				<div id="nav" class="nav">
					<ul>
						<li>
							<a href="#product">商品</a>
						</li>
						<li>
							<a href="#content">内容</a>
						</li>
						<li>
							<a href="#member">会员</a>
						</li>
						<li>
							<a href="#system">系统</a>
						</li>
						<li>
							<a href="../../shop/login/index.jhtml">首页</a>
						</li>
					</ul>
				</div>
				<div class="link">
					<a href="#" target="_blank">我的博客</a>|
					<a href="#">我的微博</a>|
					<a href="#" target="_blank">关于我</a>
				</div>
				<div class="link">
					<strong>[Tomi_Jay]</strong>
					您好!
					<a href="#" target="iframe">[账号设置]</a>
					<a href="#" target="_top">[注销]</a>
				</div>
			</th>
		</tr>
		
		<tr>
			<td id="menu" class="menu">
				<dl id="product" class="default">
					<dt>商品管理</dt>
					<dd>
						<a href="../product/list.jhtml" target="iframe">商品管理</a>
					</dd>
					<dd>
						<a href="../product_category/list.jhtml" target="iframe">商品分类</a>
					</dd>
					<dd>
						<a href="../brand/list.jhtml" target="iframe">品牌管理</a>
					</dd>
				</dl>
				<dl id="content" >
					<dt>内容管理</dt>
					<dd>
						<a href="../article/list.jhtml" target="iframe">文章管理</a>
					</dd>
					<dd>
						<a href="../article_category/list.jhtml" target="iframe">文章分类</a>
					</dd>
					<dd>
						<a href="../tag/list.jhtml" target="iframe">标签管理</a>
					</dd>
				</dl>	
				<dl id="member" >
					<dt>订单管理</dt>
					<dd>
						<a href="../member/list.jhtml" target="iframe">会员管理</a>
					</dd>
					<dd>
						<a href="../member_attribute/list.jhtml" target="iframe">会员注册项</a>
					</dd>
				</dl>
				<dl id="system" >
					<dt>系统管理</dt>
					<dd>
						<a href="../admin/list.jhtml" target="iframe">管理员</a>
					</dd>
					<dd>
						<a href="../role/list.jhtml" target="iframe">角色管理</a>
					</dd>
				</dl>
			</td>
			<td>
				<iframe id="iframe" name="iframe" src="index.jhtml" frameborder="0"></iframe>
			</td>
		</tr>		
	</table>
</body>
</html>