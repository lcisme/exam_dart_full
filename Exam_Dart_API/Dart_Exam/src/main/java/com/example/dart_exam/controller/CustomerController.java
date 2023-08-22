package com.example.dart_exam.controller;

import com.example.dart_exam.entity.CustomerEntity;
import com.example.dart_exam.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/customers")
public class CustomerController {
    private CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public List<CustomerEntity> getAllCustomer(){
        return customerService.getAllCustomer();
    }

    @PostMapping
    public CustomerEntity createCustomer(@RequestBody CustomerEntity ctmE){
        return customerService.createCustomer(ctmE);
    }
}
