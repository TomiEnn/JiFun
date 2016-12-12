package net.u2shop;

/**
 * 公共参数
 *
 *@author Tomi_Jay
 *@version 1.0
 */
public final class CommonAttributes {

	/** 日期格式配比 */
	public static final String[] DATE_PATTERNS = new String[] { "yyyy", "yyyy-MM", "yyyyMM", "yyyy/MM", "yyyy-MM-dd", "yyyyMMdd", "yyyy/MM/dd", "yyyy-MM-dd HH:mm:ss", "yyyyMMddHHmmss", "yyyy/MM/dd HH:mm:ss" };

	/** u2shop.xml文件路径 */
	public static final String U2SHOP_XML_PATH = "/u2shop.xml";

	/** u2shop.properties文件路径 */
	public static final String U2SHOP_PROPERTIES_PATH = "/u2shop.properties";

	/**
	 * 不可实例化
	 */
	private CommonAttributes() {
	}

}