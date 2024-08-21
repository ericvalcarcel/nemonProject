<?php
session_start();
require_once 'model/Calculator.php';
require_once 'view/CalculatorView.php';

class CalculatorController {
    private $model;
    private $view;

    public function __construct() {
        $this->model = new Calculator();
        $this->view = new CalculatorView();
    }

    public function handleRequest() {
        $operand1 = $_POST['operand1'] ?? null;
        $operand2 = $_POST['operand2'] ?? null;
        $operand3 = $_POST['operand3'] ?? null;
        $username = $_POST['username'] ?? null;

        if ($operand1 !== null && $operand2 !== null) {
            $result = $this->model->calculate($operand1, $operand2, $operand3);
            $previousUser = $this->model->getPreviousUser($operand1, $operand2, $operand3);
            $this->model->storeOperation($username, $operand1, $operand2, $operand3);
            $this->view->render($result, $previousUser);
        } else {
            $this->view->render();
        }
    }
}

$controller = new CalculatorController();
$controller->handleRequest();