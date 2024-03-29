// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Version;
import org.rooinaction.coursemanager.model.Person;

privileged aspect Person_Roo_Jpa_Entity {
    
    declare @type: Person: @Entity;
    
    declare @type: Person: @Inheritance(strategy = InheritanceType.TABLE_PER_CLASS);
    
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "id")
    private Long Person.id;
    
    @Version
    @Column(name = "version")
    private Integer Person.version;
    
    public Long Person.getId() {
        return this.id;
    }
    
    public void Person.setId(Long id) {
        this.id = id;
    }
    
    public Integer Person.getVersion() {
        return this.version;
    }
    
    public void Person.setVersion(Integer version) {
        this.version = version;
    }
    
}
