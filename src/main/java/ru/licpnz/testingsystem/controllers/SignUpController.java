package ru.licpnz.testingsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.forms.UserForm;
import ru.licpnz.testingsystem.repositories.UserRepository;
import ru.licpnz.testingsystem.services.SignUpService;

/**
 * 28/11/2019
 * SignUpController
 *
 * @author havlong
 * @version 1.0
 */
@Controller
public class SignUpController {

    private final SignUpService signUpService;

    private final UserRepository userRepository;

    public SignUpController(SignUpService signUpService, UserRepository userRepository) {
        this.signUpService = signUpService;
        this.userRepository = userRepository;
    }

    @GetMapping("/signUp")
    public String getSignUpPage() {
        return "signUp";
    }

    @PostMapping("/signUp")
    public String signUp(UserForm userForm, ModelMap modelMap) {
        if (userRepository.findUserByLogin(userForm.getLogin()).isPresent()) {
            modelMap.addAttribute("signupError", "true");
            modelMap.addAttribute("alert", "Имя пользователя занято");
            return "login-signUp";
        }
        signUpService.signUp(userForm);
        return "redirect:/login";
    }
}
