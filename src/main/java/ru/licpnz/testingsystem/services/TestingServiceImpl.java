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

import java.io.ByteArrayOutputStream;
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
        Date time = new Date();
        MultipartFile source = submissionForm.getProgram();
        if (time.after(problem.getContest().getFinishTime()) || time.before(problem.getContest().getStartTime()))
            throw new NotFoundException();

        SubmissionState state = SubmissionState.Q;

        Submission submission = Submission.builder()
                .language(languageRepository.findLanguageByName(submissionForm.getLanguageName()).orElseThrow(NotFoundException::new))
                .owner(user)
                .problem(problem)
                .submissionTime(time)
                .state(state)
                .lastTest(1)
                .pathToProgram("submissions" + File.separator + time.getTime())
                .log("")
                .build();

        submissionRepository.save(submission);
        File dir = new File(submission.getPathToProgram());
        File root = new File(System.getProperty("user.dir"));
        if (!dir.isDirectory()) {
            if (!dir.exists())
                if (!dir.mkdirs())
                    System.out.println("No");
        }

        File subs = new File(root, "submissions");
        if (!subs.exists())
            if (!subs.mkdirs())
                System.out.println("NO");

        String fourArg = "";
        String exeFileName = "Main";
        String compileLog = "";
        String sep = File.separator;
        String os = System.getProperty("os.name").toLowerCase();
        //компиляция
        try {
            source.transferTo(new File(dir.getAbsolutePath() + sep + "Main" + submission.getLanguage().getExtension()));
            if (submission.getLanguage().getName().equals("GNU G++ 14")) {
                ProcessBuilder pb = new ProcessBuilder("g++", "-Wall", "-o", "Main", "Main.cpp");
                pb.redirectErrorStream(true);
                pb.directory(dir);
                Process p = pb.start();
                ByteArrayOutputStream error = new ByteArrayOutputStream();
                IOUtils.copy(p.getInputStream(), error);
                compileLog = error.toString();
                while (p.isAlive())
                    Thread.sleep(100L);
            }
            if (submission.getLanguage().getName().equals("Java 1.8")) {
                ByteArrayOutputStream error = new ByteArrayOutputStream();
                ProcessBuilder pb = new ProcessBuilder("javac", "Main.java");
                pb.directory(dir);
                pb.redirectErrorStream(true);
                Process p = pb.start();
                IOUtils.copy(p.getInputStream(), error);
                compileLog = error.toString();
                while (p.isAlive())
                    Thread.sleep(100L);
                fourArg = "java ";
                exeFileName = "Main.class";
            }
            if (submission.getLanguage().getName().equals("Python 3.7")) {
                fourArg = "python3 ";
                exeFileName = "Main.py";
            }
            if (submission.getLanguage().getName().equals("PascalABC.NET")) {
                ProcessBuilder pb = new ProcessBuilder("fpc", "Main.pas");
                pb.directory(dir);
                pb.redirectErrorStream(true);
                Process p = pb.start();
                ByteArrayOutputStream error = new ByteArrayOutputStream();
                IOUtils.copy(p.getInputStream(), error);
                compileLog = error.toString();

                while (p.isAlive())
                    Thread.sleep(100L);
            }
        } catch (IOException | InterruptedException e) {
            System.out.println("Compile error");
        }

        if (!(new File(dir.getAbsolutePath(), exeFileName)).isFile()) {
            compileLog = compileLog.substring(0, java.lang.Math.min(250, compileLog.length()));
            submission.setState(SubmissionState.CE);
            submission.setLog(compileLog);
            submissionRepository.save(submission);
            return;
        }
        submission.setState(SubmissionState.T);
        submissionRepository.save(submission);

        //исполнение
        try {
            File input = new File(root + sep + "problems" + sep + problem.getId() + sep + "input");
            File output = new File(dir, "output");
            if (!output.mkdirs()) {
                System.out.println("output not created");
                return;
            }
            int i = 1;


            for (File ignored : Objects.requireNonNull(input.listFiles())) {
                Files.copy(Paths.get(input + sep + "input" + i + ".txt"), new File(dir, "input" + i + ".txt").toPath());
                ProcessBuilder pb;
                if (submission.getLanguage().getId() == 2L) {
                    pb = new ProcessBuilder("./scriptForJava.sh", String.valueOf(time.getTime()), String.valueOf(i));
                } else
                    pb = new ProcessBuilder("./script.sh", String.valueOf(time.getTime()), String.valueOf(i), fourArg, exeFileName);
                pb.redirectErrorStream(true);
                Process p = pb.start();
                Thread.sleep(problem.getTimeLimit() * 1000);
                if (p.isAlive()) {
                    submission.setState(SubmissionState.TL);
                    submission.setLastTest(i);
                    submissionRepository.save(submission);
                    return;
                }
                ByteArrayOutputStream error = new ByteArrayOutputStream();
                IOUtils.copy(p.getInputStream(), error);
                if (!error.toString().equals("")) {
                    submission.setLastTest(i);
                    submission.setState(SubmissionState.RE);
                    if (error.toString().length() > 250)
                        submission.setLog(error.toString().substring(0, 250));
                    else submission.setLog(error.toString());
                    submissionRepository.save(submission);
                    return;
                }
                i++;
            }

            i = 1;

            for (File ignored : Objects.requireNonNull(output.listFiles())) {
                String answerU = Files.lines(Paths.get(output.getAbsolutePath() + sep + "output" + i + ".txt")).reduce("", String::concat);
                String answerC = Files.lines(Paths.get(root.getAbsolutePath() + sep + "problems" + sep + problem.getId() + sep + "output" + sep + "output" + i + ".txt")).reduce("", String::concat);

                //приводим вывод в божеский вид

                answerC = answerC.replace("\n", " ");
                answerU = answerU.replace("\n", " ");
                while (answerC.contains("  "))
                    answerC = answerC.replace("  ", " ");
                while (answerU.contains("  "))
                    answerU = answerU.replace("  ", " ");
                if (answerU.indexOf(" ") == 0) {
                    answerU = answerU.substring(1);
                }
                if (!answerC.equals(answerU)) {
                    submission.setLastTest(i);
                    submission.setState(SubmissionState.WA);
                    submissionRepository.save(submission);
                    return;
                }
                i++;
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
        submission.setState(SubmissionState.OK);
        submissionRepository.save(submission);
    }
}