package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.models.Submission;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.repositories.SubmissionRepository;
import ru.licpnz.testingsystem.repositories.UserRepository;

import java.util.List;

@Controller
public class ProfileController {

    private final UserRepository userRepository;
    private final SubmissionRepository submissionRepository;

    @Autowired
    public ProfileController(UserRepository userRepository, SubmissionRepository submissionRepository) {
        this.userRepository = userRepository;
        this.submissionRepository = submissionRepository;
    }

    @GetMapping("profile/{userLogin}")
    public String getProfilePage(@PathVariable String userLogin, ModelMap modelMap) {
        User user = userRepository.findUserByLogin(userLogin).orElseThrow(NotFoundException::new);
        List<Submission> submissionList = submissionRepository.findAllByOwner(user);
        submissionList.sort((a, b) -> (int) (b.getSubmissionTime().getTime() - a.getSubmissionTime().getTime()));
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("submissions", submissionList);
        return "profile";
    }
}
