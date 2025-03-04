package com.theena.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "`order`")
public class Order {
		
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    private String customerName;
    private String customerEmail;
    private String packageType;
    private String status; 
    private String details;
    private Long assignedEmployeeId;
    private String razorpayOrderId;
	public Order() {
		super();
	}
	public Order(Long id, String customerName, String customerEmail, String packageType, String status, String details,
			Long assignedEmployeeId, String razorpayOrderId) {
		super();
		this.id = id;
		this.customerName = customerName;
		this.customerEmail = customerEmail;
		this.packageType = packageType;
		this.status = status;
		this.details = details;
		this.assignedEmployeeId = assignedEmployeeId;
		this.razorpayOrderId = razorpayOrderId;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getPackageType() {
		return packageType;
	}
	public void setPackageType(String packageType) {
		this.packageType = packageType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Long getAssignedEmployeeId() {
		return assignedEmployeeId;
	}
	public void setAssignedEmployeeId(Long assignedEmployeeId) {
		this.assignedEmployeeId = assignedEmployeeId;
	}
	public String getRazorpayOrderId() {
		return razorpayOrderId;
	}
	public void setRazorpayOrderId(String razorpayOrderId) {
		this.razorpayOrderId = razorpayOrderId;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", customerName=" + customerName + ", customerEmail=" + customerEmail
				+ ", packageType=" + packageType + ", status=" + status + ", details=" + details
				+ ", assignedEmployeeId=" + assignedEmployeeId + ", razorpayOrderId=" + razorpayOrderId + "]";
	}
	
    
}
