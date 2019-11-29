package ru.licpnz.testingsystem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.licpnz.testingsystem.models.Language;

import java.util.Optional;

/**
 * 29.11.2019
 * LanguageRepository
 *
 * @author Havlong
 * @version v1.0
 */
public interface LanguageRepository extends JpaRepository<Language, Long> {
    Optional<Language> findLanguageByName(String name);
}
