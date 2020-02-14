package ru.licpnz.testingsystem.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.SubmissionForm;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.LanguageRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;
import ru.licpnz.testingsystem.services.TestingService;

/**
 * 28/11/2019
 * SubmitController
 *
 * @author havlong
 * @version 1.0
 */
@Controller
public class SubmitController {

    private final ContestRepository contestRepository;

    private final ProblemRepository problemRepository;

    private final LanguageRepository languageRepository;

    private final TestingService testingService;

    public SubmitController(ContestRepository contestRepository, ProblemRepository problemRepository, LanguageRepository languageRepository, TestingService testingService) {
        this.contestRepository = contestRepository;
        this.problemRepository = problemRepository;
        this.languageRepository = languageRepository;
        this.testingService = testingService;
    }

    @GetMapping("/submit/contest/{contestId}")
    public String getSubmitPage(@PathVariable("contestId") Long contestId, ModelMap modelMap) {
        Contest contest = contestRepository.findById(contestId).orElseThrow(NotFoundException::new);
        modelMap.addAttribute("problems", problemRepository.findAllByContest(contest));
        modelMap.addAttribute("languages", languageRepository.findAll());
        //TODO mark last language
        return "submit";
    }

    @GetMapping("/submit/contest/{contestId}/problem/{problemId}")
    public String getSubmitPage(@PathVariable("contestId") Long contestId, @PathVariable String problemId, ModelMap modelMap) {
        Contest contest = contestRepository.findById(contestId).orElseThrow(NotFoundException::new);
        modelMap.addAttribute("problems", problemRepository.findAllByContest(contest));
        modelMap.addAttribute("languages", languageRepository.findAll());
        modelMap.addAttribute("preferred", problemId);
        //TODO mark last language
        return "submit";
    }

    @PostMapping("/submit/problem/{problemId}")
    public String registerSubmission(@PathVariable("problemId") Long problemId, SubmissionForm submissionForm, Authentication authentication) {
        if (authentication == null)
            return "redirect:/login";
        Problem problem = problemRepository.findById(problemId).orElseThrow(NotFoundException::new);
        testingService.test(submissionForm, problem, ((UserDetailsImpl) authentication.getDetails()).getUser());
        return "redirect:/submissions/contest/" + problem.getContest().getId();
    }
}
