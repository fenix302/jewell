package work.iamport;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class PaymentBean implements Serializable{

	private String imp_uid;
	private String merchant_uid;
	private int paid_amount;
	private String apply_num;
	private Date paid_at;

	
	public PaymentBean() {
		super();
	}
	
	public PaymentBean(String imp_uid, String merchant_uid, int paid_amount, String apply_num, Date paid_at) {
		super();
		this.imp_uid = imp_uid;
		this.merchant_uid = merchant_uid;
		this.paid_amount = paid_amount;
		this.apply_num = apply_num;
		this.paid_at = paid_at;
	}
	
	
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(int paid_amount) {
		this.paid_amount = paid_amount;
	}
	public String getApply_num() {
		return apply_num;
	}
	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}
	public Date getPaid_at() {
		return paid_at;
	}
	public void setPaid_at(Date paid_at) {
		this.paid_at = paid_at;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("PaymentBean [imp_uid=");
		builder.append(imp_uid);
		builder.append(", merchant_uid=");
		builder.append(merchant_uid);
		builder.append(", paid_amount=");
		builder.append(paid_amount);
		builder.append(", apply_num=");
		builder.append(apply_num);
		builder.append(", paid_at=");
		builder.append(paid_at);
		builder.append("]");
		return builder.toString();
	}
	
}
