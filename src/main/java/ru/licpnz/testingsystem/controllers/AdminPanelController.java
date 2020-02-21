package ru.licpnz.testingsystem.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.ContestForm;
import ru.licpnz.testingsystem.forms.ProblemForm;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.UserRole;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.security.details.UserDetailsImpl;

@Controller
public class AdminPanelController {
    private final ProblemRepository problemRepository;
    private final ContestRepository contestRepository;

    public AdminPanelController(ProblemRepository problemRepository, ContestRepository contestRepository) {
        this.problemRepository = problemRepository;
        this.contestRepository = contestRepository;
    }

    @PostMapping("/create")
    public String postContestPage(ContestForm contestForm) {
        Contest contest = Contest.builder()
                .title(contestForm.getTitle())
                .finishTime(contestForm.getFinishTime())
                .startTime(contestForm.getStartTime())
                .build();
        contestRepository.save(contest);

        return "redirect:/";
    }

    @PostMapping("/create/contest/{contestId}")
    public String postProblemPage(@PathVariable Long contestId, ProblemForm problemForm, Authentication authentication) {
        if (((UserDetailsImpl) authentication.getPrincipal()).getUser().getUserRole() != UserRole.ADMIN)
            return "redirect:/contest/" + contestId;
        System.out.println(((UserDetailsImpl) authentication.getPrincipal()).getUser().getUserRole());
        Problem problem = Problem.builder()
                .contest(contestRepository.findById(contestId).orElseThrow(NotFoundException::new))
                .content(problemForm.getContent())
                .inputFormat(problemForm.getInputFormat())
                .outputFormat(problemForm.getOutputFormat())
                .name(problemForm.getName())
                .shortName(problemForm.getShortName())
                .timeLimit(problemForm.getTimeLimit())
                .build();
        problemRepository.save(problem);

        return "redirect:/contest/" + contestId;
    }

    @GetMapping("/create")
    public String getCreateContestPage() {
        return "createContestPanel";
    }

    @GetMapping("/create/contest/{contestId}")
    public String getCreateProblemPage(@PathVariable Long contestId) {
        return "createProblemPanel";
    }


}
