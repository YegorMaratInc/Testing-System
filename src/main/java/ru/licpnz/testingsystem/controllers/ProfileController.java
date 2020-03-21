package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.models.Submission;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.repositories.SubmissionRepository;
import ru.licpnz.testingsystem.repositories.UserRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

import java.util.List;

@Controller
public class ProfileController {

    private final SubmissionRepository submissionRepository;
    private final UserRepository userRepository;

    @Autowired
    public ProfileController(SubmissionRepository submissionRepository, UserRepository userRepository) {
        this.submissionRepository = submissionRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/profile")
    public String getProfilePage(ModelMap modelMap, Authentication authentication) {
        User user = ((UserDetailsImpl) authentication.getPrincipal()).getUser();
        List<Submission> submissionList = submissionRepository.findAllByOwner(user);
        submissionList.sort((a, b) -> (int) (b.getSubmissionTime().getTime() - a.getSubmissionTime().getTime()));
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("role", user.getUserRole().toString().equals("ADMIN"));
        modelMap.addAttribute("submissions", submissionList);
        return "profile";
    }

    @GetMapping("/profile/{login}")
    public String getProfile(@PathVariable String login, ModelMap modelMap, Authentication authentication) {
        User user = userRepository.findUserByLogin(login).orElseThrow(NotFoundException::new);
        List<Submission> submissionList = submissionRepository.findAllByOwner(user);
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("role", ((UserDetailsImpl) authentication.getPrincipal()).getUser().getUserRole().toString().equals("ADMIN"));
        submissionList.sort((a, b) -> (int) (b.getSubmissionTime().getTime() - a.getSubmissionTime().getTime()));
        modelMap.addAttribute("submissions", submissionList);
        return "profile";
    }
}
