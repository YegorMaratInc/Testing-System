package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.QuestionForm;
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
    private final ContestRepository contestRepository;

    @Autowired
    public QuestionController(QuestionRepository questionRepository, ProblemRepository problemRepository, ContestRepository contestRepository) {
        this.questionRepository = questionRepository;
        this.problemRepository = problemRepository;
        this.contestRepository = contestRepository;
    }

    @PostMapping("/question")
    public void postQuestion(QuestionForm questionForm, ModelMap modelMap) {
        Problem problem = problemRepository.findById(questionForm.getProblemId()).orElseThrow(NotFoundException::new);
        //TODO create record in DB
    }

    @GetMapping("/question/")
    public String getQuestionsPage() {
        //TODO resolve question creation page
        return "question";
    }

    @GetMapping("problem/{problemId}")
    public List<Question> getQuestions(@PathVariable Long problemId) {
        Problem problem = problemRepository.findById(problemId).orElseThrow(NotFoundException::new);
        return questionRepository.findAllByProblem(problem);
    }
}
