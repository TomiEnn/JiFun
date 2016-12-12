package net.u2shop.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Entity-品牌
 *
 *@author Tomi_Jay
 *@version 1.0
 */
@Entity
@Table(name="uu_brand")
@SequenceGenerator(sequenceName="sequenceGenerator", name="uu_brand_sequence")
public class Brand extends OrderEntity {
	
	private static final long serialVersionUID = -6109590619136943215L;
	/**
	 * 类型
	 */
	public enum Type{
		text,image
	}
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 类型
	 */
	private Type type;
	/**
	 * Logo
	 */
	private String logo;
	/**
	 * 简介
	 */
	private String introduction;
	/**
	 * 网址
	 */
	private String url;
	
	/** 商品分类 */
	private Set<ProductCategory> productCategories = new HashSet<ProductCategory>();
	
	
	@NotEmpty
	@Column(nullable=false)
	@Length(max=200)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull
	@Column(nullable = false)
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	
	@Length(max = 200)
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	@Lob
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	@Length(max = 200)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	/**
	 * 获取商品分类
	 * 
	 * @return 商品分类
	 */
	@ManyToMany(mappedBy = "brands", fetch = FetchType.LAZY)
	@OrderBy("order asc")
	public Set<ProductCategory> getProductCategories() {
		return productCategories;
	}

	/**
	 * 设置商品分类
	 * 
	 * @param productCategories
	 *            商品分类
	 */
	public void setProductCategories(Set<ProductCategory> productCategories) {
		this.productCategories = productCategories;
	}
	
}
