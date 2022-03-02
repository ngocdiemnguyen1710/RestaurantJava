/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.service;

import com.restaurant.pojo.Employee;
import java.util.List;

/**
 *
 * @author HP
 */
public interface EmployeeService {
    List<Employee> getEmployeies(String kw);  
    boolean addOrUpdateEmployee(Employee emp);
    boolean deleteEmployee(int EmployeeId);
    Employee getEmpById(int empId);
}
