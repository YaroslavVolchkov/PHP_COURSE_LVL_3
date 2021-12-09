<?php

namespace application\views;

use application\core\View;

class TemplateEngine extends View {

    public function generatePage($data) {
        $templates = [
            'header' => file_get_contents($data['tplLinks']['header']),
            'footer' => file_get_contents($data['tplLinks']['footer']),
            'content' => $this->render($data['tplLinks']['content'], $data)
        ];
        echo $this->render($data['tplLinks']['main'], $templates);
    }

    private function render($tplLink, $data) {
        ob_start();
        require_once($tplLink);
        return ob_get_clean();
    }
}