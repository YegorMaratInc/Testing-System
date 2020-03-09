package ru.licpnz.testingsystem.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

import java.util.Comparator;
import java.util.List;

/**
 * 28/11/2019
 * ProblemPanelController
 *
 * @author havlong
 * @version 1.0
 */
@Controller
public class ProblemPanelController {

    private final ProblemRepository problemRepository;
    private final ContestRepository contestRepository;

    public ProblemPanelController(ProblemRepository problemRepository, ContestRepository contestRepository) {
        this.problemRepository = problemRepository;
        this.contestRepository = contestRepository;
    }

    @GetMapping("contest/{contestId}")
    public String getProblemPanel(@PathVariable("contestId") Long contestId, ModelMap modelMap, Authentication authentication) {
        Contest contest = contestRepository.findById(contestId).orElseThrow(NotFoundException::new);
        List<Problem> problemList = problemRepository.findAllByContest(contest);
        problemList.sort(Comparator.comparing(Problem::getShortName));
        modelMap.addAttribute("problems", problemList);
        modelMap.addAttribute("contest", contest);
        modelMap.addAttribute("role", ((UserDetailsImpl) authentication.getPrincipal()).getUser().getUserRole().toString().equals("ADMIN"));
        return "problemPanel";
    }
}
