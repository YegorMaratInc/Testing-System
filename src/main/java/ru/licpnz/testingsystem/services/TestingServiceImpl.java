package ru.licpnz.testingsystem.services;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.licpnz.testingsystem.exceptions.NotFoundException;
import ru.licpnz.testingsystem.forms.SubmissionForm;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.Submission;
import ru.licpnz.testingsystem.models.SubmissionState;
import ru.licpnz.testingsystem.models.User;
import ru.licpnz.testingsystem.repositories.LanguageRepository;
import ru.licpnz.testingsystem.repositories.SubmissionRepository;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Objects;

/**
 * 28/11/2019
 * TestingServiceImpl
 *
 * @author havlong
 * @version 1.0
 */
@Service
public class TestingServiceImpl implements TestingService {

    private final LanguageRepository languageRepository;

    private final SubmissionRepository submissionRepository;

    public TestingServiceImpl(LanguageRepository languageRepository, SubmissionRepository submissionRepository) {
        this.languageRepository = languageRepository;
        this.submissionRepository = submissionRepository;
    }

    @Override
    public void test(SubmissionForm submissionForm, Problem problem, User user) {
        /*
        Date time = new Date();
        if (time.after(problem.getContest().getFinishTime()) || time.before(problem.getContest().getStartTime()))
            throw new NotFoundException();
        Submission submission = Submission.builder()
                .submissionTime(time)
                .language(languageRepository.findLanguageByName(submissionForm.getLanguageName()).orElseThrow(NotFoundException::new))
                .owner(user)
                .pathToProgram(user.getLogin() + " " + new SimpleDateFormat().format(time))
                .state(SubmissionState.Q)
                .problem(problem).build();
        submissionRepository.saveAndFlush(submission);
        File dir = new File(submission.getPathToProgram());
        dir.mkdir();
        File program = new File(dir, submission.getLanguage().getProgramName());
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(program))) {
            writer.write(submissionForm.getProgram());
        } catch (IOException ignored) {
        }
        if (submission.getLanguage().getCompilationCommand() != null) {
            try {
                Process p = Runtime.getRuntime().exec(submission.getLanguage().getCompilationCommand(), null, dir);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        File toExe = new File(dir, submission.getLanguage().getCompiledFileName());
        if (!toExe.exists()) {
            submission.setState(SubmissionState.CE);
            submissionRepository.saveAndFlush(submission);
            return;
        }
        submission.setState(SubmissionState.T);
        try {
            Process testing = Runtime.getRuntime().exec(submission.getLanguage().getCompilationCommand(), null, dir);
            if (!testing.waitFor(submission.getProblem().getTimeLimit(),TimeUnit.SECONDS)) {

            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        */
        Date time = new Date();
        MultipartFile source = submissionForm.getProgram();
        /*if (time.after(problem.getContest().getFinishTime()) || time.before(problem.getContest().getStartTime()))
            throw new NotFoundException();*/
        SubmissionState state = SubmissionState.Q;

        Submission submission = Submission.builder()
                .language(languageRepository.findLanguageByName(submissionForm.getLanguageName()).orElseThrow(NotFoundException::new))
                .owner(user)
                .problem(problem)
                .submissionTime(time)
                .state(state)
                .lastTest(1)
                .pathToProgram("submissions" + File.separator + time.getTime())
                .build();

        submissionRepository.save(submission);
        File dir = new File(submission.getPathToProgram());
        File root = new File(System.getProperty("user.dir"));
        if (!dir.isDirectory()) {
            if (!dir.exists())
                if (!dir.mkdirs())
                    System.out.println("No");
        }

        String fourArg = "";
        String exeFileName = "Main";

        try {
            source.transferTo(new File(dir.getAbsolutePath() + File.separator + "Main" + submission.getLanguage().getExtension()));
            if (submission.getLanguage().getName().equals("GNU G++ 14")) {
                Process p = Runtime.getRuntime().exec("g++ -Wall -o Main Main.cpp", null, dir);
                while (p.isAlive())
                    Thread.sleep(100L);
            }
            if (submission.getLanguage().getName().equals("Java 1.8")) {
                Process p = Runtime.getRuntime().exec("javac Main.java", null, dir);
                while (p.isAlive())
                    Thread.sleep(100L);
                fourArg = "java ";
                exeFileName = "Main.java";
            }
            if (submission.getLanguage().getName().equals("Python 3.7")) {
                fourArg = "python3 ";
                exeFileName = "Main.py";
            }
            if (submission.getLanguage().getName().equals("PascalABC.NET")) {
                Process p = Runtime.getRuntime().exec("fpc Main.pas", null, dir);
                while (p.isAlive())
                    Thread.sleep(100L);
            }
        } catch (IOException | InterruptedException e) {
            System.out.println("Compile error");
        }

        if (!(new File(dir.getAbsolutePath(), exeFileName)).isFile()) {
            submission.setState(SubmissionState.CE);
            submissionRepository.save(submission);
            return;
        }

        submission.setState(SubmissionState.T);
        submissionRepository.save(submission);
        try {
            //TODO: list problem directory
            //TODO: for each problem
            //TODO: copy input to myEnv folder in submissionFolder
            //TODO: execute script.sh with parameters submission id and problem id
            //TODO: compare output with original by using checker
            File input = new File(root + File.separator + "problems" + File.separator + problem.getId() + File.separator + "input");
            File output = new File(dir, "output");
            output.mkdirs();
            int i = 1;
            for (File ignored : Objects.requireNonNull(input.listFiles())) {
                Files.copy(Paths.get(input + File.separator + "input" + i + ".txt"), new File(dir, "input" + i + ".txt").toPath());
                ProcessBuilder pb = new ProcessBuilder("./script.sh", String.valueOf(time.getTime()), String.valueOf(i++), fourArg, exeFileName);

                pb.redirectErrorStream(true);
                Process p = pb.start();
                IOUtils.copy(p.getInputStream(), System.out);
            }
            /*
            i = 1;
            for (File a : Objects.requireNonNull(output.listFiles())) {
                Reader answerCR = new FileReader(new File(root + File.separator + "problems" + File.separator + problem.getId() + File.separator + "output" + File.separator + "output" + i + ".txt"));
                Reader answerUR = new FileReader(new File(output + File.separator + "output" + i + ".txt"));

                char[] answerU = new char[50];
                answerUR.read(answerU);

                char[] answerC = new char[50];
                answerCR.read(answerC);

                System.out.println(answerU);
                System.out.println(answerC);

                i++;
            }*/
        } catch (IOException e) {
            e.printStackTrace();
        }
        //TODO make normal version with normal people
    }
}