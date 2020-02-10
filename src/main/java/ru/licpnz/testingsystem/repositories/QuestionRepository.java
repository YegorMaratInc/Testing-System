package ru.licpnz.testingsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.licpnz.testingsystem.models.Problem;
import ru.licpnz.testingsystem.models.Question;

import java.util.List;

/**
 * 28/11/2019
 * QuestionRepository
 *
 * @author havlong
 * @version 1.0
 */
public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findAllByProblem(Problem problem);
}
