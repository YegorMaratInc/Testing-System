package ru.licpnz.testingsystem.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.repositories.QuestionRepository;

@Controller
public class ProblemController {
    private final ProblemRepository problemRepository;
    private final QuestionRepository questionRepository;
    private final ContestRepository contestRepository;

    @Autowired
    public ProblemController(ProblemRepository problemRepository, QuestionRepository questionRepository, ContestRepository contestRepository) {
        this.problemRepository = problemRepository;
        this.questionRepository = questionRepository;
        this.contestRepository = contestRepository;
    }

    @GetMapping("contest/{contestId}/problem/{problemId}")
    public String getProblemPage(@PathVariable Long contestId, @PathVariable String problemId, ModelMap modelMap) {
        Contest contest = contestRepository.findById(contestId).orElseThrow(NotFoundException::new);
        Problem problem = problemRepository.findByContestAndShortName(contest, problemId).orElseThrow(NotFoundException::new);
        modelMap.addAttribute("problem", problem);
        modelMap.addAttribute("questions", questionRepository.findAllByProblem(problem));
        //TODO render detailed page with additional info
        return "problem";
    }
}
