package ru.licpnz.testingsystem.models;

/**
 * 29.11.2019
 * SubmissionState
 *
 * @author Havlong
 * @version v1.0
 */
public enum SubmissionState {
    /**
     * Q  - В очереди
     * T  - Тестирование
     * WA - Неправильный ответ
     * TL - Превышение времени
     * ML - Превышение памяти
     * RE - Ошибка выполнения
     * CE - Ошибка компиляции
     * OK - Решение принято
     */
    Q, T, WA, TL, ML, OK, RE, CE
}
