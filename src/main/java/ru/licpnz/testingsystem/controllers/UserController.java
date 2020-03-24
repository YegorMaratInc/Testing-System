package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.UserEditForm;
import ru.licpnz.testingsystem.forms.UserForm;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.models.UserRole;
import ru.licpnz.testingsystem.models.UserState;
import ru.licpnz.testingsystem.repositories.UserRepository;
import ru.licpnz.testingsystem.services.SignUpService;

@Controller
public class UserController {

    private final UserRepository userRepository;

    private final SignUpService signUpService;

    @Autowired
    public UserController(UserRepository userRepository, SignUpService signUpService) {
        this.userRepository = userRepository;
        this.signUpService = signUpService;
    }

    @GetMapping("/users")
    public String getUsersPage(ModelMap modelMap) {
        modelMap.addAttribute("users", userRepository.findAll());
        modelMap.addAttribute("states", UserState.values());
        modelMap.addAttribute("roles", UserRole.values());
        return "users";
    }

    @PostMapping("/users")
    public ResponseEntity<Object> editUser(@RequestBody UserEditForm userEditForm) {
        User user = userRepository.findById(userEditForm.getUser()).orElseThrow(NotFoundException::new);
        user.setUserState(UserState.valueOf(userEditForm.getUserState()));
        user.setUserRole(UserRole.valueOf(userEditForm.getUserRole()));
        userRepository.save(user);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/createGhost")
    public String getCreateGhostPage() {
        return "createGhost";
    }

    @PostMapping("/createGhost")
    public String createGhost(UserForm userCreateForm, ModelMap modelMap) {
        if (userRepository.findUserByLogin(userCreateForm.getLogin()).isPresent()) {
            modelMap.addAttribute("signupError", "true");
            modelMap.addAttribute("alert", "Имя пользователя занято");
            return "createGhost";
        }
        signUpService.signUp(userCreateForm, UserRole.GHOST);
        return "redirect:/users";
    }


}
