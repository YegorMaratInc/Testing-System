package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.QuestionForm;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.Question;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.repositories.QuestionRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

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

    @Autowired
    public QuestionController(QuestionRepository questionRepository, ProblemRepository problemRepository, ContestRepository contestRepository) {
        this.questionRepository = questionRepository;
        this.problemRepository = problemRepository;
    }

    @PostMapping("/question/{problemId}")
    public String postQuestion(QuestionForm questionForm, Authentication authentication, @PathVariable Long problemId) {
        Problem problem = problemRepository.findById(problemId).orElseThrow(NotFoundException::new);
        User author = ((UserDetailsImpl) authentication.getPrincipal()).getUser();
        //TODO create record in DB
        //check and criticize
        Question question = Question.builder()
                .question(questionForm.getQuestion())
                //.date(new Date())
                .answer("")
                .problem(problem)
                .owner(author)
                .isNotification(false)
                .build();
        questionRepository.save(question);
        return "redirect:/contest/" + problem.getContest().getId() + "/problem/" + problem.getShortName();
    }

    @GetMapping("/question/{problemId}")
    public String getQuestionsPage(ModelMap modelMap, @PathVariable Long problemId) {
        //TODO resolve question creation page
        return "question";
    }

    @GetMapping("problem/{problemId}")
    public List<Question> getQuestions(@PathVariable Long problemId) {
        Problem problem = problemRepository.findById(problemId).orElseThrow(NotFoundException::new);
        return questionRepository.findAllByProblem(problem);
    }
}
