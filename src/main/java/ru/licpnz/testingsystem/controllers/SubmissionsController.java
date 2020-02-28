package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.licpnz.testingsystem.models.Submission;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.repositories.SubmissionRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 28/11/2019
 * SubmissionsController
 *
 * @author havlong
 * @version 1.0
 */
@Controller
public class SubmissionsController {

    private final SubmissionRepository submissionRepository;

    @Autowired
    public SubmissionsController(SubmissionRepository submissionRepository) {
        this.submissionRepository = submissionRepository;
    }

    @GetMapping("/submissions/contest/{contestId}")
    public String getSubmissionsPage(@PathVariable("contestId") Long contestId, Authentication authentication, ModelMap modelMap) {
        if (authentication == null)
            return "redirect:/login";
        User user = ((UserDetailsImpl) authentication.getPrincipal()).getUser();

        List<Submission> submissionList = submissionRepository.findAllByOwner(user).stream().filter(submission -> submission.getProblem().getContest().getId().equals(contestId)).collect(Collectors.toList());
        modelMap.addAttribute("submissions", submissionList);
        return "submissions";
    }
}
