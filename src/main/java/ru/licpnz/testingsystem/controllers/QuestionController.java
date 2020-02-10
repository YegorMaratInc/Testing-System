package ru.licpnz.testingsystem.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.Question;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.repositories.QuestionRepository;

import java.util.List;

/**
 * 28/11/2019
 * QuestionController
 *
 * @author havlong
 * @version 1.0
 */
@Controller
public class QuestionController {
    private final QuestionRepository questionRepository;
    private final ProblemRepository problemRepository;

    public QuestionController(QuestionRepository questionRepository, ProblemRepository problemRepository) {
        this.questionRepository = questionRepository;
        this.problemRepository = problemRepository;
    }

    @GetMapping("contest/{contestId}/problem/{problemId}/ask")
    public String getQuestionsPage(@PathVariable Long contestId, @PathVariable Long problemId, ModelMap modelMap){
        Problem problem = problemRepository.findById(problemId).orElseThrow(NotFoundException::new);
        List<Question> questions = questionRepository.findAllByProblem(problem);
        modelMap.addAttribute("questions", questions);
        return "problemPanel";
    }

    @PostMapping("")
    public String QuestionsPage(){

        return "question";
    }
}
//TODO