package com.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "TB_SHOWS")
public class Show {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "show_id_seq")
	@SequenceGenerator(name = "show_id_seq", sequenceName = "show_id_seq", allocationSize = 1)
	@Column(name = "SHOW_ID")
	private Long showId;

    @Column(name = "MOVIE_NAME")
    private String movieName;

    @Column(name = "MOVIE_DURATION")
    private Integer movieDuration;

    @Column(name = "THEATRE_NAME")
    private String theatreName;

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

	public Long getShowId() {
		return showId;
	}

	public void setShowId(Long showId) {
		this.showId = showId;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public Integer getMovieDuration() {
		return movieDuration;
	}

	public void setMovieDuration(Integer movieDuration) {
		this.movieDuration = movieDuration;
	}

	public String getTheatreName() {
		return theatreName;
	}

	public void setTheatreName(String theatreName) {
		this.theatreName = theatreName;
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