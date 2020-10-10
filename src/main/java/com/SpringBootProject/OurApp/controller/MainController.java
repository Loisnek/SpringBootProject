package com.SpringBootProject.OurApp.controller;

import com.SpringBootProject.OurApp.model.Orders;
import com.SpringBootProject.OurApp.model.Roles;
import com.SpringBootProject.OurApp.model.Users;
import com.SpringBootProject.OurApp.repo.OrdersRepo;
import com.SpringBootProject.OurApp.repo.UsersRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;

@Controller
@RequestMapping("/tables")
public class MainController {
    private UsersRepo usersRepo;

    @Autowired
    private OrdersRepo ordersRepo;

    public MainController(UsersRepo usersRepo) {
        this.usersRepo = usersRepo;
    }

    @GetMapping
    public String mainPage(Model model){
        Iterable<Orders> orders = ordersRepo.findAll();
        model.addAttribute("orders",orders);
        return "main";
    }
    @PostMapping("/save")
    public String saveEdit(){
        return "redirect:";
    }

    @PostMapping("/filter")
    public String filterById(@RequestParam(defaultValue = "",required = false) String filter, Model model){
        Iterable<Users> users;
        if(filter.isEmpty() || filter.equals(null)){
            users = usersRepo.findAll();
        }else {
            try{
                users = usersRepo.findUsersById(Long.parseLong(filter));
            }catch (NumberFormatException e){
                users = usersRepo.findAll();
            }
        }
        model.addAttribute("users",users);
        return "mainPage";
    }



}
