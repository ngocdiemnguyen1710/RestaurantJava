/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.repository;

import com.restaurant.pojo.Bill;
import com.restaurant.pojo.Book;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 *
 * @author HP
 */
public interface BillStatsRepository {
    List<Object[]> getBillStats(Date fromDate, Date toDate);
    Bill getBillById(int billId);
    boolean addBill(Bill bill);
}
