package org.rooinaction.coursemanager.model;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class TrainingProgram {

    /**
     */
    private String name;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "trainingProgram")
    private Set<Course> courses = new HashSet<Course>();
}
