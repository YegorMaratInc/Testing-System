package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.SubmissionForm;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Language;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.LanguageRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.repositories.SubmissionRepository;
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

    private final SubmissionRepository submissionRepository;

    private final TestingService testingService;

    @Autowired
    public SubmitController(ContestRepository contestRepository, ProblemRepository problemRepository, LanguageRepository languageRepository, SubmissionRepository submissionRepository, TestingService testingService) {
        this.contestRepository = contestRepository;
        this.problemRepository = problemRepository;
        this.languageRepository = languageRepository;
        this.submissionRepository = submissionRepository;
        this.testingService = testingService;
    }

    @GetMapping("/submit/contest/{contestId}")
    public String getSubmitPage(@PathVariable("contestId") Long contestId, ModelMap modelMap, Authentication authentication) {
        Contest contest = contestRepository.findById(contestId).orElseThrow(NotFoundException::new);
        modelMap.addAttribute("contest", contest);
        modelMap.addAttribute("problems", problemRepository.findAllByContest(contest));
        modelMap.addAttribute("languages", languageRepository.findAll());
        User user = ((UserDetailsImpl) authentication.getPrincipal()).getUser();
        Language lastLanguage = submissionRepository
                .findFirstByOwnerOrderBySubmissionTimeDesc(user)
                .orElseThrow(NotFoundException::new)
                .getLanguage();
        modelMap.addAttribute("lastLanguage", lastLanguage);
        return "submit";
    }

    @GetMapping("/submit/contest/{contestId}/problem/{problemId}")
    public String getSubmitPage(@PathVariable("contestId") Long contestId, @PathVariable String problemId, ModelMap modelMap, Authentication authentication) {
        Contest contest = contestRepository.findById(contestId).orElseThrow(NotFoundException::new);
        modelMap.addAttribute("problems", problemRepository.findAllByContest(contest));
        modelMap.addAttribute("contest", contest);
        modelMap.addAttribute("preferred", problemId);
        modelMap.addAttribute("languages", languageRepository.findAll());
        User user = ((UserDetailsImpl) authentication.getPrincipal()).getUser();
        Language lastLanguage = submissionRepository
                .findFirstByOwnerOrderBySubmissionTimeDesc(user)
                .orElseThrow(NotFoundException::new)
                .getLanguage();

        modelMap.addAttribute("lastLanguage", lastLanguage);
        return "submit";
    }

    @PostMapping("/submit/contest/{contestId}/problem/{problemId}")
    public String registerSubmission(ModelMap modelMap, @PathVariable("problemId") String problemId, SubmissionForm submissionForm, Authentication authentication, @PathVariable Long contestId) {
        if (authentication == null)
            return "redirect:/login";
        Problem problem = problemRepository.findByContestAndShortName(contestRepository.findById(contestId).orElseThrow(NotFoundException::new), problemId).orElseThrow(NotFoundException::new);
        testingService.test(submissionForm, problem, ((UserDetailsImpl) authentication.getPrincipal()).getUser());
        return "redirect:/submissions/contest/" + contestId;
    }

    @PostMapping("/submit/contest/{contestId}")
    public String registerSubmission(ModelMap modelMap, SubmissionForm submissionForm, Authentication authentication, @PathVariable Long contestId) {
        if (authentication == null)
            return "redirect:/login";
        Problem problem = problemRepository.findById(submissionForm.getProblem()).orElseThrow(NotFoundException::new);
        User user = ((UserDetailsImpl) authentication.getPrincipal()).getUser();
        testingService.test(submissionForm, problem, user);
        return "redirect:/submissions/contest/" + contestId;
    }
}
