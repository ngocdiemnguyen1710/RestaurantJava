/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.service;
import com.restaurant.pojo.Feedback;
import java.util.List;

/**
 *
 * @author OS
 */
public interface FeedbackService {
    List<Object[]> getFeedbacks(String kw);
    boolean addFeedback(Feedback f);
    Feedback getFbById(int fbId);
}
