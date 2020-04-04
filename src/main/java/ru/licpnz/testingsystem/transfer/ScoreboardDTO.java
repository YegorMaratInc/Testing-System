package ru.licpnz.testingsystem.transfer;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import ru.licpnz.testingsystem.models.User;

import java.util.List;

/**
 * 29.11.2019
 * ProblemDTO
 *
 * @author Havlong
 * @version v1.0
 */
@Data
@AllArgsConstructor
@Builder
public class ScoreboardDTO {
    private List<ProblemDTO> problemDTO;
    private User owner;
    private int total;
    private int count;
}

