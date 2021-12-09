<?php

namespace application\components;

class Paginator {

    private int $currentPage;

    private int $totalPages;

    public function __construct($currentPage, $totalPages) {
        $this->currentPage = $currentPage;
        $this->totalPages = $totalPages;
    }

    public function generateUserPagination() {
        $prevBtnParams = $this->getPrevButtonParams();
        $nextBtnParams = $this->getNextButtonParams();

        $numStartPage = $this->getNumStartPage();
        $numFinishPage = $this->getNumFinishPage();

        $output = $this->getButtonPrevNext($prevBtnParams['nameButton'], $prevBtnParams['numPage'], $prevBtnParams['enabled']);
        for ($i = $numStartPage; $i <= $numFinishPage; $i++) {
            $pageBtnParams = $this->getButtonPageParams($i);
            $output .= $this->getButtonPage($pageBtnParams[0], $pageBtnParams[1]);
        }
        $output .= $this->getButtonPrevNext($nextBtnParams['nameButton'], $nextBtnParams['numPage'], $nextBtnParams['enabled']);

        return $output;
    }

    public function generateAdminPagination() {
        $pagination = '';

        for ($i = 1; $i <= $this->totalPages; $i++) {
            if ($i === $this->currentPage) {
                $pagination .= "<a class=\"btnPaginationAdminActive\" href=\"" . URI_NAME . "/admin/$i\">$i</a>";
            } else {
                $pagination .= "<a class=\"btnPaginationAdmin\" href=\"" . URI_NAME . "/admin/$i\">$i</a>";
            }
        }
        return $pagination;
    }

    private function getPrevButtonParams() {
        $nameButton = 'Назад';
        $numPage = $this->currentPage;
        $enabled = false;
        if ($this->currentPage != 1) {
            $numPage--;
            $enabled = !$enabled;
        }
        return [
            'nameButton' => $nameButton,
            'numPage' => $numPage,
            'enabled' => $enabled
        ];
    }

    private function getNextButtonParams() {
        $nameButton = 'Вперед';
        $numPage = $this->currentPage;
        $enabled = false;
        if ($this->currentPage !== $this->totalPages) {
            $numPage++;
            $enabled = !$enabled;
        }
        return [
            'nameButton' => $nameButton,
            'numPage' => $numPage,
            'enabled' => $enabled
        ];
    }

    private function getButtonPrevNext($nameButton, $numPage , bool $enabled) {
        if (!$enabled) {
            return "<li class=\"page-item disabled\"><a class=\"page_link\">$nameButton</a></li>";
        }
        $link = URI_NAME . "/page/" . $numPage;
        return "<li class=\"page-item\"><a class=\"page_link\" href=\"$link\">$nameButton</a></li>";
    }

    private function getButtonPage($numPage, bool $isActive) {
        $link = URI_NAME . "/page/" . $numPage;
        if ($isActive) {
            return "<li class=\"page-item active\"><a class=\"page_link\" href=\"$link\">$numPage</a></li>";
        }
        return "<li class=\"page-item\"><a class=\"page_link\" href=\"$link\">$numPage</a></li>";
    }

    private function getButtonPageParams($index) {
        if ($index === $this->currentPage) {
            return [$index, true];
        }
        return [$index, false];
    }

    private function getNumStartPage() {
        if ($this->currentPage === $this->totalPages && $this->totalPages > 2) {
            return $this->currentPage - 2;
        }
        if ($this->currentPage > 1) {
            return $this->currentPage - 1;
        }
        return $this->currentPage;
    }

    private function getNumFinishPage() {
        if ($this->currentPage === 1 && $this->totalPages > 2) {
            return $this->currentPage + 2;
        }
        if ($this->currentPage < $this->totalPages) {
            return $this->currentPage + 1;
        }
        return $this->currentPage;
    }
}