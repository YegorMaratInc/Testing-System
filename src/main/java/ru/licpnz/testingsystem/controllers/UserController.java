package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.licpnz.testingsystem.repositories.UserRepository;

@RestController("/users")
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public String getUsersPage(ModelMap modelMap) {
        modelMap.addAttribute("users", userRepository.findAll());
        return "users";
    }

}
