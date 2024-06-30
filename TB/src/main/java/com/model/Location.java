package com.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TB_LOCATION")
public class Location {
	 @Id
	    @Column(name = "LOC_SEQ_ID")
	    private int locSeqId;

	    @Column(name = "LOCATION_NAME")
	    private String locationName;

	    @Column(name = "CREATED_BY")
	    private String createdBy;

	    @Column(name = "CREATED_ON")
	    private Date createdOn;

	    @Column(name = "MODIFIED_BY")
	    private String modifiedBy;

	    @Column(name = "MODIFIED_ON")
	    private Date modifiedOn;

		public int getLocSeqId() {
			return locSeqId;
		}

		public void setLocSeqId(int locSeqId) {
			this.locSeqId = locSeqId;
		}

		public String getLocationName() {
			return locationName;
		}

		public void setLocationName(String locationName) {
			this.locationName = locationName;
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
