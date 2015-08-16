// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.foamtec.qa.security;

import com.foamtec.qa.security.AppUser;
import com.foamtec.qa.security.AppUserDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect AppUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AppUserDataOnDemand: @Component;
    
    private Random AppUserDataOnDemand.rnd = new SecureRandom();
    
    private List<AppUser> AppUserDataOnDemand.data;
    
    public AppUser AppUserDataOnDemand.getNewTransientAppUser(int index) {
        AppUser obj = new AppUser();
        setDepartment(obj, index);
        setDepartmentCode(obj, index);
        setEmailAddress(obj, index);
        setEnabled(obj, index);
        setName(obj, index);
        setPassword(obj, index);
        setPhoneNumber(obj, index);
        setRoleName(obj, index);
        setUsername(obj, index);
        return obj;
    }
    
    public void AppUserDataOnDemand.setDepartment(AppUser obj, int index) {
        String department = "department_" + index;
        obj.setDepartment(department);
    }
    
    public void AppUserDataOnDemand.setDepartmentCode(AppUser obj, int index) {
        String departmentCode = "departmentCode_" + index;
        obj.setDepartmentCode(departmentCode);
    }
    
    public void AppUserDataOnDemand.setEmailAddress(AppUser obj, int index) {
        String emailAddress = "foo" + index + "@bar.com";
        obj.setEmailAddress(emailAddress);
    }
    
    public void AppUserDataOnDemand.setEnabled(AppUser obj, int index) {
        Integer enabled = new Integer(index);
        obj.setEnabled(enabled);
    }
    
    public void AppUserDataOnDemand.setName(AppUser obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void AppUserDataOnDemand.setPassword(AppUser obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void AppUserDataOnDemand.setPhoneNumber(AppUser obj, int index) {
        String phoneNumber = "phoneNumber_" + index;
        obj.setPhoneNumber(phoneNumber);
    }
    
    public void AppUserDataOnDemand.setRoleName(AppUser obj, int index) {
        String roleName = "roleName_" + index;
        obj.setRoleName(roleName);
    }
    
    public void AppUserDataOnDemand.setUsername(AppUser obj, int index) {
        String username = "username_" + index;
        obj.setUsername(username);
    }
    
    public AppUser AppUserDataOnDemand.getSpecificAppUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        AppUser obj = data.get(index);
        Long id = obj.getId();
        return AppUser.findAppUser(id);
    }
    
    public AppUser AppUserDataOnDemand.getRandomAppUser() {
        init();
        AppUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return AppUser.findAppUser(id);
    }
    
    public boolean AppUserDataOnDemand.modifyAppUser(AppUser obj) {
        return false;
    }
    
    public void AppUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = AppUser.findAppUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'AppUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<AppUser>();
        for (int i = 0; i < 10; i++) {
            AppUser obj = getNewTransientAppUser(i);
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
