package db;

public class PurchaseListDTO {
	
	private int purchaseno;
	private String name;
	private int price;
	private String img;
  private int quantity;
  private String deliverDate;
  private int deliverFee;
  private int color;
  private int sizeOpt;
  
	public int getPurchaseno() {
		return purchaseno;
	}
	public void setPurchaseno(int purchaseno) {
		this.purchaseno = purchaseno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDeliverDate() {
		return deliverDate;
	}
	public void setDeliverDate(String deliverDate) {
		this.deliverDate = deliverDate;
	}
	public int getDeliverFee() {
		return deliverFee;
	}
	public void setDeliverFee(int deliverFee) {
		this.deliverFee = deliverFee;
	}
	public int getColor() {
		return color;
	}
	public void setColor(int color) {
		this.color = color;
	}
	public int getSizeOpt() {
		return sizeOpt;
	}
	public void setSizeOpt(int sizeOpt) {
		this.sizeOpt = sizeOpt;
	}
	
}
