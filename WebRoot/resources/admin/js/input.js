$().ready( function() {

	if ($.tools != null) {
		var $tab = $("#tab");
		var $title = $("#inputForm :input[title], #inputForm label[title]");

		// Tab效果
		$tab.tabs("table.tabContent, div.tabContent", {
			tabs: "input"
		});
	
		// 表单提示
		$title.tooltip({
			position: "center right",
			offset: [0, 4],
			effect: "fade"
		});
	}

	// 验证消息
	if($.validator != null) {
		$.extend($.validator.messages, {
		    required: "必填",
			email: "请输入正确格式的网址",
			url: "请输入合法的网址",
			date: "请输入合法的日期",
			dateISO: "请输入合法的日期(ISO)",
			pointcard: "什么鬼",
			number: "请输入合法的数字",
			digits: "只能输入整数",
			minlength: $.validator.format("请输入一个长度最少是3 的字符串"),
			maxlength: $.validator.format("请输入一个长度最多是10 的字符串"),
			rangelength: $.validator.format("请输入一个长度介于 5 和10 之间的字符串"),
			min: $.validator.format("请输入一个最小为 {0} 的值"),
			max: $.validator.format("请输入一个最大为 {0} 的值"),
			range: $.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
			accept: "请输入拥有合法后缀名的字符串",
			equalTo: "请再次输入相同的值",
			remote: "输入错误",
			integer: "只允许输入整数",
			positive: "只允许输入正数",
			negative: "只允许输入负数",
			decimal: "数值超出允许范围",
			pattern: "格式错误",
			extension: "文件格式错误"
		});
		
		$.validator.setDefaults({
			errorClass: "fieldError",
			ignore: ".ignore",
			ignoreTitle: true,
			errorPlacement: function(error, element) {
				var fieldSet = element.closest("span.fieldSet");
				if (fieldSet.size() > 0) {
					error.appendTo(fieldSet);
				} else {
					error.insertAfter(element);
				}
			},
			submitHandler: function(form) {
				$(form).find(":submit").prop("disabled", true);
				form.submit();
			}
		});
	}

});

// 编辑器
if(typeof(KindEditor) != "undefined") {
	KindEditor.ready(function(K) {
		editor = K.create("#editor", {
			height: "350px",
			items: [
				"source", "|", "undo", "redo", "|", "preview", "print", "template", "cut", "copy", "paste",
				"plainpaste", "wordpaste", "|", "justifyleft", "justifycenter", "justifyright",
				"justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent", "subscript",
				"superscript", "clearhtml", "quickformat", "selectall", "|", "fullscreen", "/",
				"formatblock", "fontname", "fontsize", "|", "forecolor", "hilitecolor", "bold",
				"italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image",
				"flash", "media", "insertfile", "table", "hr", "emoticons", "baidumap", "pagebreak",
				"anchor", "link", "unlink"
			]/*,
			langType: shopxx.locale,
			syncType: "form",
			filterMode: false,
			pagebreakHtml: '<hr class="pageBreak" \/>',
			allowFileManager: true,
			filePostName: "file",
			fileManagerJson: shopxx.base + "/admin/file/browser.jhtml",
			uploadJson: shopxx.base + "/admin/file/upload.jhtml",
			uploadImageExtension: setting.uploadImageExtension,
			uploadFlashExtension: setting.uploadFlashExtension,
			uploadMediaExtension: setting.uploadMediaExtension,
			uploadFileExtension: setting.uploadFileExtension,
			extraFileUploadParams: {
				token: getCookie("token")
			}*/,
			afterChange: function() {
				this.sync();
			}
		});
	});
}