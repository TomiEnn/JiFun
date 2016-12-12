<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员添加</title>
<meta name="author" content="U2SHOP" />
<meta name="copyright" content="U2SHOP" />
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.lSelect.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<script type="text/javascript" src="${base}/resources/admin/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	var $areaId = $("#areaId");
	
	
	
	// 表单验证
	$inputForm.validate({
		rules: {
			username: {
				required: true,
				remote: {
					url: "checkNameExist.jhtml",
					cache: false
				}
			},
			password: {
				minlength: 4,
				maxlength: 20,
				pattern: /^[^\s&\"<>]+$/,
			},
			rePassword: {
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			},
			point: {
				required: true,
				digits: true
			},
			balance: {
				required: true,
				min: 0,
				decimal: {
					integer: 12,
					fraction: "不符合"
				}
			}
		},
		messages: {
			username: {
				pattern: "不符合",
				remote: "用户名已存在"
			},
			password: {
				pattern: "不符合"
			}
				
		}
	});

});
</script>
</head>
<body>
	<div class="path">
		<a href="${base}/admin/common/index.jhtml">首页</a> &raquo; 会员编辑<span>
	</div>
	<form id="inputForm" action="update.jhtml" method="post">
		<input type="hidden" name="id" value="${member.id}" />
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="基本信息" />
			</li>
			[#if memberAttributes?has_content]
				<li>
					<input type="button" value="个人资料" />
				</li>
			[/#if]
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					用户名:
				</th>
				<td>
					${member.username}				
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
					确认密码:
				</th>
				<td>
					<input type="password" name="rePassword" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>邮箱:
				</th>
				<td>
					<input type="text" name="email" value="${member.email}"  class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					会员等级：
				</th>
				<td>
					超神级
				</td>
			</tr>
			<tr>
				<th>
					设置:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true" checked="checked" />是否启用
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
				</td>
			</tr>
			<tr>
				<th>
					消费金额:
				</th>
				<td>
					￥ ${member.amount}
				</td>
			</tr>
			<tr>
				<th>
					创建日期:
				</th>
				<td>
					${member.createDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
			<tr>
				<th>
					注册IP:
				</th>
				<td>
					${member.registerIp}
				</td>
			</tr>
		</table>
		[#if memberAttributes?has_content]
			<table class="input tabContent">
				[#list memberAttributes as memberAttribute]
					<tr>
						<th>
							[#if memberAttribute.isRequired]<span class="requiredField">*</span>[/#if]${memberAttribute.name}:
						</th>
						<td>
							[#if memberAttribute.type == "name"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.name}" maxlength="200" />
							[#elseif memberAttribute.type == "gender"]
								<span class="fieldSet">
									[#list genders as gender]
										<label>
											<input type="radio" name="memberAttribute_${memberAttribute.id}" value="${gender}"[#if gender == member.gender] checked="checked"[/#if] />[#if gender == "male"]男[#else]女[/#if]
										</label>
							[/#list]
								</span>
							[#elseif memberAttribute.type == "birth"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text Wdate" value="${member.birth}" onfocus="WdatePicker();" />
							[#elseif memberAttribute.type == "area"]
								<span class="fieldSet">
									<input type="hidden" id="areaId" name="memberAttribute_${memberAttribute.id}" value="${(member.area.id)!}" treePath="${(member.area.treePath)!}" />
								</span>
							[#elseif memberAttribute.type == "address"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.address}" maxlength="200" />
							[#elseif memberAttribute.type == "zipCode"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.zipCode}" maxlength="200" />
							[#elseif memberAttribute.type == "phone"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.phone}" maxlength="200" />
							[#elseif memberAttribute.type == "mobile"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.mobile}" maxlength="200" />
							[#elseif memberAttribute.type == "text"]
								<input type="text" name="memberAttribute_${memberAttribute.id}" class="text" value="${member.getAttributeValue(memberAttribute)}" maxlength="200" />
							[#elseif memberAttribute.type == "select"]
								<select name="memberAttribute_${memberAttribute.id}">
									<option value="">${message("admin.common.choose")}</option>
									[#list memberAttribute.options as option]
										<option value="${option}"[#if option == member.getAttributeValue(memberAttribute)] selected="selected"[/#if]>
											${option}
										</option>
									[/#list]
								</select>
							[#elseif memberAttribute.type == "checkbox"]
								<span class="fieldSet">
									[#list memberAttribute.options as option]
										<label>
											<input type="checkbox" name="memberAttribute_${memberAttribute.id}" value="${option}"[#if (member.getAttributeValue(memberAttribute)?seq_contains(option))!] checked="checked"[/#if] />${option}
										</label>
									[/#list]
								</span>
							[/#if]
						</td>
					</tr>
				[/#list]
			</table>
		[/#if]
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