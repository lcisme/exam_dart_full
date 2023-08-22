package com.example.dart_exam.service;

import com.example.dart_exam.entity.CustomerEntity;
import com.example.dart_exam.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {
    private CustomerRepository customerRepository;

    @Autowired
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public List<CustomerEntity> getAllCustomer(){
        return customerRepository.findAll();
    };

    public CustomerEntity createCustomer(CustomerEntity ctmE) {
        return customerRepository.save(ctmE);
    }
}
