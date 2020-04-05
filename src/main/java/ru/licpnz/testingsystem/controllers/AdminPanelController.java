package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.ContestForm;
import ru.licpnz.testingsystem.forms.ProblemForm;
import ru.licpnz.testingsystem.models.Contest;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class AdminPanelController {
    private final ProblemRepository problemRepository;
    private final ContestRepository contestRepository;

    @Autowired
    public AdminPanelController(ProblemRepository problemRepository, ContestRepository contestRepository) {
        this.problemRepository = problemRepository;
        this.contestRepository = contestRepository;
    }

    @PostMapping("/create")
    public String postContestPage(ContestForm contestForm) throws ParseException {
        String start = contestForm.getStartTime();
        String finish = contestForm.getFinishTime();
        //2020-02-25T00:00
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        Date startTime = format.parse(start);
        Date finishTime = format.parse(finish);

        Contest contest = Contest.builder()
                .title(contestForm.getTitle())
                .finishTime(finishTime)
                .startTime(startTime)
                .build();
        contestRepository.save(contest);

        return "redirect:/";
    }

    @PostMapping("/create/contest/{contestId}")
    public String postProblemPage(@PathVariable Long contestId, ProblemForm problemForm) {
        Problem problem = Problem.builder()
                .contest(contestRepository.findById(contestId).orElseThrow(NotFoundException::new))
                .content(problemForm.getContent())
                .inputFormat(problemForm.getInputFormat())
                .outputFormat(problemForm.getOutputFormat())
                .name(problemForm.getName())
                .shortName(problemForm.getShortName())
                .timeLimit(problemForm.getTimeLimit())
                .example(problemForm.getExample())
                .build();
        problemRepository.save(problem);

        File problems = new File(System.getProperty("user.dir"), "problems");
        if (!problems.exists())
            if (!problems.mkdirs())
                System.out.println("No");

        File fileInput = new File(System.getProperty("user.dir") + File.separator + "problems" + File.separator + problem.getId() + File.separator + "input");
        File fileOutput = new File(System.getProperty("user.dir") + File.separator + "problems" + File.separator + problem.getId() + File.separator + "output");
        if (!fileInput.exists()) {
            if (!fileInput.mkdirs()) {
                System.out.println("No");
            }
        }
        if (!fileOutput.exists()) {
            if (!fileOutput.mkdirs()) {
                System.out.println("No");
            }
        }
        int number = 1;
        for (MultipartFile input : problemForm.getInput()) {
            try {
                input.transferTo(new File(fileInput + File.separator + "input" + number + ".txt"));
                number++;
            } catch (IOException e) {
                System.out.println("\n");
            }
        }
        //возможны проблемы с порядком файлов
        number = 1;
        for (MultipartFile output : problemForm.getOutput()) {
            try {
                output.transferTo(new File(fileOutput + File.separator + "output" + number + ".txt"));
                number++;
            } catch (IOException e) {
                System.out.println("\n");
            }
        }

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
