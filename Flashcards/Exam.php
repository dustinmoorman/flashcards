<?php

namespace Flashcards;

class Exam
{
	protected $_questions = [];
	
	public function __construct($questions = [])
	{
		$this->_questions = $questions;
	}

	public function present()
	{
		if (count($this->_questions) > 0) {
			shuffle($this->_questions);
			system('clear');
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
					$stdin = fopen('php://stdin', 'r');
					$choice = fgets($stdin);
				} while (strlen($choice) < 2);

				if ($choice == $answerChoice) {
					echo "\r\nCorrect!\r\n";
				} else {
					echo "\r\nNope. The answer is:";
					echo "\r\n" . $question['answer'] . "\r\n";
				}	
				
				if (isset($question['explain'])) {
					echo "\r\n" . $question['explain'] . "\r\n";
					sleep(3);
				} else {
					sleep(2);
				}
				system('clear');
				$questionNumber++;
			}
			echo "\r\n And... you're done!\r\n";
			sleep(2);
		}
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
}
