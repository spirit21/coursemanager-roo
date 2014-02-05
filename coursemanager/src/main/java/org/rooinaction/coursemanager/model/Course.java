package org.rooinaction.coursemanager.model;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findCoursesByNameLike", "findCoursesByCourseTypeAndRunDateBetween" })
public class Course {

    /**
     */
    @Column(name = "course_name")
    @Size(min = 1, max = 60)
    private String name;

    /**
     */
    @NotNull
    @Size(max = 1000)
    private String description;

    /**
     */
    @NotNull
    @DecimalMin("0.00")
    @DecimalMax("99999.99")
    @Digits(integer = 5, fraction = 2)
    private BigDecimal listPrice;

    /**
     */
    @NotNull
    @Column(name = "max_capacity")
    @Min(1L)
    @Max(9999L)
    private Integer maximumCapacity;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "MM/dd/yyyy")
    private Date runDate;

    /**
     */
    @NotNull
    @Enumerated(EnumType.STRING)
    private CourseTypeEnum courseType;

    /* @AssertTrue(message = "Price is invalid. No fractional values allowed.")
     public boolean isPriceValid() {
     if (listPrice == null) return true;
     BigDecimal remainder = listPrice.remainder(new BigDecimal("1.0"));
     return remainder.compareTo(new BigDecimal("0")) == 0;
     }*/
    /**
     */
    @ManyToOne
    private TrainingProgram trainingProgram;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "courses")
    private Set<Tag> tags = new HashSet<Tag>();
}
