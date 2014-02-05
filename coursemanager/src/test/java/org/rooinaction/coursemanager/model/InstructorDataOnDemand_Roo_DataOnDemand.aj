// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.model;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.rooinaction.coursemanager.model.Instructor;
import org.rooinaction.coursemanager.model.InstructorDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect InstructorDataOnDemand_Roo_DataOnDemand {
    
    declare @type: InstructorDataOnDemand: @Component;
    
    private Random InstructorDataOnDemand.rnd = new SecureRandom();
    
    private List<Instructor> InstructorDataOnDemand.data;
    
    public Instructor InstructorDataOnDemand.getNewTransientInstructor(int index) {
        Instructor obj = new Instructor();
        setActive(obj, index);
        setAddressLine1(obj, index);
        setAddressLine2(obj, index);
        setCity(obj, index);
        setEmailAddress(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setMiddleNameOrInitial(obj, index);
        setPostalCode(obj, index);
        setStateCode(obj, index);
        setTaxNumber(obj, index);
        return obj;
    }
    
    public void InstructorDataOnDemand.setActive(Instructor obj, int index) {
        Boolean active = true;
        obj.setActive(active);
    }
    
    public void InstructorDataOnDemand.setAddressLine1(Instructor obj, int index) {
        String addressLine1 = "addressLine1_" + index;
        if (addressLine1.length() > 60) {
            addressLine1 = addressLine1.substring(0, 60);
        }
        obj.setAddressLine1(addressLine1);
    }
    
    public void InstructorDataOnDemand.setAddressLine2(Instructor obj, int index) {
        String addressLine2 = "addressLine2_" + index;
        if (addressLine2.length() > 60) {
            addressLine2 = addressLine2.substring(0, 60);
        }
        obj.setAddressLine2(addressLine2);
    }
    
    public void InstructorDataOnDemand.setCity(Instructor obj, int index) {
        String city = "city_" + index;
        if (city.length() > 40) {
            city = city.substring(0, 40);
        }
        obj.setCity(city);
    }
    
    public void InstructorDataOnDemand.setEmailAddress(Instructor obj, int index) {
        String emailAddress = "foo" + index + "@bar.com";
        if (emailAddress.length() > 80) {
            emailAddress = emailAddress.substring(0, 80);
        }
        obj.setEmailAddress(emailAddress);
    }
    
    public void InstructorDataOnDemand.setFirstName(Instructor obj, int index) {
        String firstName = "firstName_" + index;
        if (firstName.length() > 30) {
            firstName = firstName.substring(0, 30);
        }
        obj.setFirstName(firstName);
    }
    
    public void InstructorDataOnDemand.setLastName(Instructor obj, int index) {
        String lastName = "lastName_" + index;
        if (lastName.length() > 30) {
            lastName = lastName.substring(0, 30);
        }
        obj.setLastName(lastName);
    }
    
    public void InstructorDataOnDemand.setMiddleNameOrInitial(Instructor obj, int index) {
        String middleNameOrInitial = "middleNameOrInitial_" + index;
        if (middleNameOrInitial.length() > 30) {
            middleNameOrInitial = middleNameOrInitial.substring(0, 30);
        }
        obj.setMiddleNameOrInitial(middleNameOrInitial);
    }
    
    public void InstructorDataOnDemand.setPostalCode(Instructor obj, int index) {
        String postalCode = "postalCo_" + index;
        if (postalCode.length() > 10) {
            postalCode = postalCode.substring(0, 10);
        }
        obj.setPostalCode(postalCode);
    }
    
    public void InstructorDataOnDemand.setStateCode(Instructor obj, int index) {
        String stateCode = "s" + index;
        if (stateCode.length() > 2) {
            stateCode = stateCode.substring(0, 2);
        }
        obj.setStateCode(stateCode);
    }
    
    public void InstructorDataOnDemand.setTaxNumber(Instructor obj, int index) {
        String taxNumber = "taxNumb_" + index;
        if (taxNumber.length() > 9) {
            taxNumber = taxNumber.substring(0, 9);
        }
        obj.setTaxNumber(taxNumber);
    }
    
    public Instructor InstructorDataOnDemand.getSpecificInstructor(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Instructor obj = data.get(index);
        Long id = obj.getId();
        return Instructor.findInstructor(id);
    }
    
    public Instructor InstructorDataOnDemand.getRandomInstructor() {
        init();
        Instructor obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Instructor.findInstructor(id);
    }
    
    public boolean InstructorDataOnDemand.modifyInstructor(Instructor obj) {
        return false;
    }
    
    public void InstructorDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Instructor.findInstructorEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Instructor' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Instructor>();
        for (int i = 0; i < 10; i++) {
            Instructor obj = getNewTransientInstructor(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
