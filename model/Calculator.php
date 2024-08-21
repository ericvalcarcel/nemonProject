<?php

class Calculator {
    private $operations = [];

    public function calculate($operand1, $operand2, $operand3) {
        if (is_numeric($operand1) && is_numeric($operand2) && is_numeric($operand3)) {
            return $operand1 + $operand2 + $operand3;
        } else {
            return $operand1 . $operand2 . $operand3;
        }
    }
    public function storeOperation($username, $operand1, $operand2, $operand3) {
        $_SESSION['operations'][] = [
            'username' => $username,
            'operands' => [$operand1, $operand2, $operand3]
        ];
    }

    public function getPreviousUser($operand1, $operand2, $operand3) {
        if (isset($_SESSION['operations'])) {
            foreach ($_SESSION['operations'] as $operation) {
                if ($operation['operands'] === [$operand1, $operand2, $operand3]) {
                    return $operation['username'];
                }
            }
        }
        return null;
    }
}