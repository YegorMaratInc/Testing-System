package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import ru.licpnz.testingsystem.models.Submission;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.repositories.SubmissionRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

import java.util.List;

@Controller
public class ProfileController {

    private final SubmissionRepository submissionRepository;

    @Autowired
    public ProfileController(SubmissionRepository submissionRepository) {
        this.submissionRepository = submissionRepository;
    }

    @GetMapping("/profile")
    public String getProfilePage(ModelMap modelMap, Authentication authentication) {
        User user = ((UserDetailsImpl) authentication.getPrincipal()).getUser();
        List<Submission> submissionList = submissionRepository.findAllByOwner(user);
        submissionList.sort((a, b) -> (int) (b.getSubmissionTime().getTime() - a.getSubmissionTime().getTime()));
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("submissions", submissionList);
        return "profile";
    }
}
