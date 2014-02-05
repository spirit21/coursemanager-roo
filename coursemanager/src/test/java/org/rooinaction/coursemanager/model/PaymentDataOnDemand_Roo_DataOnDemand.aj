// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.model;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.rooinaction.coursemanager.model.Payment;
import org.rooinaction.coursemanager.model.PaymentDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect PaymentDataOnDemand_Roo_DataOnDemand {
    
    declare @type: PaymentDataOnDemand: @Component;
    
    private Random PaymentDataOnDemand.rnd = new SecureRandom();
    
    private List<Payment> PaymentDataOnDemand.data;
    
    public Payment PaymentDataOnDemand.getNewTransientPayment(int index) {
        Payment obj = new Payment();
        setDate(obj, index);
        setValue(obj, index);
        return obj;
    }
    
    public void PaymentDataOnDemand.setDate(Payment obj, int index) {
        Calendar date = Calendar.getInstance();
        obj.setDate(date);
    }
    
    public void PaymentDataOnDemand.setValue(Payment obj, int index) {
        Double value = new Integer(index).doubleValue();
        obj.setValue(value);
    }
    
    public Payment PaymentDataOnDemand.getSpecificPayment(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Payment obj = data.get(index);
        Integer id = obj.getIdpayment();
        return Payment.findPayment(id);
    }
    
    public Payment PaymentDataOnDemand.getRandomPayment() {
        init();
        Payment obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getIdpayment();
        return Payment.findPayment(id);
    }
    
    public boolean PaymentDataOnDemand.modifyPayment(Payment obj) {
        return false;
    }
    
    public void PaymentDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Payment.findPaymentEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Payment' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Payment>();
        for (int i = 0; i < 10; i++) {
            Payment obj = getNewTransientPayment(i);
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
