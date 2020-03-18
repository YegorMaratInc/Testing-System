package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.forms.UserEditForm;
import ru.licpnz.testingsystem.models.UserRole;
import ru.licpnz.testingsystem.models.UserState;
import ru.licpnz.testingsystem.repositories.UserRepository;

@Controller
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/users")
    public String getUsersPage(ModelMap modelMap) {
        modelMap.addAttribute("users", userRepository.findAll());
        modelMap.addAttribute("states", UserState.values());
        modelMap.addAttribute("roles", UserRole.values());
        return "users";
    }

    @PostMapping("/users")
    public void editUser(UserEditForm userEditForm) {
        //User user = userRepository.findUserByLogin(userLogin).orElseThrow(NotFoundException::new);
        //user.setUserState(UserState.valueOf(userEditForm.getUserState()));
        //user.setUserRole(UserRole.valueOf(userEditForm.getUserRole()));
        UserRole userRole = UserRole.valueOf(userEditForm.getUserRole());
        UserState userState = UserState.valueOf(userEditForm.getUserState());
        System.out.println("userState = " + userState);
        System.out.println("userRole = " + userRole);
        //userRepository.save(user);
    }
}
