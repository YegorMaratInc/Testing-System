package ru.licpnz.testingsystem.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.ContestForm;
import ru.licpnz.testingsystem.forms.ProblemForm;
import ru.licpnz.testingsystem.forms.UserEditForm;
import ru.licpnz.testingsystem.models.*;
import ru.licpnz.testingsystem.repositories.ContestRepository;
import ru.licpnz.testingsystem.repositories.ProblemRepository;
import ru.licpnz.testingsystem.repositories.UserRepository;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class AdminPanelController {
    private final ProblemRepository problemRepository;
    private final ContestRepository contestRepository;
    private final UserRepository userRepository;

    @Autowired
    public AdminPanelController(ProblemRepository problemRepository, ContestRepository contestRepository, UserRepository userRepository) {
        this.problemRepository = problemRepository;
        this.contestRepository = contestRepository;
        this.userRepository = userRepository;
    }

    @PostMapping("/create")
    public String postContestPage(ContestForm contestForm) throws ParseException {
        String start = contestForm.getStartTime();
        String finish = contestForm.getFinishTime();
        //2020-02-25T00:00
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-ddTHH:mm");

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
                .build();
        problemRepository.save(problem);

        File fileInput = new File(System.getProperty("user.dir") + File.separator + problem.getId() + File.separator + "input");
        File fileOutput = new File(System.getProperty("user.dir") + File.separator + problem.getId() + File.separator + "output");
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
                output.transferTo(new File(fileOutput + File.separator + "Output" + number + ".txt"));
                number++;
            } catch (IOException e) {
                System.out.println("\n");
            }
        }

        return "redirect:/contest/" + contestId;
    }

    @PostMapping("/edit/{userLogin}")
    public String editUser(@PathVariable String userLogin, UserEditForm userEditForm) {
        User user = userRepository.findUserByLogin(userLogin).orElseThrow(NotFoundException::new);
        user.setUserState(UserState.valueOf(userEditForm.getUserState()));
        user.setUserRole(UserRole.valueOf(userEditForm.getUserRole()));

        userRepository.save(user);
        return "redirect:/users";
    }

    @GetMapping("/edit/{userLogin}")
    public String getEditPage(@PathVariable String userLogin, ModelMap modelMap) {
        modelMap.addAttribute("user", userRepository.findUserByLogin(userLogin).orElseThrow(NotFoundException::new));
        ArrayList<String> roles = new ArrayList<>();
        ArrayList<String> states = new ArrayList<>();
        for (UserRole r : UserRole.values())
            roles.add(r.toString());
        for (UserState r : UserState.values())
            states.add(r.toString());
        //TODO remove shit-code
        modelMap.addAttribute("roles", roles);
        modelMap.addAttribute("states", states);

        return "userEdit";
    }

    @GetMapping("/users")
    public String users(ModelMap modelMap) {
        modelMap.addAttribute("users", userRepository.findAll());
        return "users";
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
