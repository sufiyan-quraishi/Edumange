package com.edumanage.service;

import com.edumanage.model.Inquiry;
import com.edumanage.repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InquiryService {

    @Autowired
    private InquiryRepository inquiryRepository;

    public Inquiry save(Inquiry inquiry) {
        return inquiryRepository.save(inquiry);
    }

    public List<Inquiry> findAll() {
        return inquiryRepository.findAll();
    }

    public Inquiry findById(Long id) {
        return inquiryRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Inquiry not found: " + id));
    }

    public void updateStatus(Long id, Inquiry.Status status) {
        Inquiry inquiry = findById(id);
        inquiry.setStatus(status);
        inquiryRepository.save(inquiry);
    }
}
