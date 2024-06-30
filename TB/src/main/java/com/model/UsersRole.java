package com.model;

import java.util.Date;

public class UsersRole {
	private int roleSeqId;
	private String roleName;
	private String createdBy;
	private Date createdOn;
	private String modifiedBy;
	private Date modifiedOn;

	public UsersRole(int roleSeqId, String roleName, String createdBy, Date createdOn, String modifiedBy,
			Date modifiedOn) {
		super();
		this.roleSeqId = roleSeqId;
		this.roleName = roleName;
		this.createdBy = createdBy;
		this.createdOn = createdOn;
		this.modifiedBy = modifiedBy;
		this.modifiedOn = modifiedOn;
	}

	public int getRoleSeqId() {
		return roleSeqId;
	}
	public void setRoleSeqId(int roleSeqId) {
		this.roleSeqId = roleSeqId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public Date getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
}
