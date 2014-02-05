package org.rooinaction.coursemanager.model;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Offering {
	
	@Temporal(TemporalType.DATE)
	@NotNull
	private Date offerDate;
	
	@NotNull
	@Size(min = 1, max = 80)
	private String locationName;
	
	@ManyToOne(cascade = CascadeType.ALL)
	private Course course;
	
	@ManyToOne(cascade = CascadeType.ALL)
	private Instructor instructor;
	
}
