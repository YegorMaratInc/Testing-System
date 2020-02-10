package ru.licpnz.testingsystem.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.repositories.QuestionRepository;

@Controller
public class ProblemController {
    private final ProblemRepository problemRepository;
    private final QuestionRepository questionRepository;

    public ProblemController(ProblemRepository problemRepository, QuestionRepository questionRepository) {
        this.problemRepository = problemRepository;
        this.questionRepository = questionRepository;
    }

    @GetMapping("contest/{contestId}/problem/{problemId}")
    public String getProblemPage(@PathVariable Long contestId, @PathVariable Long problemId, ModelMap modelMap){
        Problem problem = problemRepository.findById(problemId).orElseThrow(NotFoundException::new);
        modelMap.addAttribute("problem", problem);
        modelMap.addAttribute("questions", questionRepository.findAllByProblem(problem));
        //спросить, как находить задачу по номеру контеста и номеру проблемы в этом контесте
        return "problem";
    }
}
