<?php

namespace Flashcards;

class Exam
{
	protected $_questions = [];
	protected $_scoreKeep;
	
	public function __construct($questions = [])
	{
		$this->_questions = $questions;
		$this->_scoreKeep = new Exam\ScoreKeep();
	}

	public function present()
	{
		if (count($this->_questions) > 0) {
			shuffle($this->_questions);
			$this->clear();
			$questionNumber = 1;
			foreach ($this->_questions as $question) {
				echo '[' .$questionNumber . '/' . count($this->_questions) . '] ' . $question['question'] . "\r\n";
				$choices = array_merge(['answer' => $question['answer']], $question['incorrect']);
				$shuffledChoices = $this->shuffleAnswers($choices);
				$answerNumber = 1;
				foreach ($shuffledChoices as $k => $choice) {
					echo "\t$answerNumber.$choice \r\n"; 
					if ($k === 'answer') $answerChoice = $answerNumber;
					$answerNumber++;	
				}

				$choice = '';
				do {	
					$choice = $this->getUserInput();
				} while (strlen($choice) < 2);
				
				if (trim($choice) == 'q') {
					$this->quit();
					return;
				} else if ($choice == $answerChoice) {
					echo "\r\nCorrect!\r\n";
					$this->_scoreKeep->correct();
				} else {
					echo "\r\nNope. The answer is:";
					echo "\r\n" . $question['answer'] . "\r\n";
					$this->_scoreKeep->wrong($question);
				}	
				
				$this->_scoreKeep->questionAttempted();				
				
				if (isset($question['explain'])) {
					echo "\r\n" . $question['explain'] . "\r\n";
					sleep(3);
				} else {
					sleep(2);
				}
				$this->clear();
				$questionNumber++;
			}
			$this->quit();
		}
	}

	protected function getUserInput()
	{
		$stdin = fopen('php://stdin', 'r');
		return fgets($stdin);
	}
	
	protected function shuffleAnswers($choices)
	{
		if (!is_array($choices)) return $choices;

		$keys = array_keys($choices);
		shuffle($keys);
		$shuffled = array();
		foreach ($keys as $key) {
			$shuffled[$key] = $choices[$key];
		}
		return $shuffled;
	}
	
	protected function getResults()
	{
		echo "You scored " . $this->_scoreKeep->getScore() . "\r\n";
	}

	protected function quit()
	{
		$this->clear();
		echo "Alright you're done.\r\n";
		$this->getResults();
		echo "\r\n[Q]uit, [R]etest missed questions, R[e]view missed questions\r\n\r\n";
		$this->getUserInput();
	}

	protected function clear()
	{
		system('clear');
	}
}
