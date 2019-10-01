package com.parboot.domain;

public class TossRequestVO {
	
	private String orderNo;
	private int amount;
	private int amountTaxFree;
	private String productDesc;
	private String apiKey;
	private boolean autoExecute;
	private String resultCallback;
	private String retUrl;
	private String retCancelUrl;
	
	public TossRequestVO() {}

	public TossRequestVO(String orderNo, int amount, int amountTaxFree, String productDesc, String apiKey,
			boolean autoExecute, String resultCallback, String retUrl, String retCancelUrl) {
		super();
		this.orderNo = orderNo;
		this.amount = amount;
		this.amountTaxFree = amountTaxFree;
		this.productDesc = productDesc;
		this.apiKey = apiKey;
		this.autoExecute = autoExecute;
		this.resultCallback = resultCallback;
		this.retUrl = retUrl;
		this.retCancelUrl = retCancelUrl;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getAmountTaxFree() {
		return amountTaxFree;
	}

	public void setAmountTaxFree(int amountTaxFree) {
		this.amountTaxFree = amountTaxFree;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getApiKey() {
		return apiKey;
	}

	public void setApiKey(String apiKey) {
		this.apiKey = apiKey;
	}

	public boolean isAutoExecute() {
		return autoExecute;
	}

	public void setAutoExecute(boolean autoExecute) {
		this.autoExecute = autoExecute;
	}

	public String getResultCallback() {
		return resultCallback;
	}

	public void setResultCallback(String resultCallback) {
		this.resultCallback = resultCallback;
	}

	public String getRetUrl() {
		return retUrl;
	}

	public void setRetUrl(String retUrl) {
		this.retUrl = retUrl;
	}

	public String getRetCancelUrl() {
		return retCancelUrl;
	}

	public void setRetCancelUrl(String retCancelUrl) {
		this.retCancelUrl = retCancelUrl;
	}

	@Override
	public String toString() {
		return "TossRequestVO [orderNo=" + orderNo + ", amount=" + amount + ", amountTaxFree=" + amountTaxFree
				+ ", productDesc=" + productDesc + ", apiKey=" + apiKey + ", autoExecute=" + autoExecute
				+ ", resultCallback=" + resultCallback + ", retUrl=" + retUrl + ", retCancelUrl=" + retCancelUrl + "]";
	}
}
